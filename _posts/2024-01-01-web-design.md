---
title: What's the deal with Modern Web Design?
updated: 2025-11-09
---

<small>(Yes in a Jerry Seinfeld voice)</small>

> ## Rant warning!!1
> **Note (2025-11-09):** I still stand by what I said almost 2 years ago here,
> with full emotional ferocity in my heart 'n' all—but *damn* I get borderline
> incoherently mad below.
> 
> <span style="color:var(--accent); font-variant:small-caps">You have been
> warned.</span>
{:.callout-warning}

Can y'all seriously not even be the slightest bit creative? Or even code by the
principles you preach?

<small style="text-decoration:line-through">Yeah okay minor rant
warning.</small>

![A screenshot of the Squarespace landing
page](/media/blog/2024/01-01_web-design/i-hate-you.png)
Here's the Squarespace landing page. A personal hatred of mine. And it's not
just Squarespace—it's everyone. I'll just launch right into it:

## Gripe #1: EVERY Website Looks like This
The oh-so-classic mid–late 2010s website design: fullscreen image banner, scroll
down for section blocks with text next to an image, footer hidden down
somewhere, navbar embedded as part of the banner.

This. Is. **Terrible!** Why‽ I understand the aesthetic of a page is subjective
but when you start to see it on _every_ personal/business website for literally
8 years now, I think it becomes time to complain. Just a bit.

For fun, I checked out [Squarespace's design templates
page](https://www.squarespace.com/templates). Am I surprised? No. Not even in
the slightest. They **all** follow the same pattern! Image-based header that
fills 100% of the viewport height after page load, and then scroll down for a
bit of text with an image next to it because _obviously you don't have the
attention span to read 50 words_.

<img src="/media/blog/2024/01-01_web-design/i-dislike-you.png" class="fright" width="60%">
Let's have a look at Wix's designs. I used these guys back in 2016 because you
could get a website for free and I didn't know how to code then. (Trust me, what
I made wasn't pleasant). These designs _aren't as bad_, but they're designed in
a way that reminds me a lot of the ever-rising prevalence of JS these days on
websites and the absolute pain and suffering said trend has brought with it.
Despite their greater uniqueness, the Wix designs are also pretty bog standard,
boring, and common—if not slightly more 2020s than 2010s like Squarespace. It's
still the same bold screen-filling banner, then scroll for garbage.

<small markdown="1">Side-note: I swear it's like footer height is tied to net
worth of the company/person who owns the site. Apple and Microsoft have 3 layers
of footer that fills over a whole screen. Wix and Squarespace aren't any
different either. Even the most bloated of personal blog sites can struggle to
hit half a page even counting webring links, badges, _and_ socials.</small>
<small>Often, navigating corporate websites is near impossible without footer
links, and making these footers abhorrent to use is not a help to the end
user.</small>

<img src="/media/blog/2024/01-01_web-design/i-really-hate-you.png" class="fleft" width="45%">
Another thing with these sites is that they are just unresponsive full stop.
Just because your site has a hamburger menu for when the screen is portrait
<u><b>does not</b> mean that it is responsive!</u> Okay, well in a web design
theory standpoint yes it does, but in practice it's awful. Take inset left:
Squarespace at 30% zoom. I don't want your banner to take up
`100vh`{:.highlight.language-css} on my screen!!! Learn how to scale a damn
image and maybe even (scary for you modern web devs I know so beware!:) pick up
an `object-fill`{:.highlight.language-css}[^object-fill] property! Boo!

[^object-fill]:
	**Editor's note (2025-11-09):** Honestly not sure what I meant by this. I'm
	assuming I meant like *learn how to `cover`{:.highlight.language-css} so
	your site can display the same background at different proportions* (and not
	fixed `vh`{:.highlight.language-css} units like I mentioned)? I don't know.

## Gripe #2: Why JS?
Now that I've launched the web devs out of their chairs like a cat seeing a
cucumber, I should probably mention my biggest issue with modern web development
and kind-of the driving passion behind this semi-coherent "article:" JavaScript,
JavaScript Frameworks, and JavaScript Libraries.

For the uninitiated, JavaScript is the reason why your phone loads pages slow,
it's the reason why your _computer_ loads pages slow, it's the reason why things
don't show up right. It's the reason why you sometimes need to reload a page
after loading it initially because for some reason stuff didn't show up the
first time; it's the reason your phone slows down when trying to scroll on a
webpage; it's the reason why your browser crashes on your PC.

<img src="/media/blog/2024/01-01_web-design/stop-using-electron.jpg" class="fright" width="40%">
JavaScript is what all web developers seem to come back to. You really just
_need_ to run your website on some NodeJS something something server with a full
deployment of Angular, React, Vue, or whatever the Hell has emerged from the
deepest pits of hellfire for us to all "enjoy" this time—because you couldn't
figure out how to write a web page document in plain HTML because there where no
big pretty Figma buttons and Squarespace UIs to do it for you, huh? Each
framework built to be better than the last because the last one always sucks.
Guess what! **They all suck man!** Pick up a copy of Windows Notepad and learn
to think with a brain.

Not only are you adding like 13 MiB to a 12 KiB page download, making pages take
10 times longer to load, but then after that you're slowing down their devices
by eating **tens of megabytes of RAM**! For a webpage‽ Do you know how much a
megabyte is? You need over a MILLION? Get THE ACTUAL ~~F~~<small>my lawyer
has advised me to move on</small>.

<small>Can you tell how incoherent I've become?</small>

This site uses JavaScript. It loads in HTML elements using JS. However, instead
of importing 678 libraries all depending on each other to do a simple thing, I
(jumpscare warning!) _coded it all myself_. And bonus: all of the code runs and
executes on DOM load complete – as in it loads in all of the content in JS
before the page is even done rendering! Seamless for the user! After that it
quits: no need for your RAM!

## Gripe #3: Why change?
Okay, maybe this is a bit more of a personal thing—but the saying "If it ain't
broke, don't fix it" exists for a <u>reason</u>. Some of the site redesigns I've
seen are honestly just a shame. Redesigns seem to always be slow, arduous,
disjointed, inconsistent, inconvenient—you get the point.

Apple's [Remebering Steve Jobs](https://www.apple.com/au/stevejobs/) page is
still their (vaguely) 2013 style, including the old font. Reddit's modern site
still uses the old.reddit [404 page](https://www.reddit.com/epic404page). The
[Facebook services directory](https://www.facebook.com/biz/directory/) uses
their—aw man, it has got to have been 10 years since I've last seen that—site
design.

Sometimes, a change isn't needed. Just 'cause your site looks 3 years old
doesn't mean it's bad; heck, a site that looks 15 years old is fine. That might
be pushing it for the general public who see older-styled sites as less
legitimate or less reliable/out-of-date. You can _easily_ push a 5-, 6-, or
maybe 7-year-old site design out today however and have it stand perfectly fine.

## Bonus Gripe: Why Preach Instead of Teach?
I deliberately tried to make the title of this section sound like one of these
things. If you've ever been on StackOverflow you know what they are. Those
dedicated sites to some subset of programmer doctrine that instead of answering
your question or giving _any_ useful advice to you, you get linked some
www.getscrewedyoushitprogrammer.com domain
([dontasktoask.com](https://dontasktoask.com/),
[nohello.com](https://www.nohello.com/),
[xyproblem.info](https://xyproblem.info/), etc are a few examples). Some of the
times (like the examples I gave) there is generally good practice and
commonsense hidden in there. Sometimes not. My main gripe is the majority of
mainstream programming help sites these days will do 1 of 3 things:
* Link you a useless site, comment about refusing to answer your question
  because XYZ screw you novice, this doesn't match ABC guideline \[on SO\], or
  this is a duplicate (when it clearly isn't and wouldn't hurt anyone if it just
  got answered here concisely)
* (In the case of web development:) Recommend 1-3 JS libraries to achieve an
  incredibly mundane task that can either been done in 1-3 _lines_ of JS code
  (no jQuery or Node/React in sight) **or** that can be achieved using pure
  HTML/CSS – which, by the way, will <u>always</u> be faster
* Answer something completely unrelated to your question just so it looks like
  they helped even though they suggested a solution more applicable to fish
  farming than to programming

To you "programmers," (if you yourself even do), the ones who overcomplicate and
oft ruin any joy to be associated with computing – I deliver you thus:

<style>
@import url("https://fonts.googleapis.com/css2?family=Ballet:opsz@16..72&display=swap");
</style>
<p style="text-align:center; font-family:'Ballet',cursive; font-size:36px;">fuck you</p>

_**royally**_.
