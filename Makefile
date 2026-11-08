# SPDX-FileCopyrightText: Copyright 2026 Carabiner Systems, Inc
# SPDX-License-Identifier: Apache-2.0

# policyctl runs at the version pinned by the tool directive in go.mod.
# Override it to use another build: make docs POLICYCTL=/path/to/policyctl
POLICYCTL ?= go tool policyctl

# Policy files that are neither compiled nor documented, as paths relative to
# this file. Work in progress that does not parse yet goes here.
# sets/release/release-tag.hjson references the release policies on main;
# it compiles once they are merged there, then the exclusion goes.
EXCLUDE := sets/baseline/baseline-source-provenance.hjson sets/release/release-tag.hjson

# Policy sources: every .hjson file, plus every .json file without an .hjson
# sibling (the .hjson version is the source of truth when both exist).
# Fixtures under testdata and dot directories are never sources.
HJSON_SOURCES := $(filter-out $(EXCLUDE),$(sort $(shell find . \( -path ./testdata -o -path './.*' \) -prune -o -name '*.hjson' -print | sed 's|^\./||')))
JSON_SOURCES  := $(filter-out $(EXCLUDE) $(EXCLUDE:.hjson=.json),$(sort $(shell find . \( -path ./testdata -o -path './.*' \) -prune -o -name '*.json' -print | sed 's|^\./||')))
POLICY_SOURCES := $(HJSON_SOURCES) $(filter-out $(HJSON_SOURCES:.hjson=.json),$(JSON_SOURCES))

# One document per source, next to it with the .md extension, and one index
# per directory holding sources, as its README.md.
POLICY_DOCS    := $(addsuffix .md,$(basename $(POLICY_SOURCES)))
POLICY_DIRS    := $(sort $(dir $(POLICY_SOURCES)))
POLICY_INDEXES := $(addsuffix README.md,$(POLICY_DIRS))

# The HJSON files are the canonical sources. Every one of them has a JSON
# twin compiled from it, for consumers that read plain JSON; the twins are
# generated and must not be edited by hand. A failed compile leaves no
# half-written twin behind.
JSON_TWINS := $(addsuffix .json,$(basename $(HJSON_SOURCES)))

.PHONY: json
json: $(JSON_TWINS) ## Compile the JSON twin of every HJSON policy source

%.json: %.hjson
	$(POLICYCTL) compile $< > $@ || { rm -f $@; exit 1; }

.PHONY: docs
docs: $(POLICY_DOCS) $(POLICY_INDEXES) ## Generate the documentation of every policy material and the per directory indexes

# The .hjson rule comes first so it wins over a .json sibling.
%.md: %.hjson
	$(POLICYCTL) doc -o $@ $<

%.md: %.json
	$(POLICYCTL) doc -o $@ $<

# Each index lists the sources of its directory and is refreshed whenever
# one of them changes. Text outside the index markers of an existing
# README.md is preserved, so titles and introductions can be hand written.
define INDEX_RULE
$(1)README.md: $(foreach s,$(POLICY_SOURCES),$(if $(filter $(1),$(dir $(s))),$(s)))
	$$(POLICYCTL) doc index --title "$(patsubst %/,%,$(1))" -o $$@ $$^
endef
$(foreach d,$(POLICY_DIRS),$(eval $(call INDEX_RULE,$(d))))
