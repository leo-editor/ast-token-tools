#! /bin/bash
# Copy a file or directory from one git repository to another, and bring
# the object's commit history with it.
#
# Usage:
#
#   pushd path/to/source/repo
#   git-copy.sh  path/to/file/or/dir  path/to/destination/repo
#
# Adapted from work by @tsayen and others:
# https://gist.github.com/tsayen/f1c1c4d62d4fda77abf1586bd39f9b74
# https://stackoverflow.com/questions/1365541/how-to-move-files-from-one-git-repo-to-another-not-a-clone-preserving-history
#
echo "creating patch for path ${1}"
git log --name-only --pretty="format:" --follow  "${1}" \
 | sort -u | \
 xargs git log --pretty=email --patch-with-stat --reverse --full-index --binary -m --first-parent -- > "${2}/_patch_" \
&& echo "moving to destination repo at ${2}" \
&& cd "${2}" \
&& echo "applying patch" \
&& git am --committer-date-is-author-date -m --first-parent < _patch_ \
&& echo "OK"
