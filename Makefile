.PHONY: page

page: index.html

page.html: page.md
	pandoc page.md -s --smart -o $@

index.html: page.html footer.html
	cat $^ >$@
