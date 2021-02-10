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
				sh 'PATH=$PATH:$HOME/.local/share/gem/ruby/2.7.0/bin asciidoctor-pdf book.adoc'
			}
		}
	}
	post {
		always {
			archiveArtifacts artifacts: '*.pdf'
		}
	}
}
