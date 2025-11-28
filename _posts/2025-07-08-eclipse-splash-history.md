---
title: History of the Eclipse IDE Splash Screen
updated: 2025-11-28
---

I use Eclipse to program in Java. I love it (please throw your comments about
how I'm about 5 billion years old and my development environment is too directly
into my e-mail inbox for me to not care about). Anyway, I started using it in
late 2020, and wanted to remember what the splash screen was _then_ back when I
got started. Turns out, a Google Images search yielded nothing. And so, that's
where the question came from:

> _What does every incarnation of the Eclipse splash window look like?_

…And so this article was born. This article will be a timeline of the
`splash.bmp` (and later/currently `splash.png`) file as found in the _Eclipse
Platform_ core component of the Eclipse Project.

We'll start with Eclipse 1.0, released November 7<sup>th</sup>, 2001 (date from
[Eclipse Project Archives](https://archive.eclipse.org/eclipse/downloads/),
Wikipedia disagrees and states the 29<sup>th</sup>). No Git history exists for
this version, nor could my (rather shallow) research find any pre-release
versions from before this. By this time, the *Eclipse Platform* project existed,
but in a vaguely different scope and implementation than it does today. As I
understand it, the Eclipse project was kicked off by IBM, who—prior to Eclipse
1.0's release—invested upwards of US$40 million (~US$72.7 million in
2025)[^inflation] in R&D alone.[^eclipse-decade] In that month[^eclipse-decade],
the Eclipse Foundation was created to officially hold the project, with IBM as a
major contributor (to this very day!).

[^inflation]:
	["Inflation Calculator"](https://www.usinflationcalculator.com/). CoinNews
	Media Group. Precise figure was _$72,647,457.63_.

[^eclipse-decade]:
	["IBM and Eclipse: A Decade of Software
	Innovation"](https://web.archive.org/web/20120130055551if_/https://asmarterplanet.com/blog/2011/11/ibm_and_eclipse_10_years.html).
	Mike Milinkovich. Originally published 2011-11-03, archived 2012-01-30.

Regardless, the 1.0 build available in the Archives holds the Eclipse 1.0 SDK
(I'm assuming the "Eclipse Platform" software's purpose/implementation was
either not fully baked in this release, or was intended as a smaller part of the
larger Eclipse SDK project). In the SDK's release distribution, the `splash/`
folder provides the oldest splashes I can find, dated August 8<sup>th</sup>,
2001:[^version-1]

[^version-1]:
	["Version:
	1.0"](https://archive.eclipse.org/eclipse/downloads/drops/R-1.0-200111070001/).
	Eclipse Foundation
	[AISBL](https://www.belgium.be/en/economy/business/creation/company_formats).
	Found on the _Eclipse Project Archives_ site.

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/1.0_splash_full.bmp">
	<figcaption><code>splash_full.bmp</code></figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/1.0_splash_basic.bmp">
	<figcaption><code>splash_basic.bmp</code>, a limited-palette version</figcaption>
</figure>

<p class="freset" markdown="1">
	Following 1.0, IBM established Eclipse as an open-source project led by the
	Eclipse Foundation. As far as I am aware, the code of the beta and 1.0
	release candidates was not tracked by CVS (which is what it used for the
	first few years)[^cvs]—or the CVS history wasn't migrated to the public CVS
	repository (which _has_ been migrated to Git and is available on GitHub
	today).
</p>

[^cvs]:
	["CVS
	repository"](https://web.archive.org/web/20011224192753if_/http://dev.eclipse.org/viewcvs/index.cgi/).
	Eclipse Foundation AISBL. Publish date unknown (CVS history spans back to
	before November, but I have no way of browsing a CVS repository in 2025
	given just the Web Archive), archived 2001-12-24.

<aside markdown="1">
### Aside on the name "Eclipse":
Eclipse was IBM's creation, and at the time, Java development was most
popularly done on Microsoft's Visual Studio (which used to support Java—it
doesn't anymore).

There is the idea that Eclipse was named that because Java was created by
<u>Sun</u> Microsystems (pre-2014 Oracle buyout, remember!). This is false,
because actually IBM was focused solely on Microsoft's grip on the software
development industry with VS. They saw this as an "ecosystem" that was
growing unchecked. Here's a quote from [the article about the
name](https://www.eweek.com/development/eclipse-behind-the-name/) I like.
This quote is attributed to Lee Nackman, CTO of Rational Software (under
IBM), VP of IBM Design, Construction, and Testing, and "initiator" of
Eclipse:[^behind-the-name]

> Our target was Microsoft \[…\]. Microsoft was clearly the market and was on
> a path to become the dominant tools platform. \[…\] So around 1998 we felt
> \[…\] we needed to bring developers to \[IBM's Java\] middleware business
> \[which\] depended on bringing developers \[over to IBM's side\].

So yeah…Eclipse wasn't created to blot out the Sun. It was created to
Eclipse Microsoft. I love that.

Sun actually had apprehensions about joining the Eclipse Foundation back in
2003, with its executives citing they could not feasibly support an
organisation who "\[encouraged\] the demise of Sun."[^behind-the-name]
</aside>

[^behind-the-name]:
	["Eclipse: Behind the
	Name"](https://www.eweek.com/development/eclipse-behind-the-name/). Darryl K
	Taft. Published 2005-05-30.

On May 11<sup>th</sup>, 2002, we get the commit "Migrate"
([`9916e19`](https://github.com/eclipse-platform/eclipse.platform/commit/9916e19e0d52ed9b10b35fb85789dabc74ea9cfe)),
which is the oldest change in the Git history for the Eclipse Platform. The
above bitmap images are included, unchanged, in this.

<br>

<small markdown="1">
	Interestingly, there's a file called [`readme.txt`](https://github.com/eclipse-platform/eclipse.platform/blob/9916e19e0d52ed9b10b35fb85789dabc74ea9cfe/platform/org.eclipse.sdk/splash/readme.txt)
	in the splash directory with a FIXME for reading "splash.png," dated May
	3<sup>rd</sup>, 2002. I'm not sure if ".png" was a typo or not, but actual
	support for a PNG splash wouldn't be included until September
	4<sup>th</sup>, 2021—a full 19 years later.
</small>

<hr>

## Tracked timeline
### `splash.bmp`[^bmp-history]
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/2.0.bmp">
	<figcaption>2002-05-18: 2.0</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/2.0_24-bit.bmp">
	<figcaption>2002-05-19: 2.0, 24-bit bitmap upgrade. In the commit history,
	there's a bunch of changes to the splash, mainly centred around colour
	palette, indexing, 24-bit RGB bitmaps vs restricted palettes, etc. I'm only
	going to include this one because these changes are honestly boring and the
	differences aren't notable.</figcaption>
</figure>

[^bmp-history]:
	["History for eclipse.platform/platform/org.eclipse.platform/splash.bmp on
	e16419e"](https://github.com/eclipse-platform/eclipse.platform/commits/e16419e043894c2e2f6ec3b1816cc79298e520c9/platform/org.eclipse.platform/splash.bmp?after=e16419e043894c2e2f6ec3b1816cc79298e520c9+0).
	eclipse-platform on GitHub. This is where I got most of the history for
	`splash.bmp`.

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/2.1.bmp">
	<figcaption>2002-09-19: 2.1. Also notice the flare to the top-left of the
	<i>e</i> in <i>eclipse</i> is absent now and that the background behind the
	copyright text is ever-so-slightly darker (for contrast).</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/2.1_2003.bmp">
	<figcaption>2003-01-16: 2003 copyright.</figcaption>
</figure>

<p class="freset">
	Starting with Platform version 3.0, there is one major Eclipse release per
	year, released each June.
</p>


<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.0.bmp">
	<figcaption>2003-05-26: 3.0</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.0_2004.bmp">
	<figcaption>2004-05-11: 2004 copyright. I might also add that they left in a
	Photoshop document of the splash (and do so for most versions up into the
	present day (more recently with GIMP instead of Photoshop)). The PSD file in
	this revision has two background layers, with the top one being called the
	"corrected" one (that you see in the splash), and the bottom (disabled)
	layer being the pre-2.1 version.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.0_non-ibm.bmp">
	<figcaption>2004-05-26: Copyright is updated to the "Eclipse contributors"
	rather than IBM Corporation.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.0_new-spacing.bmp">
	<figcaption>2004-06-22: Letter kerning and padding for the copyright is
	updated.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1.bmp">
	<figcaption>2004-07-27: 3.1</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_2005.bmp">
	<figcaption>2005-03-25: 2005 copyright update. Additionally, the version
	number has become serif.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_new.bmp">
	<figcaption>2005-05-13: New splash. Eclipse Platform is still at v3.1.0, but
	with a new look I guess!</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_new2.bmp">
	<figcaption>2005-05-18: The new splash gets refined.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_new2-fixed.bmp">
	<figcaption>2005-05-19: The rays on the left are un-clipped.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_new2-updated.bmp">
	<figcaption>2005-06-03: (This design is attributed to May 27<sup>th</sup>)
	Title shadow and smaller version number.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_tm.bmp">
	<figcaption>2005-06-04: Added trademark text that "Eclipse" is a trademark
	of the Eclipse Foundation. Padding and spacings have been shifted a
	little.</figcaption>
</figure>
<!-- Two right floats, swap their order because of how the browser displays
floats: -->
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_tm-inc-f.bmp">
	<figcaption>2005-06-09: Forgot to capitalise the <i>F</i> in
	"<i>Foundation</i>!"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.1_tm-inc.bmp">
	<figcaption>2005-06-08: Forgot to add "Inc."! There it is.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.2.bmp">
<figcaption markdown="1">
2005-08-11: 3.2. I should mention that Eclipse 3.2 takes the release name
**Callisto** (after a moon of Jupiter).[^wiki-releases]
</figcaption>
</figure>

[^wiki-releases]:
	["Eclipse
	(software)"](https://en.wikipedia.org/wiki/Eclipse_(software)#Releases) §
	_Releases_. Wikipedia.

<!-- Doing the same float trickery as above -->
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.2_2006.bmp">
	<figcaption>2006-02-22: 2006 copyright.</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.2_adjusted-text.bmp">
	<figcaption>2005-10-15: Made the version number dimmer, moved the rights
	text up, and modified kerning of the version number.</figcaption>
</figure>

<p class="freset" markdown="1">
	On March 21<sup>st</sup>, 2006, we get a commit from named "netbeans girls
	for Steve" (actually two identical commits with hashes
	[`c403aff`](https://github.com/eclipse-platform/eclipse.platform/commit/c403aff447681b304fb02b3257988e6e0bb86d06)
	and
	[`a11600f`](https://github.com/eclipse-platform/eclipse.platform/commit/a11600f5b9997fddcd4baad2c305ead0eb5970cd)).<br>
	They change the splash to this:
</p>

<figure class="fcenter" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/netbeans girls for Steve.bmp">
	<figcaption>There's a black digital pen line drawn in the
	middle?</figcaption>
</figure>

<p class="freset" markdown="1">
	I found a blog article on this exact commit
	[here](https://waynebeaton.wordpress.com/2006/03/21/swts-steve-northover-embraces-netbeans/).
	To quote it:
</p>

> Kim \[Horne (committer for the above commits)\] tells me that she added a
> little something special to today's Eclipse integration build. The splash
> screen features none other than \[Eclipse\] SWT's own Steve Northover posing
> with the nice models that NetBeans is sponsoring for the week (or the last
> couple of days anyway).

Steve Northover, from my shallow research, was a lead for the [Eclipse Standard
Widget Toolkit (SWT)](https://eclipse.dev/eclipse/swt/) project within IBM
during his tenure in the mid-2000s.[^northover] On March 23<sup>rd</sup>, [the
3.2 splash as of 2006-02-22 was
restored](https://github.com/eclipse-platform/eclipse.platform/commit/f87739926942ec8a0d071c186151d538f1a1d234).

[^northover]:
	["Experience | Steve
	Northover"](https://www.linkedin.com/in/stevenorthover/details/experience/).
	LinkedIn. His 1996–2003 tenure at Object Technology International (OTI)
	overlaps with the initial founding and implementation of Eclipse SWT; his
	2003–2009 tenure at IBM (after IBM bought OTI) was where he saw his official
	instatement as the team lead for SWT.

<br>

Anyhow, starting with the next version, 3.3, and continuing into the present
day, Eclipse places the release name/alias in the splash, rather than the
Platform or SDK version number. Version 3.2 did have a release name (see above),
but it was not included in the splash AFAIK.

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.3.bmp">
	<figcaption>2006-11-30: Eclipse 3.3 "Europa"</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.3_2007.bmp">
	<figcaption>2007-06-01: 2007 copyright.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.4.bmp">
	<figcaption>2007-11-07: Eclipse 3.4 "Ganymede"</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.4_2008.bmp">
	<figcaption>2008-01-30: 2008 copyright.</figcaption>
</figure>

<p class="freset" markdown="1">
	Kim Horne strikes again! On March 18<sup>th</sup>, 2008 we get "EclipseCon
	splash screen :)"
	([`d6c7f7d`](https://github.com/eclipse-platform/eclipse.platform/commit/d6c7f7d210df0c1439786c8cf06b03df43938a67)):
</p>

<figure class="fcenter" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/eclipsecon08.bmp">
	<figcaption>Awesome guitar, Steve.</figcaption>
</figure>

<p class="freset" markdown="1">
	Horne then reverts it with
	[`1e74c60`](https://github.com/eclipse-platform/eclipse.platform/commit/1e74c60a75913bf1a6dcdad67124f63a38e2d51e):
</p>

> It's all fun and games until someone makes Steve cry - back to the real splash
> screen.

The splash is reverted to the version as of 2008-01-30.

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.5.bmp">
	<figcaption>2009-01-31: Eclipse 3.5 "Galileo". Copyright also updates to
	2009.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6.bmp">
	<figcaption>2009-10-26: Eclipse 3.6 "Helios"</figcaption>
</figure>

<p class="freset" markdown="1">
	[Eclipse bug 295192](https://bugs.eclipse.org/bugs/show_bug.cgi?id=295192)
	calls for the addition of the Movember splash. Kim Moir commits a version
	without (November 16<sup>th</sup>) and with (November 17<sup>th</sup>) the
	rights texts: <small>(Both commits are named "Add a movember splash
	screen")</small>
</p>

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/movember.bmp">
<figcaption markdown="1">
[`6ee1ceb`](https://github.com/eclipse-platform/eclipse.platform/commit/6ee1cebbec0129266a57fb8f9ffcb9089e4d1f5c)
</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/movember-rights.bmp">
<figcaption markdown="1">
[`3e887fb`](https://github.com/eclipse-platform/eclipse.platform/commit/3e887fbb81552d15ac458dc17d26ca87b287f547)
</figcaption>
</figure>

<p class="freset" markdown="1">
	Moir then reverts on December 1<sup>st</sup>, with ["bye bye movember"
	(`c309231`)](https://github.com/eclipse-platform/eclipse.platform/commit/c309231f6704641e4b2b1263ecd1073d3456430f)
	to the version as of 2009-10-26.
</p>

[Eclipse bug 296918](https://bugs.eclipse.org/bugs/show_bug.cgi?id=296918) by
Kim Moir notes that the Movember splash was fun, and that there should be one
for December 2009. [Eric Rizzo's
submission](https://bugs.eclipse.org/bugs/show_bug.cgi?id=296918#c17) wins, and
becomes this splash you see here:

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_december.bmp">
<figcaption markdown="1">
2009-12-15: ["make splash in December"
(`9543035`)](https://github.com/eclipse-platform/eclipse.platform/commit/9543035922257bc0f5243795c0e1f1d006a09188).
Eric's design is dated on the 9<sup>th</sup>, and wins on the 14<sup>th</sup>.
</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_2010.bmp">
	<figcaption>2010-01-04: 2010 copyright. Reverts December '09 splash, and is
	otherwise identical to the 2009-10-26 (original Helios) splash.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_eclipsecon10.bmp">
	<figcaption>2010-02-02: EclipseCon 2010 reminder put in the splash, eluded
	to in the December splash theming bug entry.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_eclipsecon10-2.bmp">
	<figcaption>2010-02-03: Move the EclipseCon text up a bit.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_e4.bmp">
	<figcaption>2010-04-08: On this day, the splash is first reverted to the
	2010-01-04 revision, before then being updated to this "e4" (I'm assuming
	"<b>e</b>clipse <b>4</b>.0"?) version. The copyright date on this is wrong,
	stating 2009 instead of 2010.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_sdk4.0-ea.bmp">
<figcaption markdown="1">
2010-05-25: The copyright date is fixed and the rights text font changes. The e4
splash is changed to reflect the new "scope" of this early access release that
Eclipse overall is at SDK v4.0, the fact that the Eclipse Platform is still v3.6
(Helios) (as far as I understand it).[^e4-splash]
</figcaption>
</figure>

[^e4-splash]:
	["Need e4 splash screen and need to define scope of
	change"](https://github.com/eclipse-platform/eclipse.platform/commit/27c297715ffa714dcdd0663dc2955b88f879665e).
	GitHub. Commit `27c2977`{:title="27c297715ffa714dcdd0663dc2955b88f879665e"}.

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_sdk4.0-ea-2.bmp">
	<figcaption>2010-06-14: An alternate e4 splash is made, addressing the same
	issue as the last (2010-05-25) revision. I'm sorry but this is the first
	truly ugly looking splash in this list. I really don't like it. The rights
	text font is reverted.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_sdk4.0-ea-3.bmp">
	<figcaption>2010-07-23: Rights text is updated. At least it fits nicely
	within the shape of the moon. At least. The title text is also adjusted to
	align a <i>little</i> nicer.</figcaption>
</figure>

<br class="freset">
<figure class="fcenter" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.6_sdk4.1.bmp">
	<figcaption>2010-12-17: The SDK version in the splash goes from early access
	to (assumedly) full release, now version 4.1. Do note, however, that the
	Eclipse Platform itself is still on 3.6 Helios. The copyright text is
	updated to 2011, despite it still being 2010.</figcaption>
</figure>

<p class="freset">
	Eclipse 3.7 "Indigo" was released on June 22<sup>nd</sup>, 2011. Due to the
	fact that—for this short period of time—Eclipse's splash reflects the SDK
	version and not the unified Platform version, no splash for Indigo exists.
	SDK version 4.1 overlaps the tail end of Platform v3.6 Helios and the
	entirety of Indigo.
</p>

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.8_ea.bmp">
	<figcaption>2011-11-29: New splash screen for pre-releases of Platform 3.8
	"Juno". I do not know if the version number 3.8 had been reached yet, nor
	what the SDK version was at at this time.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/3.8_ea-2012.bmp">
	<figcaption>2012-01-12: 2012 copyright.</figcaption>
</figure>

<p class="freset" markdown="1">
	This is a complete assumption, but I'm going to mark this point as when the
	Eclipse Platform and SDK versions re-unite, with a jump from Juno 3.8 @ SDK
	4.1→Juno 4.2. This is a complete shot in the dark but I'm going to
	corroborate it with [Wikipedia's note on
	Juno](https://en.wikipedia.org/wiki/Eclipse_(software)#cite_note-46): (And
	also just blindly make assumptions for the love of it :3)
</p>

> There is a 3.8 release of Eclipse Juno; it is \[…\] available for download
> \[in the development binaries area\]. Eclipse 3.8 provides bugfixes for
> \[3.7\] Indigo \[…\] its maintenance was dual streamed with 4.2.

<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.2.bmp">
	<figcaption>2012-02-04: New graphics for Juno. Back to gorgeous again.
	:)</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.2_adjusted.bmp">
	<figcaption>2012-03-09: Adjusted the vertical alignment of the logo. This
	and the previous revision have both occurred well before Juno's official
	release date, on 2012-06-27.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.3.bmp">
	<figcaption>2013-01-18: Eclipse 4.3 "Kepler". 2013 copyright.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.4.bmp">
	<figcaption>2013-06-19: Eclipse 4.4 "Luna". 2014 copyright despite it not
	even being halfway through 2013; Luna <i>is</i> scheduled for release in
	June 2014, however.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.4_new.bmp">
<figcaption markdown="1">
2014-02-17: You can really see the effect iOS 7 had, can't you? A shame.
Interestingly, this commit includes [a JPEG
version](https://github.com/eclipse-platform/eclipse.platform/blob/8ababc8a5c0188d6e643bada7aac5c13a002fa9a/platform/org.eclipse.platform/EclipseSplash_4.4_.jpg)
of the splash that was never used in the IDE itself.
</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.4_new-2.bmp">
<figcaption markdown="1">
2014-03-28: Repositioned and changed some colours for (theoretically) better
contrast (I don't see it). This version was originally [committed on March
24<sup>th</sup>
(`92a8888`)](https://github.com/eclipse-platform/eclipse.platform/commit/92a8888620fb35f02cc9e605a51c98986ed0a1b9),
but reverted the day after because it was the wrong size. This cropped (and
correct size) version was then committed to replace the version from 2014-02-17.
</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.5.bmp">
	<figcaption>2014-07-06: Eclipse 4.5 "Mars"</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.5_alt.bmp">
<figcaption markdown="1">
2014-07-09: Very minor release name label position tweak. There are two
revisions after this
([`bb5146e`](https://github.com/eclipse-platform/eclipse.platform/commit/bb5146e6b9ba7798692b8af4800ef9878bef02a8)
and
[`a940d7f`](https://github.com/eclipse-platform/eclipse.platform/commit/a940d7f7aedecf3fabf13d051e1658d5bad3e260))
that are minor tweaks of the bitmap file and nothing interesting.
</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.6.bmp">
<figcaption markdown="1">
2015-09-14: Eclipse 4.6 "Neon". Interestingly, instead of a PSD file included
for this splash design, it's an [XCF](https://en.wikipedia.org/wiki/XCF_(file_format))
(GIMP) file instead. Since this version and into the present day, GIMP documents
are used as templates for the splashes instead.
</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.6_temp.bmp">
	<figcaption>2015-11-30: "Temporary" new splash screen (still pending Neon's
	release).</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.6_spash.bmp">
<figcaption markdown="1">
2016-04-20: Neon's final splash! This one's file name is `spash.bmp` however!
This would be remedied just under 6 hours later.
</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.6_final.bmp">
	<figcaption>2016-04-21: Minor bitmap fix and reposition.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.7.bmp">
	<figcaption>2016-06-29: Eclipse 4.7 "Oxygen". Minor re-jiggying of logo
	position.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.7_new.bmp">
<figcaption markdown="1">
2017-05-08: [This
commit](https://github.com/eclipse-platform/eclipse.platform/commit/876b3108f7c745eaee65efe0e3a2d44bfa8ac8fc)
also includes extra information and details about creating new splashes from an
XCF template. Text colour is now an off-white. Added release date to the splash.
</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.7_new-aligned.bmp">
	<figcaption>2017-05-17: Fixed alignment of text(s), changed font and
	capitalisation of release date.</figcaption>
</figure>
<figure class="fright" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.8.bmp">
	<figcaption>2017-06-27: Eclipse 4.8 "Photon"</figcaption>
</figure>

<br class="freset">
<figure class="fcenter" style="width:50%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.8_new.bmp">
	<figcaption>2018-03-05: New Photon splash.</figcaption>
</figure>

<p class="freset">
	4.8 Photon was the last Eclipse release to date to have a codename release
	name. Since then, Eclipse IDE releases have been numbered by their release
	year and month.<br>
	Additionally, the pattern of releasing major releases in June ended with
	Photon. Henceforth, major Eclipse releases occur at the end of each quarter
	(March, June, September, and December).<br>
	With this quarterly release schedule, so comes the new art schedule: 4
	releases per splash artwork. This schedule is offset such that the next
	artwork is shipped with the Q4 (last of the year) release, rather than the
	Q1 (first of the year) release.
</p>

<!-- Sketchy ordering for rows: leftAlign(1, 2), rightAlign(4, 3) yields 1, 2,
3, 4 all nicely lined up -->
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.9.bmp">
	<figcaption>2018-06-07: Eclipse 4.9 "2018-09". This commit refers to this
	splash as "temporary," but this image ended up being what
	shipped.</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.10.bmp">
	<figcaption>2018-09-05: Eclipse 4.10 "2018-12". This is yet another
	"temporary" splash that shipped as-is.</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.12.bmp">
	<figcaption>2019-03-07: Eclipse 4.12 "2019-06"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.11.bmp">
	<figcaption>2018-12-06: Eclipse 4.11 "2019-03". Fourth consecutive
	"temporary" splash that shipped.</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.12_final.bmp">
	<figcaption>2019-05-31: <i>Non-temporary</i> splash for 2019-06. This breaks
	the streak.</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.13.bmp">
	<figcaption>2019-06-07: Eclipse 4.13 "2019-09"…And we're back to
	not-so-"temporary" splash images shipping again!</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.15.bmp">
	<figcaption>2019-12-06: Eclipse 4.15 "2020-03"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.14.bmp">
	<figcaption>2019-09-09: Eclipse 4.14 "2019-12"</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.16.bmp">
	<figcaption>2020-03-07: Eclipse 4.16 "2020-06". I believe this is the time
	when I began to use Eclipse! This revision was replaced on 2020-04-09
	because this original splash accidentally included colour profile
	information when it shouldn't (product of absolutely ancient (like
	2001/2002) code that requires very very specific bitmaps).</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.17.bmp">
	<figcaption>2020-06-05: Eclipse 4.17 "2020-09". This is the first release
	where they stopped naming splashes "temporary" in the commit logs and then
	shipping them lol.</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.19.bmp">
	<figcaption>2020-12-04: Eclipse 4.19 "2021-03"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.18.bmp">
	<figcaption>2020-09-02: Eclipse 4.18 "2020-12"</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.20.bmp">
	<figcaption>2021-03-05: Eclipse 4.20 "2021-06"</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.21.bmp">
	<figcaption>2021-06-04: Eclipse 4.21 "2021-09"</figcaption>
</figure>

<p class="fright" style="width:50%" markdown="1">
	This marks the end of `splash.bmp`. In
	[`b4cf501`](https://github.com/eclipse-platform/eclipse.platform/commit/b4cf50115af4d89d83672c029c2985f45f2e3735)
	(4.22 development build dated 2021-09-04 (see below)), `splash.bmp` was
	superseded by `splash.png`. Purposefully or not, this resolves the May
	3<sup>rd</sup>, 2002 _FIXME_ left in the original Eclipse Project CVS
	repository after 19 years!
</p>

<br class="freset">
### `splash.png`[^png-history]
{:style="display:inline"}

[^png-history]:
	["History for
	eclipse.platform/platform/org.eclipse.platform/splash.png"](https://github.com/eclipse-platform/eclipse.platform/commits/c7ebd249316ab1ba4affcc9ca2b9e25c26eaa151/platform/org.eclipse.platform/splash.png).
	eclipse-platform on GitHub. This is where I got the history (to date) for
	`splash.png`.

<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.23.png">
	<figcaption>2021-11-26: Eclipse 4.23 "2022-03"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.22.png">
	<figcaption>2021-09-04: Eclipse 4.22 "2021-12"</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.24.png">
	<figcaption>2022-03-05: Eclipse 4.24 "2022-06"</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.25.png">
	<figcaption>2022-06-04: Eclipse 4.25 "2022-09"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.27.png">
	<figcaption>2022-12-01: Eclipse 4.27 "2023-03"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.26.png">
	<figcaption>2022-09-03: Eclipse 4.26 "2022-12"</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.28.png">
	<figcaption>2023-03-25: Eclipse 4.28 "2023-06". Interestingly, this file
	shows up as encoded as a JPEG, despite having a PNG file extension. Could
	just be GitHub compression when I'm viewing it though.</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.29.png">
	<figcaption>2023-06-06: Eclipse 4.29 "2023-09". Same weird JPEG thing as
	before; it persists into the current-day version.</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.31.png">
	<figcaption>2023-11-26: Eclipse 4.31 "2024-03"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.30.png">
	<figcaption>2023-09-04: Eclipse 4.30 "2023-12"</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.32.png">
	<figcaption>2023-03-01: Eclipse 4.32 "2024-06". When I first saw this, I
	thought it looked AI-generated. I hope it's not. Not my goat…not my
	goat…</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.33.png">
	<figcaption>2024-06-03: Eclipse 4.33 "2024-09"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.35.png">
	<figcaption>2024-11-22: Eclipse 4.35 "2025-03"</figcaption>
</figure>
<figure class="fright" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.34.png">
	<figcaption>2024-09-01: Eclipse 4.34 "2024-12"</figcaption>
</figure>

<br class="freset">
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.36.png">
	<figcaption>2025-03-03: Eclipse 4.36 "2025-06". Saw this when I updated
	Eclipse recently. Besides the 2013 and prior splashes, this one has gotta be
	my favourite. (And so, by extension, this is my favourite since <i>I've</i>
	started using Eclipse)</figcaption>
</figure>
<figure class="fleft" style="width:25%">
	<img src="/media/blog/2025/07-08_eclipse-splash-history/4.37.png">
	<figcaption>2025-06-01: Eclipse 4.37 "2025-09"</figcaption>
</figure>
<figure class="fright" style="width:25%">
    <img src="/media/blog/2025/07-08_eclipse-splash-history/4.39.png">
<figcaption markdown="1">
2025-09-04: We get a new "futureSplashScreens" directory[^fss], which shows
the new(?) process for each development stint and how future art goes
_here_ (presumably so that contemporary dev builds for \<upcoming\> show
the art for \<latest stable\>, and the \<upcoming\> art is still _prepared_
to ship).
</figcaption>
</figure>
<figure class="fright" style="width:25%">
    <img src="/media/blog/2025/07-08_eclipse-splash-history/4.38.png">
    <figcaption>2025-09-01: Eclipse 4.38 "2025-12"</figcaption>
</figure>

[^fss]:
    ["[RelEng] Add release preparation script to update the
    Splash-screen"](https://github.com/eclipse-platform/eclipse.platform/commit/316cc9cb027fc2fff1cadcd0e5cf7048a80046aa).
    GitHub. Commit `316cc9c`.

…And so that leaves us off where we are right now. The current version of
Eclipse is 2025-09, with development builds out for 2025-12, and even a splash
ready for 2026-03.

<p class="freset">
	Ideally, I'll try to keep this article updated in the future with future
	releases of Eclipse. I love it. Writing this article has been very
	insightful to the different eras of Eclipse's development: from IBM's idea
	to the intense and passionate open-source community that came from this
	project, from antiquated software frameworks to the present day—it's been
	kinda awesome to track the progress of the Eclipse Platform through commit
	logs.<br>
	It's awesome to see the close-knit community of developers who knew each
	other and had such a great passion for this project that they all worked on,
	and that they all celebrated each other and their work.
</p>

I totally think they should build back yearly codenamed releases because they're
cool and also there's hundreds of moons in the solar system still to name
releases after! :P <small>In my…not-an-Eclipse-contributor-nor-project-lead
opinion…</small>

<p style="text-align:center" markdown="1">
	_Long live Eclipse!_<br>
	Going through all this history has made me like this IDE even more.
</p>
