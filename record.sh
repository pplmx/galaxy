#!/usr/bin/env bash
begin=$(($(cat ./begin) + 86400)) # init: 946656000 $ 2000-01-01
end=$(date '+%s')

list=$(seq "${begin}" 86400 "${end}")

for i in ${list}; do
    date -u --date=@"${i}" "+%Y-%m-%d: A day the milky way and the Andromeda Galaxy have not collided. Record it." >>./README.md
    echo >>./README.md

    echo "${i}" >./begin

    git add ./README.md
    git add ./begin
    git commit --date="${i}" --message="[general update] $(date -u --date=@"${i}" '+%Y-%m-%d')."
done
