all: site2


site2: site index.html publications.markdown  
	./site build
	cp -r _site/* _site2/

site: site.hs
	ghc site.hs

clean: 
	${RM} -r _site site site.o _cache site.hi
