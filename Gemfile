# AUTHOR: toydotgame
# CREATED: 2025-10-20
# Default Jekyll Gemfile, modified for GH Pages.
# Run with `bundle` rather than using system Gem:
# $ bundle exec jekyll serve
# Also update GH Pages if need be:
# $ bundle update github-pages

source "https://rubygems.org"
gem "github-pages", group: :jekyll_plugins # Requires the group(?)

group :jekyll_plugins do
  # The `github-pages` gem supplies the below (as of writing) (incl. on
  # deployment @ GitHub). This is specified here for clarity as to what I use:
  #gem 'jekyll-feed'
  gem 'jekyll-seo-tag'
  gem 'jekyll-sitemap'
end

# Default Jekyll Windows compat slop:
platforms :windows do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
  gem "wdm", "~> 0.1"
end

