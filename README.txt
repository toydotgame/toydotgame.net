This is the source tree for my personal website, toydotgame.net.

This is the `v6` branch, which requires Jekyll (as opposed to a _completely_
hardcoded static site). To develop, it'll require:
* Ruby ≥ 2.7.0
	* RubyGems
* GCC
* make

And additionally the Gems:
$	gem install jekyll bundler github-pages
$	bundle install

You can use `jekyll-serve.sh` to run a dev server:
$	./jekyll-serve.sh
This will also apply _config-dev.yml over the top of the production _config.yml.

This will automatically rebuild and reload attached browsers when you save
stuff. By default, `jekyll-serve.sh` pipes stderr to /dev/null; if you want
stderr spam, go do `bundle exec jekyll serve ...` instead.

The -B, --detach switch allows the server to run in the background, but it
can cause trouble on my sketchy Windows Bash setup that I do use sometimes,
therefore, you'll have to pass `-B` to `jekyll-serve.sh` yourself if you really
want it.
