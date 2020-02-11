#!/usr/bin/env bash

#checkout github pages
rm -rf .gh-pages
mkdir .gh-pages
cd .gh-pages
git clone -b gh-pages https://github.com/dua3-com/dua3-com.github.io.git

# clean contents
rm -rf ../.gh-pages/*

# build the site
( cd .. && bundle exec jekyll build )

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
