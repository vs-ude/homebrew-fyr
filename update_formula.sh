#!/bin/bash

URL="$(npm view fyrlang dist.tarball 2>/dev/null)"
VERSION="$(npm view fyrlang dist-tags.latest 2>/dev/null)"

rm fyrlang-*
wget -q "$URL"
SHA="$(sha256sum fyrlang-*.tgz | cut -d ' ' -f1)"

sed -i "s#url \".*\"#url \"$URL\"#" Formula/fyrlang.rb
sed -i "s#sha256 \".*\"#sha256 \"$SHA\"#" Formula/fyrlang.rb

if [[ `git status --porcelain` ]]; then
	printf "Updated the formula with the new URL and hash values:\n%s\n%s\n" $URL $SHA

	printf "Committing the changes\n"

	git add Formula/fyrlang.rb
	git commit "Automatic update to $VERSION"
else
	printf "Nothing changed\n"
fi
