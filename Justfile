root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
  @just --list --unsorted

# generate manual
doc:
  typst compile docs/manual.typ docs/manual.pdf
  typst compile docs/thumbnail.typ --format=png assets/images/page-{p}.png

# run test suite
test *args:
  tt run {{ args }}

# update test cases
update *args:
  tt update {{ args }}

# package the library into the specified destination folder
package target:
  ./scripts/package "{{target}}"

# install the library with the "@local" prefix
install: (package "@local")

# install the library with the "@preview" prefix (for pre-release testing)
install-preview: (package "@preview")

[private]
remove target:
  ./scripts/uninstall "{{target}}"

# uninstalls the library from the "@local" prefix
uninstall: (remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
uninstall-preview: (remove "@preview")

# check the template against PDF/A-3u and PDF/UA-1 with veraPDF
verapdf:
  #!/usr/bin/env bash
  set -euo pipefail
  . scripts/setup
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  mkdir -p "$tmp/preview/$PKG_PREFIX"
  ln -s "{{root}}" "$tmp/preview/$PKG_PREFIX/$VERSION"
  typst compile --package-path "$tmp" --pdf-standard a-3u,ua-1 template/main.typ "$tmp/main.pdf"
  for flavour in 3u ua1; do verapdf --flavour "$flavour" --format text --verbose "$tmp/main.pdf"; done

# run ci suite
ci: test doc
