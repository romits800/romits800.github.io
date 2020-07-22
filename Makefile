all: index.html


index.html: site
	./site build
	cp -r _site/* _site2/

site: site.hs
	ghc site.hs

clean: 
	${RM} -r _site site site.o _cache site.hi
