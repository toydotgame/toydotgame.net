#!/bin/sh
# AUTHOR: toydotgame
# CREATED: 2025-10-21
# Simple shortcut to make sure to use Bundler/Gemfile always for Jekyll.

bundle exec jekyll serve $@ 2>/dev/null

