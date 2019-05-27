all: wireshark.html

wireshark.html: header.html content.html footer.html
	cat $^ >$@

content.html: wireshark.md.html
	curl http://www.typograf.ru/webservice/ --data-urlencode text@$< --data chr=UTF-8 >$@
	sed -f recover-code.sed -i $@

wireshark.md.html: wireshark.md
	markdown <$< >$@

.PHONY: clean
clean:
	rm content.html wireshark.md.html wireshark.html
