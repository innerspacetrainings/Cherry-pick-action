#!/bin/bash

release=$1
email=$2
name=$3

if [ -z "$release" ]
then
  echo "No release label found, skipping cherry pick"
else
  commit="${GITHUB_SHA}"
  echo "Cherry picking commit with sha: ${commit}"
  git remote update
  git fetch --all
  git checkout "${release}"
  git config user.email "${email}"
  git config user.name "${name}"
  git cherry-pick "${commit}"
  CONFLICTS=$(git ls-files -u | wc -l)
  if [ "$CONFLICTS" -gt 0 ] ; then
    echo "There is a merge conflict. Aborting cherry pick."
    git cherry-pick --abort
    echo ::set-output name=success::false
  else
    echo "Cherry pick successful, pushing."
    git push -u origin "${release}"
    echo ::set-output name=success::true
  fi
fi
