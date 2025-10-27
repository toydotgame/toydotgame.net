---
# AUTHOR: toydotgame
# CREATED: 2025-10-26
# Markdown file containing all of the various formatting features available to
# a standard content area's text. This also includes the YAML front matter.

# MANDATORY:
title: "{{ title }}"

# OPTIONAL:
date:      1970-01-01 # Won't render if unspecified; _posts already has this
                      # info automatically and thus doesn't need to be specified
updated:   2000-01-01 # Won't render if unspecified
mathjax:   true       # Won't download by default; specify `true` to load JS
published: false      # Only built by the dev config. Typically, draft pages
                      # are put in _drafts/ and only rendered by the dev
                      # launch script, but some pages (like this) are special
aero-icon: /media/resources/aerico/book.png # Passed to the CSS; defaults to
                                            # info.png for all pages, and
                                            # book.png for _posts
---

This is the markdown contents for this file. The navigation and footer elements
are defined as in their respective `_includes/` documents. By default, all pages
use the `base` layout—except for pages in the `_posts/` directory, which use the
`blog` layout; the only difference between these two being that `blog` specifies
a different so-called "Aero window" icon than the standard `base` layout.

Speaking of which, text can be formatted as _italic_, **bold**, ***bold
italic***, <u>underlined</u>, ~~struck through~~, <small>small</small>,
`monospaced`, or various combinations of the above. Markdown and HTML styles can
even be **<u>combined</u>**, so long as all of the Markdown presentation is
**outside**, and the HTML tags stay on the **inside**.<br>
You can also specify a short line break (instead of a paragraph break) using the
`<br>` tag, like this line has had done to it!
<!-- And, of course, because Markdown is just HTML for dummiez, comments are
     like this! :3 -->
<hr>
A horizontal rule appears like that! ↑

There's a reference here![^1] Hopefully there's a reference list at the bottom
to explain it! References can also have any name.[^any-name]

[^1]: Definition for ref #1. I'm actually defined up where the in-line citation is, but I ended up here at the bottom of the page! An important thing to note is that literal newlines WILL break me (and thus you can't maintain the 80 cols manual wrapping in the markup alas)

[Link to Google.com](https://google.com/)
[Link to a destination you hopefully can't visit](https://)

This line has a citation that has already had its definition above![^1]

## Images
Images can be done in basic markdown syntax:

![Image alt text](https://placecats.com/408/287)

However, for setting sizes, floats, or captions, you'll need to fall back to our
old HTML markup:
<figure class="fleft" style="width:35%">
	<img src="http://placecats.com/200/287" />
	<figcaption>This image is floated to one side with a custom width. You can float left, centre, or right. Or leave <code>width</code> empty for a full-width image!</figcaption>
</figure>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et eros vel mi scelerisque eleifend quis id urna. Vestibulum suscipit egestas tortor elementum mattis. Vivamus a ex et elit congue condimentum. Nulla facilisi. In venenatis porttitor velit a rhoncus. Curabitur dictum luctus nulla, et rhoncus tellus luctus id. Vivamus ullamcorper et elit semper pellentesque. Mauris a nunc et nisl iaculis ullamcorper. Morbi tempus odio hendrerit nibh feugiat pulvinar. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis eu malesuada libero, in gravida velit. Aenean sit amet justo eros. Vestibulum eu posuere diam.

<img class="fright" src="http://placecats.com/200/287" width="38%" />
Mauris lacinia, enim quis vulputate ultricies, nibh nibh pellentesque neque, finibus ultricies elit quam quis orci. Duis egestas vestibulum elit at mattis. Nullam lacinia quam quam, non lobortis enim bibendum in. Nam a scelerisque sapien, eget tempus enim. Vivamus in facilisis nunc, fringilla euismod diam. Praesent blandit eget odio eu aliquet. Vestibulum euismod convallis lorem, a euismod lacus sagittis vitae.

**Remember to put your paragraph breaks in properly when you're anchoring an
image to some paragraph!** Also note that the padding on images and figures
will constitute 2% of whatever percentage width you're specifying here in the
markup.

## More block-level stuff
* Unordered list
* Unordered list
- List item with a different bullet type
+ Despite the different bullets, they all constitute the same `<ul>` block

1. Ordered list
   1. Sub item 1
   2. Sub item 2
2. Ordered list
4. List item with # 4 instead of 3

a. Ordered list with different list marker
b. Ordered list
e. Ordered list with _e_ instead of _c_

As you can see, for ordered lists, they don't really respect the markers. This
is kinda cool for unordered lists, making the very open-ended, but for our own
purposes, we'll have to default to HTML for customising stuff more, e.g:
```html
<ol type="a">
	<li>Foo</li>
	<li>Bar</li>
	<li>Baz</li>
</ol>
```

_See also: [`list-style-type` on MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)._

```
Regular <pre> thingo...
This line has a lot of words in it because I want to show you how the overflow will give you a horizontal scroll bar if you so need it (as opposed to a break, which is what the normal body text would do)
```

```sh
export FOO=bar
echo $(curl -sL ifconfig.co) >&2
# This should have Shell syntax highlighting
	# This indent should also look right
```

Another cool thing is that you can add a syntax highlighting langage to inline
code blocks!: `export BAR="foo"`{:.language-sh} (using [span
IALs](https://kramdown.gettalong.org/syntax.html#inline-attribute-lists))

> ## Blockquotes!
> This is a block quote using the markdown syntax. It _should_ in theory support
> everything you can normally do (Markdown, HTML, or whatever) in the regular
> text. $\LaTeX\text{ should work here too.}$
> #### Heading 4 in here!

> This quote is short and shouldn't be full-width!

<aside class="fleft" style="width:75%">
	Text inside aside but not in paragraph tag!
	<blockquote>Nested blockquote! Notice how the parent quote is used as a container instead!</blockquote>
	This aside has a custom `width`, which block quotes should support too! (If
	you write them in HTML and not MD, that is) Unlike quotes, asides can be
	floated as you wish!
</aside>

# Heading 1
This is generally reserved for title styles but hey you _can_ use it… (Please
don't)
## Heading 2
### Heading 3 {#this-one}
#### Heading 4
##### Heading 5
###### Heading 6
Note that Kramdown produces slug `id` attributes for every heading you make. But
if you want to manually specify an ID, you can append `` {#the-id-text}`` to the
header's text, [as I did for Heading 3 above](#this-one)!


| Left aligned | Centre aligned | Right aligned | Default aligned |
| :----------- | :------------: | ------------: | --------------- |
| 1            | 2              | 3             | 4               |
| Normal inline text formatting | can still be used! | However, most block stuff _won't_ | so in that case use a full explicit HTML table… |


## *Wait, so how do line breaks work with Markdown 'n' all?*
Ah! Joy! So there's a few ways to put newlines in your Markdown that appear in
either the HTML markup and/or the final rendered document:
1. **Newline followed immediately by text:** This is done in the Markdown here to
   maintain a vague 80-cols rule for readability on my tiny ass laptop. This
   _will_ actually convert to newlines within the text content of the `<p>` tags
   Jekyll generates—**however**, HTML whitespace collapse will mean newlines in
   HTML markup won't render like that, which I choose as my desired behaviour
2. **Line ending in `<br>` followed by text:** This processes as a single HTML
   paragraph, i.e. `<p>Your text...<br>The next line...</p>`
3. **Two newlines (i.e. an empty line between lines of text):** Jekyll turns this
   into two separate `<p>` tags
	* This actually works for any $n \geq 2$ newlines. They're all condensed and
	  parse as just two separate paragraph tags
4. **`<br>` on its own line:** It's actually a combination of 1 and 2! The
   newlines in Markdown are preserved literally, and the `<br>` is passed
   through as well! This forms **one single `<p>` tag for both text sections**

So **TL;DR:** Single newlines are preserved (and HTML does nothing with them),
2+ newlines always just start a new paragraph tag, and `<br>`s are passed
through verbatim as well.

## $\LaTeX$
You can specify $\text{inline }\LaTeX$ using `$` delimiters. Use of `` $` `` and
`` `$ `` to explicitly define the start and end of the equation works too, and
also allows for use of `$`s a little more loosely: $\` $5 \`$.<br>
For block-level maths, you can do `$$` start and end tags as normal:

$$\begin{align}
x &= \frac{-b \pm \sqrt{b^2 - 4ac}}{2a} \\
&= \text{Alignment works!} \\
&= \begin{cases}
	\text{cases}, &&\text{also} \\
	\text{work}, &&\text{too!}
\end{cases}
\end{align}$$

$$
\text{This text here, in a }\LaTeX\text{ equation display block SHOULD be super long and also trigger a horizontal overflow, i.e. when your equation has a ton of description text in it/whatever}
$$

**Please note!** Due to how Kramdown processes `$$` specifically (I don't think
this applies to the other MathJax "display" equation delimiters), there
<u>must</u> be empty lines around the LaTeX block, such that Kramdown parses the
equation block as its own block-level paragraph. **Otherwise, it will display
inline.**
