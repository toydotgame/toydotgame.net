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

Then to run:
$	./jekyll-serve -lP 8080
(Optionally you can 1>/dev/null and `disown`, too)

