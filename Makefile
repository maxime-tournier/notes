
# this is meant to be run from within emacs (with server started)
first: publish

org-publish: 
	emacsclient -eval '(org-publish-all)'

publish: org-publish
	rm -vf `find ~/notes/ -name '*~' -or -name '*.pdf'`; 

%.pdf: publish
	@phantomjs js/rasterize.js ~/notes/$*.html $*.pdf A4

clean:
	rm -vf `find -name '*~'`


toc:
	touch `find ~/org -name 'index.org'`

