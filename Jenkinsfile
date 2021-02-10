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
	}
	post {
		always {
			archiveArtifacts artifacts: '*.pdf'
		}
	}
}
