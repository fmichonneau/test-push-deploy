#!/bin/bash

REPO_ORG=fmichonneau
REPO_NAME=test-push-deploy

cd .. &&
    rm -rf amy-feeds &&
    git clone https://github.com/carpentries/amy-feeds.git amy-feeds &&
    cd amy-feeds &&
    make amy &&
    cp _data/dc_amy.yml ../"$REPO_NAME"/_data/amy.yml

cd ../"$REPO_NAME" || exit
#git remote add deploy git@github.com:"$REPO_ORG"/"$REPO_NAME".git

git checkout master
git add _data/amy.yml
git commit -m "[ci skip] update workshop data"
#git push deploy master
