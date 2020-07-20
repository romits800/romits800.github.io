all: index.html


index.html: site
	./site build

site: site.hs
	ghc site.hs

clean: 
	${RM} -r site site.o _cache site.hi
