#!/usr/bin/env bash
date_str=$(date '+%Y-%m-%d %H:%M')
echo "${date_str}: A day the Milky Way and the Andromeda Galaxy have not collided. Record it." >> ./record2.md
git add ./record2.md
git commit -m "[general update] ${date_str}."