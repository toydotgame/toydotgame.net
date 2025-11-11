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
image:     http://placecats.com/200/50 # Won't render if unspecified
---

## Inline styles
Para&shy;graph<br>
Pneumonoultramicroscopicsilicovolcanoconiosis&shy;pneumonoultramicroscopicsilicovolcanoconiosispneumonoultramicroscopicsilicovolcanoconiosis<br>
_Italic 1_ *Italic 2* <i>Italic 3</i><br>
**Bold 1** __Bold 2__ <b>Bold 3</b><br>
~~Strikethrough 1~~ <s>Strikethrough 2</s><br>
`Monospace 1` ``Monospace 2`` <code>Monospace 3</code><br>
<u>Underline</u><br>
[Internal link]() [External link](){:.external}
[External link w/ `.noexternal`](){:.noexternal}<br>
<abbr>Abbreviation 1</abbr> Abbreviation 2<br>
<small>Small</small><br>
<sup>Superscript</sup> <sub>Subscript</sub> Reference[^1][^2]<br>
<mark>Highlight</mark><br>

*[Abbreviation 2]: Abbreviation 2 definition

[^1]:
	Reference 1 definition

	Paragraph 2

[^2]:
	Format is as:

	["Page title" § *Optional section*](), yyyy-mm-dd. Company, or Author First Name
	Middle+Last Initial(s). Optional notes clause.

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
	<figcaption>This image is floated to one side with a custom width. You can float left, centre, or right. Or leave <code>width</code> empty for some automatic sizing.</figcaption>
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

<style>
	.long-table :is(th, td) {
		min-width:	128px;
	}
</style>

| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| - | - | - | - | - | - | - | - | - | -- |
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
{:.long-table}

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
title: Foo # Generally (but not strictly) mandatory; default from filename
# Optionally:
date:      1970-01-01 # Published on; default null (or filename date for _posts)
updated:   2000-01-01 # Last edited on; default null
mathjax:   true       # Download MathJax when loading the page?; default false
published: true       # Build in production?; default true
aero-icon: # Path to image for icon in the article "window" title; default
           # book.png (_posts) or info.png (otherwise)
image:     # Path to image for page title background/embed image; default
           # banner.png
```
Then just start typing away!

However, *some* things can't be done by Kramdown, listed here:

Tables with the `.tnum` class, `colspan`, etc
: Use the HTML as plainly as you can manage. Kramdown uses `<thead>` and `<tbody>` semantics. v6 styles are designed to be compatible with non-semantic single-group tables _and_ Kramdown's ones

Markdown within HTML tags
: You can use the attribute `markdown="1"`{:.highlight.language-html} on the
  span/block tag that immediately contains the Markdown syntax. Alternatively,
  you can set a per-file toggle (from the line the option is specified onwards)
  using the
  [`parse_<span|block>_html="true"`](https://kramdown.gettalong.org/parser/kramdown.html)
  `{::options <option>=<value> /}` inline Kramdown syntax if you want. This
  _can_ also be set in `_config.yml`, but <u>isn't for a reason</u>.<br>
  Alternatively, just use HTML. Sometimes it's just easier

Custom list markers
: Use a `<<ol|ul> type="<list-style-type>">` element in your Markdown, *or*
  append the block IAL
  `{:type="<list-style-type>"}`{:.highlight.language-markdown} after your
  Markdown list.<br>
  *See also: [`list-style-type`{:.highlight.language-css}
  values on
  MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type)*

Custom ordered list indices
: Use a HTML ordered list and set the [`value`{:.highlight.language-html}
  attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/li#value)
  of the list item tag.<br>
  **In HTML5,** subsequent list items will count from that number, saving you
  needing to re-specify `value`{:.highlight.language-html} for every item

Callouts
: Callouts can be made using a normal block quote's
  `>`{:.highlight.language-markdown} syntax, with a block IAL afterwards
  containing the callout's CSS class, which will be
  `.callout-<type>`{:.highlight.language-css}, where `<type>` is one of:
  * `error`
  * `info`
  * `success`
  * `warning`

Quote and callout titles
: As mentioned below, you can just put in a heading as you would normally.
  Ideally, use a `<h2>`{:.highlight.language-html} level, as it has special
  design considerations for this exact purpose

Asides
: Unfortunately, use HTML. Use the `<aside>`{:.highlight.language-html} tag.
  `<aside>`{:.highlight.language-html}s can have their presentation customised
  using the exact same methods as you would to float and scale a
  `<figure>`{:.highlight.language-html}

Superscript `~`{:.highlight.language-markdown}, subscript
`^`{:.highlight.language-markdown}, and highlight
`==`{:.highlight.language-markdown} or `::`{:.highlight.language-markdown}
Markdown syntax
: Kramdown doesn't do that. Use `<sup>`{:.highlight.language-html},
  `<sub>`{:.highlight.language-html}, and `<mark>`{:.highlight.language-html}
  respectively

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
* Overflow is \[by default\] managed with
  `overflow-wrap: break-word`{:.highlight.language-css}. This means:
	* Words wrap at normal wrapping locations (e.g. spaces and punctuation)
	* If a word is too long and will overflow the end of this line, a wrap is
	  added at the **last available soft wrap location** (e.g. the space before
	  this word)
	* If *still* this word is too long for even a full line of its own, the word
	  will be broken <u>without any fancy decoration to mark it!</u>
	* **If you want to add a not-there-by-default soft wrap opportunity**, add
	  either a:
		* **`&zwsp;`{:.highlight.language-html}** for a word breaking
		  opportunity that'll break the word at that point without adding any
		  punctuation/marks
		* **`&shy;`{:.highlight.language-html}** for a word breaking opportunity
		  that'll break the word *and* add a hyphen at the end of the line where
		  the break occurs
* Kramdown supports automatic abbreviation markup, in the form of
  `*[abbreviation-name]:
  abbreviation definition`{:.highlight.language-markdown}. Any time
  "abbreviation-name" is seen in the text (you don't need to mark it!), it'll
  attach the definition you made!
* The first `<h2>`{:.highlight.language-html} in a blockquote (callout or not)
  will be styled in sans-serif specially as a title for that block. For
  callouts, their styling is flexible and the little icon will display
  well-aligned for whatever you may put there
* It's probably better practice to use `{% raw %}{% post_url yyyy-mm-dd-title
  %}{% endraw %}`{:.highlight.language-liquid} to inject an article's permalink
  **dynamically** rather than hardcoding them
* Set the front matter key `description`{:.highlight.language-yaml} to a custom
  description for that page (e.g. in embeds elsewhere). It defaults to "Welcome
  to my corner of the internet!" for all pages, and specifically `_posts` will
  use the first paragraph instead. Regardless of the page collection or where
  the value comes from, they're all truncated to 50 words
* Set front matter `slug`{:.highlight.language-yaml} to whatever you want (note
  that all hyphens become spaces and the first word is capitalised).
  > Remember that the `{% raw %}{{ page.slug
  > }}{% endraw %}`{:.highlight.language-liquid} value may be important/used for
  > something else!
  {:.callout-warning}
  Also note that for non-Posts, the slug value isn't used in the aero section
  title

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
* The `.nomodal`{:.highlight.language-css} class prevents the image zoom/viewer
  modal from working on an image

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
- [ ] `ol, ul`{:.highlight.language-css} used to be
      `display: table`{:.highlight.language-css}, but it isn't anymore because
      of responsiveness issues. Allegedly, block-like display causes issues with
      floats that I can't recreate. Is it CSS-rigorously safe to assume that
      block display is okay? Because it seems so
- [ ] The `@media`{:.highlight.language-css} queries (especially for the aero
      stuff) use a ton of **magic numbers** that should be accurately documented
      and/or derived in code for proper dynamic support rather than just "*Oh,
	  well it works for now…*"
- [ ] `a`{:.highlight.language-css} styles are kinda weird (re. nav)

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
