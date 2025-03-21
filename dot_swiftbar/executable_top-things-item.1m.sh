#!/usr/bin/env bash

echo "⋅ $(osascript -e 'tell application "Things3" to get name of first to do of list "Today" whose status is not completed') ⋅"
