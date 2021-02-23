pipeline {
	agent {
		dockerfile true
	}
	stages {
		stage('Asciidoctor Version') {
			steps {
				sh 'asciidoctor --version'
			}
		}
		stage('PDF') {
			steps {
				sh 'asciidoctor-pdf book.adoc'
			}
		}
		stage('EPUB3') {
			steps {
				sh 'asciidoctor-epub3 book.adoc'
			}
		}
		stage('EPUBCHECK') {
			steps {
				sh 'java -jar /tmp/epubcheck-4.2.4/epubcheck.jar book.epub'
			}
		}
	}
	post {
		always {
			archiveArtifacts artifacts: '*.pdf'
			archiveArtifacts artifacts: '*.epub'
		}
	}
}
