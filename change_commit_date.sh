#!/bin/bash

PREV_DATE=$(git log --format=%aD --reverse | tail -n 1)
NEW_DATE=$(date -d "$PREV_DATE + 1 month")
export GIT_AUTHOR_DATE="$NEW_DATE"
export GIT_COMMITTER_DATE="$NEW_DATE"

