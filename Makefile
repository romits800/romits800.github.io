all: site2


site2: site index.html teaching.markdown publications.markdown contact.markdown about.markdown activities.markdown
	./site build
	cp -r _site/* _site2/

site: site.hs
	ghc site.hs

clean: 
	${RM} -r _site site site.o _cache site.hi
