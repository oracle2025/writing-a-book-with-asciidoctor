MASTER_FILENAME='book.adoc'
BUILD_DIR='build'
autoload :FileUtils, 'fileutils'

desc 'Build the HTML5 format'
task :html do
  # TODO move logic to images task
  ((FileList.new '**/*.{jpg,png,svg}').exclude %(#{BUILD_DIR}/**/*)).each do |img_path|
    target_dir = File.join BUILD_DIR, (File.dirname img_path)
    FileUtils.mkdir_p target_dir
    FileUtils.cp img_path, target_dir
  end
  require 'asciidoctor'
  Asciidoctor.convert_file MASTER_FILENAME,
    safe: :unsafe,
    to_dir: BUILD_DIR,
    mkdirs: true
end

desc 'Build the PDF format'
task :pdf do
  require 'asciidoctor-pdf'
  Asciidoctor.convert_file MASTER_FILENAME,
    safe: :unsafe,
    backend: 'pdf',
    to_dir: BUILD_DIR,
    mkdirs: true
end

desc 'Build the EPUB3 format'
task :epub, [:attrs] do |_, args|
  require 'asciidoctor-epub3'
  Asciidoctor.convert_file MASTER_FILENAME,
    safe: :unsafe,
    backend: 'epub3',
    attributes: [args[:attrs]].compact * ' ',
    to_dir: BUILD_DIR,
    mkdirs: true
end

desc 'Build all formats'
task default: [:html, :epub, :pdf]

desc 'Clean the build directory'
task :clean do
  FileUtils.remove_entry_secure BUILD_DIR if File.exist? BUILD_DIR
end
