#!/usr/bin/env bash

asciidoctor -b html5 -a linkcss -D temp *.adoc

for f in *.adoc ; do
  extension="${f##*.}"
  filename="${f%.*}"
  pandoc temp/${filename}.html -o docs/${filename}.md -f html-native_divs-native_spans -t markdown-header_attributes-link_attributes-native_divs-native_spans-raw_html-native_divs-native_spans-fenced_divs-bracketed_spans
done

rm -r temp
