---
title: "More is not better: A guide to making Minecraft less laggy"
---

<small markdown="1">This article is based on a [GitHub Issue
comment](https://github.com/embeddedt/ModernFix/issues/595#issuecomment-3193424218)
I wrote on this topic. But better.</small>

A lot of the advice you hear about optimising Minecraft performance generally
seems to give the idea that if you get a RTX 9999 Ti Pro Max Plus+, dedicate 2
TB of RAM, and download OptiFine—then surely you'll have *the best* possible
Minecraft setup. It's just plain wrong.

Through this article, I'll debunk/explain how you should *actually* understand
and approach this problem. I'm intending this for the general audience of
Minecraft players, and not particularly tech-savvy, so if you *do* know what
software rendering and garbage collection is, then you won't need to read much
past my general points.

## 1: OptiFine is *not* good
No matter which way you wanna look at it, it's no longer 2014: OptiFine hasn't
been the best mod for *any* of its features for a solid 7+ years or so now. Its
heyday was definitely in the late Beta era up until maybe 1.12 or so, and even
these days there are mods made now for these old versions that weren't made back
then, so OptiFine isn't always the best choice for the versions released when it
*was* at its peak.

OptiFine has many, many features, which made it ubiquitous for being a
single-mod-fits-all solution to getting:
* More fps
* Shaders
* Advanced entity texturing in resource packs
* Custom entity modelling
* Advanced video options
* Capes!
* Support for HD texture packs
* Colourmap texturing (e.g. biome and potion colours)

The problem with having a massive feature set + time is that all this gets
*hard* to maintain, and eventually each feature individually is just gonna suck
a little more and just run a *little* slower and a *little* more buggy by the
day.

To put the downsides into explicit terms:
* OptiFine is **closed source**. Unlike *most* modern mods, OptiFine's code
  isn't available to the public to view and contribute to. OptiFine's developer,
  sp614x has sole access and control over its code, and all you download is the
  assembled mod JAR file which you cannot decipher it's inner workings. This
  lends itself to a few problems:
	* **Malicious code:** You're blindly running code you can't even see. An
	  **open source** mod will have *thousands* of watchful eyes on the code at
	  any given time. Go on and *try* to put malware in that; open source mods
	  will, by nature, be secure beyond belief in ways OptiFine couldn't achieve
	  if it *tried*.

	  **TL;DR:** We're just taking sp614x's word for it that they aren't running
	  malware on all of our computers. There's no easy way of knowing for sure
	  at all
* It's *just* sp614x maintaining it. **One developer.** This means:
	* Updating OptiFine to newer versions is completely dependent on how fast
	  sp614x can code
	* At any point, if sp614x retires, falls ill, or whatever—**OptiFine is
	  gone**. For good
		* They can also just *choose* to not update the mod
		* My point being that all your eggs are in a single person's basket. Not
		  only is it incredibly unresponsive and slow, but outright risky to
		  depend on
* Further to both above, a *single* developer on a closed source project means
  that it's up to the maintainer to keep OptiFine running smooth. Slacking off
  in code quality and/or maintenance means OptiFine gets worse, and there's no
  team members or community of hundreds of contributors to constantly be making
  micro-optimisations.

If OptiFine were open source, it won't hinge on the time, effort, and health of
a single person. If sp614x abandons OptiFine tomorrow, that's it; whereas with
open source mods: it's all public. While the mod is maintained, it gets updates
and the community helps keep it optimised and fixes bugs (at a rate of hundreds
of developers—not one!). If the owner decides to abandon the mod, the code is
still there. Someone else can take the lead of the community and keep
updating/maintaining the mod themselves! See also:
* **Giselbaer's Durability Viewer:** Abandoned in 2023, but recently another
  developer has picked it up again in 2025, and it's being updated and improved
  still!
* **ToroHealth:** Abandoned in 2022
	* Some unofficial continuations kept maintaining it since then, but died
	  around 2023–2024 IIRC
	* Development on another fork began in 2025 and it's still being updated
	  AFAIK

OptiFine *was* good and *did* do all of its stuff nicely, but it has *really*
become more and more messy. Not to mention that sp614x's development style
hinges more and more on overwriting Minecraft and Forge code to get stuff to
work—lazy bodge work. This is why there's a ton of stuff that *doesn't* work
with OptiFine straight-up; it's because of lazy and downright neglectful
development.

Another issue is that OptiFine is indeed just a single file. It's not nice to
say it, but you *will have to* replace this one mod with a ton more:

| OptiFine feature             | Replacement mod |
| :--------------------------: | --------------- |
| More fps                     | [Sodium](https://modrinth.com/mod/sodium) (general (client))<br>[Entity Culling](https://modrinth.com/mod/entityculling) (entity lag)<br>[FerriteCore](https://modrinth.com/mod/ferrite-core) (Java lag)<br>[Lithium](https://modrinth.com/mod/lithium) (general (server))<br>[ImmediatelyFast](https://modrinth.com/mod/immediatelyfast) (lazy loading/client launch times)<br>[ModernFix](https://modrinth.com/mod/modernfix) (general)<br>[More Culling](https://modrinth.com/mod/moreculling) (leaves and other super-fast-graphics-like options)<br>[Enhanced Block Entities](https://modrinth.com/mod/ebe) (block entity lag) |
| Shaders                      | [Iris](https://modrinth.com/mod/iris) (Fabric) or [Oculus](https://modrinth.com/mod/oculus) (Forge) |
| Advanced entity texturing    | [ETF](https://modrinth.com/mod/entitytexturefeatures) |
| Advanced item texturing      | [CIT Resewn](https://modrinth.com/mod/cit-resewn) |
| Advanced GUI texturing       | [OptiGUI](https://modrinth.com/mod/optigui) |
| Custom entity modelling      | [EMF](https://modrinth.com/mod/entity-model-features) |
| Advanced video options       | [Sodium Extra](https://modrinth.com/mod/sodium-extra) |
| Capes                        | [Capes](https://modrinth.com/mod/capes) |
| Colourmap texturing          | [Polytone](https://modrinth.com/mod/polytone) or [Colormatic](https://modrinth.com/mod/colormatic) |
| Connected textures           | [Continuity](https://modrinth.com/mod/continuity) |
| Zoom                         | [Zoomify](https://modrinth.com/mod/zoomify) or [Logical Zoom](https://modrinth.com/mod/logical-zoom) (very OptiFine-like) |
| Dynamic lighting             | [LambDynamicLights](https://modrinth.com/mod/lambdynamiclights) |

Alas, there's a lot more to mention on top of that to be 100% complete. This
covers a good 95% of it all, though.

The upside? The performance you will get with *just* these and fiddling about
will be a **lot** better than Vanilla or OptiFine could ever get you. For the
sake of my point (and not actual reliable figures), given the Vanilla fps below,
see:

<table>
	<thead>
		<tr><th>Vanilla</th><th>OptiFine</th><th>All of that</th></tr>
	</thead>
	<tbody>
		<tr><td class="tnum">30</td><td class="tnum">50</td><td class="tnum">180</td></tr>
	</tbody>
</table>

### *Ugh…I really don't care. This is sooo much work. Isn't there something easier?*
Yeah. Sure. Use a modpack! These days, there are tons of modpacks with the
*sole* purpose of being a one-click-fix-all fps booster with no additional
fluff. Launchers like [Prism](https://prismlauncher.org/) even make downloading,
installing, and managing all this _way_ nicer than it was in *þe
olde*{:style="font-family:fantasy"} CurseForge days.

* **[Fabulously Optimized](https://modrinth.com/modpack/fabulously-optimized)**
  is a very popular pack with some goodies like zoom mods that's very popular as
  a new-age stand-in for OptiFine. Its performance to effort ratio is awesome,
  and will easily double, triple, quadruple, (etc) your Vanilla fps
* _But if you wanna go further…_ **[Simply
  Optimized](https://modrinth.com/modpack/sop)** will do that! Easily triple
  your numbers *again*

Here's some actually real and proven numbers from my own testing setup on my
own computer I did a while back:

<table>
	<thead>
		<tr><th></th><th>Vanilla</th><th>Fabulously Optimized</th><th>Simply Optimized</th><th>My own setup (read on)</th></tr>
	</thead>
	<tbody>
		<tr><th style="text-align:right">Average</th><td class="tnum">40–60</td><td class="tnum">80–100</td><td class="tnum">160–200</td><td class="tnum">220–230</td></tr>
		<tr><th style="text-align:right">When it chugs</th><td class="tnum">10–20</td><td class="tnum">70–80</td><td class="tnum">120–150</td><td class="tnum">130–180</td></tr>
	</tbody>
</table>
