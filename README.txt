This is the source tree for my personal website, toydotgame.net.

This incarnation's branch, `v6`, is an indev fork. I am migrating my site to
Jekyll (/Markdown in general) in order to make it a little more portable than
full-on HTML markup changes that require changing _everything_.

As such, it now requires a little more than just a httpd to develop. It
requires:
* Ruby ≥ 2.7.0
	* RubyGems
* GCC
* make

And additionally the Gems:
$	gem install jekyll bundler github-pages
$	bundle install

You can use `jekyll-serve.sh` to run a dev server:
$	./jekyll-serve.sh [args-not-in-_config.yml]
This will automatically rebuild when you save files. I've elected not to use
LiveReload/etc by default, to best accomodate my muscle memory when I developed
with Apache. By default, `jekyll-serve.sh` pipes stderr to /dev/null; if you
want stderr spam, go do `bundle exec jekyll serve ...` instead.
The -B, --detach switch allows the server to run in the background, but it
can cause trouble on my sketchy Windows Bash setup that I do use sometimes,
therefore, you'll have to pass `-B` to `jekyll-serve.sh` yourself if you really
want it.

