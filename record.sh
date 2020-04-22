#!/usr/bin/env bash

# init: 946656000 ==> 2000-01-01 00:00:00, GMT+08:00
# 946684800 ==> 2000-01-01 00:00:00, UTC
begin=$(($(cat ./begin) + 86400))
end=$(date '+%s')

list=$(seq "${begin}" 86400 "${end}")

for i in ${list}; do
    date -u --date=@"${i}" "+%Y-%m-%d: A day the Milky Way and the Andromeda Galaxy have not collided. Record it." >>./README.md
    echo >>./README.md

    echo "${i}" >./begin

    git add ./README.md
    git add ./begin
    git commit --date="${i}" --message="[general update] $(date -u --date=@"${i}" '+%Y-%m-%d')."
done
