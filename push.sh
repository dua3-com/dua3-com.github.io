#!/usr/bin/env bash

#checkout github pages
rm -r .gh-pages
mkdir .gh-pages
cd .gh-pages
git init
git remote add origin https://github.com/dua3-com/dua3-com.github.io.git
git checkout -b gh-pages

# clean contents
rm -r ../.gh-pages/*

# build the site
jekyll build

# copy to github-pages
cp -r ../_site/* ../.gh-pages/

# create .nojekyll
touch ../.gh-pages/.nojekyll

# add files
git add -A

# commit
git commit -m "update github-pages"

# push
git push origin gh-pages
