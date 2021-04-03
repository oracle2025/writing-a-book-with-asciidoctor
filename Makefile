frontmatter.adoc: frontmatter.adoc.in
	sed  's/%GIT_SHA1%/'`git rev-parse HEAD`'/' frontmatter.adoc.in > frontmatter.adoc
