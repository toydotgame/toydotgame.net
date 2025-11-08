---
title: Blog
# Jekyll permalinks /blog[.md|.html] to /blog/[index.html] for some reason I
# totally have read but am yet too dumb to learn. Probably related to the fact
# that _posts has a permalink root to /blog/ and therefore /blog/ _exists_, so
# some page called "/blog" should actually be called "/blog/[index...]" for
# continuity. I don't know. Whatever.
# BUT!!! GUESS WHAT!!! INTERNALLY IT STILL CALLS IT /blog.html!!! SO WE GOTTA
# PERMALINK IT IF WE WANT OUR NAV AND FOOTER DYNAMIC STUFF TO WORK!!! :DDDDDD
permalink: /blog/
---

I like writing things. Stupid things that no one *reasonably* should care about,
yet I write anyway. For the five people who are the target audience of each
article, I love you.

{% comment %} Stupid container div because Kramdown froths at the mouth seeing
indented Liquid syntax "Ooh! Must be <pre>!!!" NO. {% endcomment %}
<div markdown="0">
	{% comment %} Adapted from
	https://stackoverflow.com/a/20777475: {% endcomment %}

	{% for post in site.posts %}
		{% assign postYear = post.date | date:"%Y" %}
		{% if postYear != lastPostYear %}
			{% unless forloop.first %}</ul>{% endunless %}

			<h2>{{ postYear }}</h2>
			<ul class="blog-article-list">
			
			{% assign lastPostYear = postYear %}
		{% endif %}

		<li>
			<a href="{{ post.url }}">
				<b>{{ post.date | date:"%Y-%m-%d" }}:</b> {{ post.title }}
			</a>
		</li>

		{% if forloop.last %}</ul>{% endif %}
	{% endfor %}
</div>
