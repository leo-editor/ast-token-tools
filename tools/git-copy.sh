#! /bin/bash
# adapted from https://gist.github.com/tsayen/f1c1c4d62d4fda77abf1586bd39f9b74
# Usage:
#   pushd path/to/source/repo
#   ./git-copy.sh  path/to/file/or/dir  path/to/destination/repo
echo "creating patch for path ${1}"
git log --name-only --pretty="format:" --follow  "${1}" \
 | sort -u | \
 xargs git log --pretty=email --patch-with-stat --reverse --full-index --binary -m --first-parent -- > "${2}/_patch_" \
&& echo "moving to destination repo at ${2}" \
&& cd "${2}" \
&& echo "applying patch" \
&& git am --committer-date-is-author-date < _patch_ \
&& echo "OK"