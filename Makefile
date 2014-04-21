MODULE			:= MODULE_NAME
EXPORT 			:= $(MODULE)
BUILD_DIR 		:= build
BUNDLE 			:= $(BUILD_DIR)/$(MODULE).js
DEMO_BUNDLE 	:= demo/bundle.js
DEMO_ENTRY 		:= demo/main.js
ENTRY			:= index.js
BINS 			:= ./node_modules/.bin

#
#

SRC := $(ENTRY)
ifneq ($(wildcard lib),)
	SRC += $(shell find lib -type f -name '*.js')
endif

.PHONY: all bundle demo clean info watch

all: bundle demo

bundle: $(BUNDLE)

demo: $(DEMO_BUNDLE)

clean:
	rm -f $(BUNDLE)
	rm -f $(DEMO_BUNDLE)

info:
	@echo "Source:" $(SRC)

watch:
	watchify -o $(DEMO_BUNDLE) $(DEMO_ENTRY) &

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUNDLE): $(BUILD_DIR) $(SRC)
	browserify -s $(EXPORT) $(ENTRY) | $(BINS)/uglifyjs > $@

$(DEMO_BUNDLE): $(DEMO_ENTRY) $(SRC)
	browserify $(DEMO_ENTRY) > $@
