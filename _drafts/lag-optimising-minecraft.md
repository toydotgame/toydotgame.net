---
title: "More is not better: A guide to making Minecraft less laggy"
---

<small markdown="1">This article is based on a [GitHub Issue
comment](https://github.com/embeddedt/ModernFix/issues/595#issuecomment-3193424218)
I wrote on this topic. But better.</small>

<!--
	TOPICS:
	* CS
    	* Garbage collector
        	* Flaws: It exists and it needs to do its job at some point
    	* Heap: Allocated and used
    	* Threads
  	* Minecraft
    	* GC specifics
    	* MSPT vs fps
    	* gt vs rt
    	* Tick phases
    	* F3 useful info fields
        	* explanation of the profiler
    	* Internal server
  	* Misconceptions
    	* OptiFine
    	* Forge
    	* More CPU cores/threads or GPU will impact anything
    	* More ram is not more better
    	* Thread priority (win)/niceness (unix)
    	* Render distance
  	* What do I do?
    	* RAM allocation
        	* What else is running on ur PC? (e.g. if it crashes)
    	* Mods
        	* Client
        	* Server (incl. internal server)
      	* Mod loader
    	* JVM
    	* Settings
        	* Vanilla
        	* By mod
      	* Sometimes custom libraries help
-->

A lot of the advice you hear about optimising Minecraft performance generally
seems to give the idea that if you get a RTX 9999 Ti Pro Max Plus+, dedicate 2
TB of RAM, and download OptiFine—then surely you'll have *the best* possible
Minecraft setup. It's just plain wrong.

> ## Contents
> This is a combo meal infodump, educational piece, and resource for Minecraft
> optimisation. You can read it all or just skip to what you care about:
> * **Part 1:** Misconceptions
> * **Part 2:** How Minecraft works
> * **Part 3:** How to do it Right™
{:.callout-info.fright style="width:50%"}

Through this article, I'll debunk/explain how you should *actually* understand
and approach this problem. I'm intending this for the general audience of
Minecraft players, and not particularly tech-savvy, so if you *do* know what
software rendering and garbage collection is, then you won't need to read much
past my general points.

## Part 1: How Minecraft works
This article is about Minecraft **Java Edition**. As its name suggests, the
original version of Minecraft was and still is written in the *Java* programming
language.

### _Okay so what's a Java?_
#### High- and low-level programming languages
Java is what you'd call a **high-level programming language**. "Level" doesn't
actually mean anything to do with the skill or expertise needed to use the
programming language. Instead, the concept of a **low-** and **high-level**
language is the extent to which the programmer has to actually, well…program the
computer.
* A **low-level** language is something like the family of **assembly**
  languages for different computer architectures. Here, programmers will write
  mnemonics like `MOV EAX, 0x10C` to tell the physical circuitry of your
  computer what to do. These letters can *directly* be turned into the 1s and 0s
  that represent electrical signals going on physically before you.<br>
  The problem is that stuff gets arduous *fast*: it's awesome that as humans we
  learned How to Make Sand[^silicon] Think, but the 10 lines of assembly to add
  two numbers pales in comparison to *a whole game*. [Chris Sawyer made the
  original _RollerCoaster Tycoon_ in 99%
  assembly](https://en.wikipedia.org/wiki/RollerCoaster_Tycoon_(video_game)#Development)—and
  he's a programming legend for it. That's a lot of time and effort
* A **high-level** language is like C, Java, or Rust. Instead of manually
  telling the processor how to set up and perform an addition, we can just type
  things like `10 + 3`{:.highlight.language-java} and then **compile** the code
  we typed into the 1s and 0s that tells the computer to do this, and _then_ we
  run it. (A *compiler* is another program that can understand the *high-level
  code* we wrote and turn it into *low-level* machine code (1s and 0s) that the
  computer understands)<br>
  A language's features will each represent tens, hundreds, or thousands of
  lines of assembly. This makes something like making a whole game a *lot* less
  daunting

[^silicon]: Technically elemental Silicon, which is _often_ farmed from sand.

Generally when talking about an actual programming *language*, we often mean a
high-level one.<br>
Unfortunately for your understanding thus far, we also use the terms "low-" and
"high-level" *relatively*—language-to-language.
* For example, we might call **C** "low-level" since it's very simple and manual.
  This is great for performance, reliability, and the power to do *anything*,
  but is also just an extension of the same issue we had with assembly:
	* In assembly, it was taking us 10 lines to do something C could let us
	  write in 1
	* In C, drawing something like a desktop window is still going to be like
	  100 lines. Sure, it's abstracting away probably 10,000 lines of assembly,
	  but damn
	* C, being more manual, also means we have to do things like **memory
	  allocation and deallocation**, as in we have to tell the OS (e.g. Windows)
	  how much RAM we want to use/free up
* Something we might call "high-level" would be **Java**. To extend the C
  example, C's 100 lines to draw a window could be done in 6:
  ```java
  JFrame frame = new JFrame();
  frame.setSize(200, 200);
  frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  JPanel panel = new JPanel();
  frame.add(panel);
  frame.setVisible(true);
  ```
  We say "high-level" here because these lines all represent hundreds of
  thousands of miniscule operations within your computer just to achieve this
  empty window on your screen.<br>
  The cost here is that Java doesn't have the same powers to let us manage
  memory or fiddle around with the hyper-specifics of how we make the computer
  do something. i.e. We can tell it *what* to do, but can't control much as to
  *how*—that's already been decided for us

### Garbage collection
Managing memory in a low-level language like C sucks. If we don't allocate
memory for ourselves and then put some data there, we **overflow the heap** and
our program crashes and probably breaks something else too. If we *do* allocate
the memory, use it, but then *don't de*allocate it, next time we need some space
we will allocate *extra*, and eventually we end up wasting so much RAM that
there's none left to give us and the computer crashes. If we de-allocate it but
accidentally do so twice? We're left to the wolves on that one.

**Memory management bugs** like these are easily the most commonplace bug found
in the real world. There'll always be some point where you forget if you
`malloc()`{:.highlight.language-c}'d or not—it's inevitable.

#### Back to focusing on Minecraft Java:
A language like Java or Python completely *eliminates* these issues by just
doing it for us. Instead of us asking for RAM, we just get a chunk, and there's
always some other code around (that we didn't write) that's going to give and
free up RAM that we need or don't need.

These languages instead use a **garbage collector** (GC):
* We are given a chunk of RAM to use for our program's data
* We use it
* When we stop using this data, it just sits there
* The GC sees old data we aren't/can't use anymore and frees it up

Doing this automatically means we *never* have to worry about forgetting
anything. We'll always be looked after.

GCs have a **single flaw**!

They exist.

GCs, the "some other code around (that we didn't write)," as part of their
design, *have* to always be sitting around and doing stuff. We don't like this
for our fps! Since when the GC runs and frees up some RAM, it also blocks an
entire thread.

---

## Part 1: Misconceptions
### 1: OptiFine is *not* good
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

#### *Ugh…I really don't care. This is sooo much work. Isn't there something easier?*
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

### 2: Forge just isn't it
Once the darling of the modding scene, Forge Mod Loader (FML), or just *Forge*
was *the* go-to client mods were made for. Unfortunately, despite its ubiquity,
it has befallen a similar fate to OptiFine: it's horrendously slow. Forge is
a steadily-ageing codebase that was created for versions of Minecraft
unrecognisable in the modern day. As such, it's designed to have such a specific
feature set for mod loading that just an empty Forge install will load up so
much internal functions that—even though it'd be *functionally* Vanilla—it takes
*much* longer to boot.

Now, this isn't crazy new news, it's just that generally you see Forge used with
crazy modpacks with triple-digit mod counts and load times in the 5–20 minute
range—depending on your PC.<br>
For this, Forge is *fine*. The best even for this? In my opinion, not at all;
but I can't fight the outright fact that there's a decade+ of mods and stuff
designed with Forge in mind, that competitors like Fabric and LiteLoader just
can't compete with. **But for those of you using Forge for Vanilla gameplay,**
I'd *highly* recommend switching to Fabric.

> I should also mention NeoForge (and whatever else there is these days), which
> are far more modern codebases designed to vaguely address my first point about
> Forge being old and messy with time. They actually (at least from what I've
> heard…) do a pretty alright job at this. But…Forge is still Forge and it's
> still not a great choice for anyone *not* using a crazy non-Vanilla modpack.
{:.callout-info}

### A million-core CPU and/or GPU will make you get 15 trillion fps!!!!!1111!11
> ## Rundown on CPU cores and Minecraft Java Edition
> 