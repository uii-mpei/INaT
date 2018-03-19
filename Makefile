.PHONY: all

SRC_DIR := $(PWD)
DST_DIR := $(PWD)/page
TMP_DIR := $(shell mktemp -d)

LOCAL := n

CSS_REL = assets/styles/style.css
ifeq ($(LOCAL),y)
	CSS = file://$(abspath $(DST_DIR)/..)/$(CSS_REL)
else
	CSS = /study/courses/$(CSS_REL)
endif

LECTURES = \
	lecture02

LABS = \
	lab03 \
	lab04 \
	lab05

.PHONY: $(LECTURES) $(LABS)

all: $(DST_DIR)/index.html $(LECTURES) $(LABS)


$(DST_DIR)/index.html: $(TMP_DIR)/page.md.html
	cp $< $@


LEC02_DIR = lecture/02-layer2
LEC02_SRC_DIR = $(SRC_DIR)/$(LEC02_DIR)
LEC02_SRC_DIR = $(DST_DIR)/$(LEC02_DIR)
LEC02_FIGURES = \
	arch.png \
	arp-packet.jpg \
	ethernet-frame.svg \
	mac-address.svg \
	vlan-frame.svg \
	vlan.gif

lecture02: \
	$(DST_DIR)/$(LEC02_DIR)/index.html \
	$(foreach file,$(LEC02_FIGURES),$(DST_DIR)/$(LEC02_DIR)/$(file))

$(DST_DIR)/$(LEC02_DIR)/index.html: $(TMP_DIR)/$(LEC02_DIR)/lecture02-layer2.md.html
	mkdir -p $(dir $@) && cp $^ $@


LAB03_DIR = lab/03-udp
LAB03_FIGURES = \
	linux.jpg

lab03: \
	$(DST_DIR)/$(LAB03_DIR)/index.html \
	$(foreach file,$(LAB03_FIGURES),$(DST_DIR)/$(LAB03_DIR)/$(file))

$(DST_DIR)/$(LAB03_DIR)/index.html: $(TMP_DIR)/$(LAB03_DIR)/lab03-udp.md.html
	mkdir -p $(dir $@) && cp $^ $@


LAB04_DIR = lab/04-tcp-client
LAB04_FILES = \
	lab05-tcp-server \
	lab05-tcp-server.exe

lab04: \
	$(DST_DIR)/$(LAB04_DIR)/index.html \
	$(foreach file,$(LAB04_FILES),$(DST_DIR)/$(LAB04_DIR)/$(file))

$(DST_DIR)/$(LAB04_DIR)/index.html: $(TMP_DIR)/$(LAB04_DIR)/lab04-tcp-client.md.html
	mkdir -p $(dir $@) && cp $^ $@


LAB05_DIR = lab/05-tcp-server
LAB05_FILES = \
	listing.h

lab05: \
	$(DST_DIR)/$(LAB05_DIR)/index.html \
	$(foreach file,$(LAB05_FILES),$(DST_DIR)/$(LAB05_DIR)/$(file))

$(DST_DIR)/$(LAB05_DIR)/index.html: $(TMP_DIR)/$(LAB05_DIR)/lab05-tcp-server.md.html
	mkdir -p $(dir $@) && cp $^ $@


$(TMP_DIR)/%.md.html: $(SRC_DIR)/%.md $(SRC_DIR)/footer.html
	mkdir -p $(dir $@)
	pandoc \
		--filter pandoc-crossref \
		--standalone \
		--smart \
		--css $(CSS) \
		--include-after-body $(SRC_DIR)/footer.html \
		$< --output $@

$(DST_DIR)/%: $(SRC_DIR)/%
	mkdir -p $(dir $@) && cp "$^" "$@"
