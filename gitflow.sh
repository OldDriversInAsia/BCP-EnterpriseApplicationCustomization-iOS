#!/bin/sh
git config --global user.email "930502900@qq.com"
git config --global user.name "yuri"

git add .
git commit -am "$(date +%Y%m%d)"
git push origin develop:develop

