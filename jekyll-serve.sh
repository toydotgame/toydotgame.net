#!/bin/sh
# AUTHOR: toydotgame
# CREATED: 2025-10-21
# Simple shortcut to make sure to use Bundler/Gemfile always for Jekyll.

JEKYLL_ENV=development # Also the default if we left it unset
JEKYLL_LOG_LEVEL=error
bundle exec jekyll serve --config _config.yml,_config-dev.yml $@

