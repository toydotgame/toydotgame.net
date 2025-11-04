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
banner:    http://placecats.com/200/50 # Won't render if unspecified
---

## Inline styles
Paragraph<br>
_Italic 1_ *Italic 2* <i>Italic 3</i><br>
**Bold 1** __Bold 2__ <b>Bold 3</b><br>
~~Strikethrough 1~~ <s>Strikethrough 2</s><br>
`Monospace 1` ``Monospace 2`` <code>Monospace 3</code><br>
<u>Underline</u><br>
[Internal link]() [External link](){:.external}
[External link w/ `.noexternal`](){:.noexternal}<br>
<abbr>Abbreviation</abbr><br>
<small>Small</small><br>
<sup>Superscript</sup> <sub>Subscript</sub> Reference[^1]<br>

[^1]:
	Reference 1 definition

	Paragraph 2

### `Monospace` combinations
_`em > code`_ <code><em>code &gt; em</em></code> <i>`i > code`</i> <code><i>code &gt; i</i></code>

**`strong > code`** <code><strong>code &gt; strong</strong></code>
<b>`b > code`</b> <code><b>code &gt; b</b></code>

~~`del > code`~~ <code><del>code &gt; del</del></code>
<!-- Jekyll standalone <s> tags aren't <p>-wrapped for whatever reason: -->
<span><s><code>s &gt; code</code></s></span> <code><s>code &gt; s</s></code>

<u><code>u &gt; code</code></u> <code><u>code &gt; u</u></code>

<abbr><code>abbr &gt; code</code></abbr> <code><abbr>code &gt; abbr</abbr></code>

<small><code>small &gt; code</code></small> <code><small>code &gt; small</small></code> <small>(larger line-height intended for latter example)</small>

<hr>

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

### Heading with `id` {#heading-foo}
[Link to that heading](#heading-foo)

## Block styles
### Images & figures
Markdown image:
![Image alt text](https://placecats.com/408/287)

HTML images:

<img class="fleft" src="http://placecats.com/200/287" width="50%" />
<img class="fright" src="http://placecats.com/200/287" width="50%" />

<figure class="fright" style="width:35%">
	<img src="http://placecats.com/200/287" />
	<figcaption>This image is floated to one side with a custom width. You can float left, centre, or right. Or leave <code>width</code> empty for a full-width image!</figcaption>
</figure>

### Lists
{:.noclear}

* <p>ul li p</p>
  * ul 2
    * ul 3
      * ul 4
        * ul 5
          * ul 6
            * ul 7+

1. ol
   1. ol 2
      1. ol 3
         1. ol 4
            1. ol 5
               1. ol 6+

- [ ] unchecked li
  - [x] sub
  - ul
- [x] checked li

<dl>
	<dt>Description term</dt>
	<dd>Description definition</dd>
</dl>

### Code
```java
package com.example.foo.bar;
import java.Math;

// Java code blocks use the Eclipse dark theme
public class Main {
	public static void main(String[] args) {
		int x = 1;
		int[] y = [1, 2, 3];
		foo(); // c1
		String z = "literal";
	}

	public static void foo() {
		// _Hopefully_ this comment line is _so long_ that it will cause a horizontal overflow on at least _most_ displays idk. You better scroll.
		return;
	}

	public int bar(String x) {
		return this.qux();
	}

	/*
	 * cm
	 */
	public int qux() {
		return 2;
	}
}
```

```js
// One Dark for non-Java
async function foo(x, y) {
	console.log("bar");
	return x + y;
}
```

Inline syntax highlight using span IAL:
`<p data-foo="bar" title="baz">qux</p>`{:.highlight.language-html}

Java span: `int x = 12; // Foo`{:.highlight.language-java}

### Tables
#### Markdown

| Left aligned | Centre aligned | Right aligned | Default aligned |
| :----------- | :------------: | ------------: | --------------- |
| 1            | 2              | 3             | 4               |

Small tables are inline:

| A | B |
| - | - |
| C | D |

| E | F |
| - | - |
| G | H |

Long table (may overflow w/ scroll):

| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| - | - | - | - | - | - | - | - | - | -- |
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |

#### HTML
<table>
	<tr><th colspan="3">Table Title</th></tr>
	<tr><th>Heading 1</th><th>Heading 2</th><th>Numerical Column 3</th></tr>
	<tr><td>This cell has a ludicrous amount of text in it obviously enough to
	trigger a word wrap or something surely it would've happened by now please
	come on.</td><td>Data 2</td><td class="tnum">3</td></tr>
	<tr><td>If there are too many columns, a horizontal scrollbar will be added
	automatically.</td><td>Data 5</td><td class="tnum">6.123</td></tr>
	<tr><td>On mobile, all tables display as 100% of the content's width.
	<small>(It also supports the <code>&lt;pre&gt;</code> tag!)</small></td>
	<td>Data 8</td><td class="tnum">9</td></tr>
</table>

### Block quotes, callouts, & asides
#### Block quotes
Paragraph before

> ## Block quote Heading 2
> Paragraph
> <small>Small text</small>
> $\LaTeX$
> > Sub quote

> ## Block quote heading again
> Block quotes *ideally* act as general containers. Kramdown will be very
> forgiving with their parsing and 99% of the time it'll literally just be a
> container that internally parses and displays exactly as the root-level
> article text.
>
> Also, I've yapped enough that you've surely seen the word-wrapping by now.
> > See what happens with a sub-block quote!
>
> If there is (specifically) a `<h2>`{:.highlight.language-html} as the first
> child of this block, it'll be displayed in a special way. This way, we can use
> more Markdown fun even in the title. This also works with callouts (see
> below).

#### Callouts
> ## (Optional) callout title text
> `.callout-error` with title text
{:.callout-error}

> `.callout-info`
{:.callout-info}

> `.callout-success`
{:.callout-success}

> `.callout-warning`
{:.callout-warning}

#### Asides
<aside>Plain aside</aside>

<aside>Plain aside with enough text within it to cause a word wrapping and more
importantly the element's <code>display: table</code> nature to showcase how
these blocks with small content (as above) fit their size, whilst ones like this
(with many lines) will hit 100% width and start wrapping.</aside>

<aside class="fleft" style="width:75%">
	<h2>Heading within <code>&lt;aside&gt;</code></h2>
	Left-floated aside with 75% width
	<blockquote>Nested blockquote (HTML)</blockquote>
</aside>

<hr>

# Documentation
This is the style testing and general toydotgame.net v6 redesign documentation
page. It is intended for style testing and documentation for article-writing.
This document supersedes the old template.html from v5; however, if you're
looking for a **template** file—that no longer exists! Because I use Jekyll now,
articles have effectively no boilerplate. All you *really* need is to make a
Markdown file in the `_posts/` directory (with Jekyll's file name syntax) and
optionally (but ideally please do) add some YAML front matter:
```yaml
title: Foo # Generally (but not strictly) mandatory
# Optionally:
date:      1970-01-01 # Published on
updated:   2000-01-01 # Last edited on
mathjax:   true       # Download MathJax when loading the page?
published: true       # Build in production?
aero-icon: # Path to image for icon in the article "window" title
banner:    # Path to image for page title background/embed image
```
Then just start typing away!

However, *some* things can't be done by Kramdown, listed here:
<dl>
	<dt>Description lists (like this one)</dt>
		<dd>Use the plain HTML tags</dd>
	<dt>Tables with the <code>.tnum</code> class, <code>colspan</code>, etc</dt>
		<dd>Use the HTML as plainly as you can manage. Kramdown uses
		<code>&lt;thead&gt;</code> and <code>&lt;tbody&gt;</code> semantics. v6
		styles are designed to be compatible with non-semantic single-group
		tables <i>and</i> Kramdown's ones</dd>
	<dt>Markdown within HTML tags</dt>
		<dd>Generally, just use the HTML. Again, v6 styles support both my and
		Kramdown's semantics for span text formatting etc. If you desperately
		need it, however, you can look into the
		<a href="https://kramdown.gettalong.org/parser/kramdown.html"><code>parse_block_html</code></a>
		option, and specify it inline <b>before</b> the element you're using it
		on. It's not on by default for a reason, however</dd>
	<dt>Custom list markers</dt>
		<dd>Specify the list in HTML, <i>or</i> use a block IAL to set the
		<code>type</code> attribute of the list container.<br>
		<span style="font-style:normal">See also:
		<a href="https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type"><code>list-style-type</code>
		on MDN</a></span></dd>
	<dt>Callouts</dt>
		<dd>Callouts are made from block quotes, so write them up as you would
		a normal Markdown quote, but add a block IAL after with the class
		<code>.callout-&lt;type&gt;</code> and an optional <code>title</code>
		attribute. Where <code>&lt;type&gt;</code> is one of:
		<ul>
			<li><code>error</code></li>
			<li><code>info</code></li>
			<li><code>success</code></li>
			<li><code>warning</code></li>
		</ul></dd>
	<dt>Quote and callout titles</dt>
		<dd>As mentioned above, use the <code>&lt;title&gt;</code> attribute.
		Titles are optional, though</dd>
	<dt>Asides</dt>
		<dd>Instead of using Kramdown semantics, just use an
		<code>&lt;aside&gt;</code> tag in the same way you would a figure or
		image. They support custom widths and floats using the syntax figures do
		</dd>
	<dt>Custom ordered list indices</dt>
		<dd>Set
		<a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/li#value">the
		<code>value</code> attribute</a> of a HTML-defined <code>ol li</code>.
		Subsequent items will continue from that number too. <b>Note that this
		is HTML5 only!</b></dd>
</dl>

## Further notes
* Lists display as part of paragraphs no matter what (i.e. they have no
  paragraph spacing). If you desire a space, best to add a break tag then
  * This includes `<dl>`{:.highlight.language-html}s
* The default syntax highlighting theme is Atom One Dark, however **Java** code
  will use the Eclipse dark scheme instead
* Technically, the serif, `<h3>`{:.highlight.language-html}-like text in table
  headings will apply to *all* `<th>`{:.highlight.language-html} tags that span
  *any number* of columns, not just those that span the entire table
* When using $\LaTeX$ inline, be wary that it's going to generate an entire
  inline block of equation typesetting, and thus *won't* wrap
* Markdown and HTML styles can be **<u>combined</u>**, so long as all of the
  Markdown presentation is **outside**, and the HTML tags stay on the
  **inside** (as mentioned above)
* A footnote can have any ID (e.g. `[^foo]`{:.highlight.language-markdown}), but
  will display its link and number in the presentation as a numerical counter.
  This handily enables naming citations without having to remember a number, and
  also the automatic ordering of citations in the reference list!
	* The footnote definition can be *anywhere*, and it will be displayed in the
	  reference list rather than where it was defined
	* Footnotes can contain block-level (instead of span-level) definitions
	  (e.g. multiple paragraphs, line breaks in markup) if you start the
	  definition on a new line:
	  ```
	  [^foo]:
	  	Paragraph here!

	  	New markdown paragraph here!
	  ```
* Markdown list parsing doesn't respect markers! Resetting the list counter for
  ordered lists is mentioned above. For unordered lists, this is kinda fine, it
  just means that we can use *any* of `+`, `-`, `*`, etc for our bullets all in
  the same list
* Unlike many block and inline things, **tables** need a *preceding* paragraph
  break too, even after something like a heading, which usually was smart enough
  to start a new block without needing a full break

## Useful features
* Use the `.hidden`{:.highlight.language-css} class (i.e. in an IAL) to set
  `display: none`{:.highlight.language-css} for that element
* By default, headings, code blocks, and horizontal rules have
  `clear: both`{:.highlight.language-css} set. If you want one of these to *not*
  clear surrounding floats when displayed, use the
  `.noclear`{:.highlight.language-css} class
* For links, they will be marked in JS with the
  `.external`{:.highlight.language-css} class if their destination domain is not
  the same as this page's. This appends a little external link SVG to the end of
  the link's text. **To circumvent this** and hide said graphic, use the
  `.noexternal`{:.highlight.language-css} class in a span IAL

## Reference information
* [Kramdown IAL syntax](https://kramdown.gettalong.org/syntax.html#inline-attribute-lists)
* [List of Rouge's supported languages](https://rouge-ruby.github.io/docs/file.Languages.html)
  (e.g. for `.language-<id>`{:.highlight.language-css} IAL class(es))

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

## Styles and feature implementation TODO
* Custom article header image that overwrites og:image if present

### Features
- [x] Basic span styles (e.g. B, I, U, S, code)
  - [x] Span interactions (e.g. underlines within code spans, code within links)
  - [x] Super-, subscript, citation display
    - Improved over v5: CSS-rigorous display within line box *without* expanding
      its height
- [x] Images
  - [x] Figures
    - [x] Captions
  - [x] Padding stuff
  - Improved over v5: Setting the `width` of a figure or image now yields
    *exactly* that width, rather than a constant 2% extra added on top of what
    you specify
- [x] Lists: ol, ul, dl
  - [x] Improved over v5: Automatic list marker types for each level, and
        `<dl>`{:.highlight.language-html} styles now too
- [x] `<small>`{:.highlight.language-html} interactions
- [x] Syntax highlighting: Atom One Dark
  - [x] Eclipse Dark specifically for Java blocks
  - [x] Inline syntax highlighting
  - [x] v5 block code line background port/update
- [x] Reference list (port of old static/CSS-kinda-dynamic) to the new Kramdown
      one
- [x] More dynamic heading type
- [x] Improved Heading spacing and display
- [x] v5 table styles port + Kramdown compat
  - Improved from v5: Less horrid word breaking and better responsiveness
- [x] Block quotes
- [x] Callouts: Various types and with/without header interactions
- [x] Asides
- [x] External link marker (JS)
- [x] User selection colours
- [x] Article header image: Overwrites `og:image` head meta and CSS for the page
      can adapt for articles both with and without header images
- [ ] Final run-through of v5 main.css to see if anything's been missed

### Bugs
<small>Nothing to do!</small>

### Implemented but not CSS-rigorous
These are effectively **low-priority**; but, for a *perfect* stylesheet:
- [ ] `li::marker`{:.highlight.language-css}s have a variable and uncontrollable
      width, which can't be easily set because
      `::marker`{:.highlight.language-css}s support very few CSS properties.
      Additionally, this is made worse by the fact that browsers all use fonts
      and display styles that vary considerably. My
      `0.35em`{:highlight.language-css} and
      `list-style-type`{:highlight.language-css} fixes help make it consistent,
      but they are **not CSS-rigorous** fixes
- [ ] `.highlight`{:.highlight.language-css} tags (inline *or* block code) has
      `clear: both`{:.highlight.language-css} set, but for inline tags this
      may present an issue as I **don't** want them to clear. It doesn't *seem*
      like theres a case where inline code *isn't*
      `display: inline`{:.highlight.language-css}, but I'm yet to **prove it's
      CSS-rigorous**

### Feature ideas/*look into*
These are even *less* priority, but would be nice to look into:
- [ ] **`> [!note]`{:.highlight.language-markdown}** callout syntax instead of
      static `<aside>`{:.highlight.language-html} HTML
- [ ] `==highlight==`{:.highlight.language-markdown} Markdown syntax and
      associated CSS
- [ ] Reading mode/HTML4 semantics/basic CSS/printer display for printing,
      saving as a PDF, viewing on ancient browsers(!!!), etc
        - Probably quite easy given all of the CSS and HTML5 is part of
          base.html and thus an alt layout can be made
