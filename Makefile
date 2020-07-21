all: index.html


index.html: _site
	./site build
	cp -r _site/* _site2/

_site: site.hs
	ghc site.hs

clean: 
	${RM} -r _site site site.o _cache site.hi
