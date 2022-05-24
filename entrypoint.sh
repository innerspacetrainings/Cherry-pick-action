echo "hello"
##!/bin/sh -l
#
#release=$1
#email=$2
#name=$3
#
#if [ -z "$release" ]
#then
#  echo "No release label found, skipping cherry pick"
#else
#  commit="${GITHUB_SHA}"
#  echo "Cherry picking commit with sha: ${commit}"
#  git remote update
#  git fetch --all
#  git checkout "${release}"
#  git config user.email "${email}"
#  git config user.name "${name}"
#  CP=$(git cherry-pick "${commit}")
#  echo "Cherry pick complete ${CP}"
#  CONFLICTS=$(git ls-files -u | wc -l)
#  if [ "$CONFLICTS" -gt 0 ] ; then
#    echo "There is a merge conflict. Aborting cherry pick."
#    git cherry-pick --abort
#    branchName="test"
#    git branch ${branchName} "${commit}"
#    git push origin ${branchName}
#    echo ::set-output name=branch::"${branch-name}"
#    echo ::set-output name=create-pr::"false"
#  else
#    echo "Cherry pick successful, pushing."
#    git push -u origin "${release}"
#    echo ::set-output name=create-pr::"true"
#  fi
#fi
