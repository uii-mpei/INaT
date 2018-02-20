.PHONY: all

SRC_DIR := $(PWD)
DST_DIR := $(PWD)/page
TMP_DIR := $(shell mktemp -d)

all: $(DST_DIR)/index.html lecture02


$(DST_DIR)/index.html: $(TMP_DIR)/page.html
	cp $< $@


.PHONY: lecture02

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

$(DST_DIR)/$(LEC02_DIR)/index.html: $(TMP_DIR)/$(LEC02_DIR)/lecture02-layer2.html
	mkdir -p $(dir $@) && cp $^ $@


$(TMP_DIR)/%.html: $(SRC_DIR)/%.md $(SRC_DIR)/footer.html
	mkdir -p $(dir $@)
	pandoc -F pandoc-crossref -s --smart $< -o $(TMP_DIR)/$(notdir $<).html
	cat $(TMP_DIR)/$(notdir $<).html $(SRC_DIR)/footer.html >$@

$(DST_DIR)/%: $(SRC_DIR)/%
	mkdir -p $(dir $@) && cp "$^" "$@"
