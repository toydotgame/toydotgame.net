---
title: Projects
updated: 2025-11-10
aero-icon: /media/resources/aerico/welcome.png
mathjax: true
permalink: /projects/ # Permalink for the same reason as the blog index
---

I've made a lot of stuff over the years. The *vast majority* of it is generally
private, single-use stuff I never really maintain, however. For the things I
*do* maintain, they're generally somewhat-maintained projects I am passionate
about and/or use frequently.

<style>
	article img {
		border-radius:	unset !important;
		outline:		unset !important;
	}

	.fleft {
		border-radius:	12px !important; /* Remember 8px is padding */
	}

	.shield {
		display:	inline;
		height:		1em;
		min-width:	unset !important;
		padding:	0;
		object-fit:	contain;
	}

	p:has(.shield) {
		margin-bottom:	unset;
	}
</style>

## Active projects
### Old Google
<img class="fleft" src="/media/projects/old-google.png" width="20%">

![](https://img.shields.io/amo/users/old-google?style=plastic&label=Firefox%20Active%20Users&labelColor=2a2a2f&color=5865f2){:.shield}
![](https://img.shields.io/github/downloads/toydotgame/Thisway/total?style=plastic&label=GitHub%20Users&labelColor=2a2a2f&color=5865f2){:.shield}

[**Old Google**](https://addons.mozilla.org/en-GB/firefox/addon/old-google/)
started in 2021 as a simple JavaScript thing I would paste into the inspector
console on the Google homepage to swap the logo's image
`src`{:.highlight.language-html} value to that of the 2011(?)–2013 logo. From
there, it spiralled into 800 other things and to this day it's maintained as a
general-purpose logo and new-age-crap-remover utility (now packaged as a Firefox
addon!) for *all* Google search engines.

### ToyPack
<img class="fleft" src="/media/projects/toypack.png" width="20%">

![](https://img.shields.io/github/downloads/toydotgame/ToyPack/total?style=plastic&label=GitHub%20Users&labelColor=2a2a2f&color=5865f2){:.shield}

[**ToyPack**](https://github.com/toydotgame/ToyPack/) (my personal Minecraft
resource pack) _was_ a port of CodeCrafted (1.11) and Vanilla Tweaks (1.16 at
the time) to my version: 1.6.4. From there, it inevitably spiralled into *just a
few more Vanilla Tweaks* here and there, etc. Eventually, I even started
modifying and creating my own textures for it. Today, it includes **multiple
pages**' worth of features and changes, and things like GLSL shaders for
Minecraft written mostly *by me* despite me *never having once touched GLSL
before then*.

*[GLSL]: OpenGL Shading Language

### Racecarts++
<img class="fleft" src="/media/projects/racecartsplusplus.png"
	width="20%" style="aspect-ratio:1/1; object-fit:contain">

[**Racecarts++**](https://github.com/toydotgame/racecartsplusplus/) is my first
proper Minecraft datapack. It does one thing: make Minecarts go fast.[^1]

[^1]:
	As of creating this datapack, the 1.21 Minecart experiments weren't even
	rumours yet. Additionally, my implementation still differs from what Mojang
	eventually *did* implement in-game—so I still maintain Racecarts++ for these
	latest versions.

### chestloaders
[**chestloaders**](https://github.com/toydotgame/chestloaders) is a pack I
created because there just *wasn't* a simple datapack to chunk load Chest
Minecarts in a Vanilla-friendly way that suited any server style.

My main desire (and subsequently the way *chestloaders* works) is that Chest
Minecarts load chunks around them exclusively when travelling over a distance.
(This eliminates stationary carts from chunk loading forever, which will
generate lag regardless of if it is abused intentionally or not) This helps for
sending long-distance rail-based messages without the need for a player to help
deliver it manually!

## Life support
These guys haven't been updated in a while and I'll probably finish them up at
some point to be laid to rest and no longer maintained.

### Thisway
<img class="fleft" src="/media/projects/thisway.png" width="20%">

![](https://img.shields.io/spiget/downloads/87115?style=plastic&label=Spigot%20Users&labelColor=2a2a2f&color=5865f2){:.shield}
![](https://img.shields.io/github/downloads/toydotgame/Thisway/total?style=plastic&label=GitHub%20Users&labelColor=2a2a2f&color=5865f2){:.shield}

[**Thisway**](https://www.spigotmc.org/resources/thisway.87115/) was my first
real Java project, my first Spigot plugin, my first server-side software, and
my first real meant-for-public-consumption software. Its initial MVP/release was
on 26 December 2020.<br>
Thisway is simply a utility command plugin to allow you to teleport $n$ blocks
in the direction you're facing. That's it.

Thisway is slowly being prepared for it's final release, through the process of
a major refactor in 2025. Over the last <small>nearly</small> 5 years, I've
actually learnt what OOP means and does—and how to program it. Given I'm
*considerably better* at programming now, I think my ancient 2020/2021 Thisway
code deserves a good update before I send it off For Good.

*[OOP]: Object-Oriented Programming

### Collatz Sequence Generator
[This](https://github.com/toydotgame/collatz-sequence-generator/) was an
implementation of the [$3n+1$
problem](https://en.wikipedia.org/wiki/Collatz_conjecture) in Java. Kinda during
the middle of a Java-using gap for me, _so its usefulness and code quality
leaves some questions…_

## EoL
*[EoL]: End-of-Life

### Other Spigot plugins
Around the time I made Thisway, I made a bunch of other equally-simple utility
plugins for Minecraft operators. Combined (and including Thisway), it's
something in the range of **1,100–1,400 total users** (servers) using them[^2].

[^2]: Pedant's note: this is a summed figure.

Excluding a few boring/incomplete ones, I'll list off:

[SinglePlayerSleep](https://www.spigotmc.org/resources/singleplayersleep.91195/)
: <img class="fleft" src="/media/projects/ssp.png" width="10%">
  
  ![](https://img.shields.io/spiget/downloads/91195?style=plastic&label=Spigot%20Users&labelColor=2a2a2f&color=5865f2){:.shield}
  ![](https://img.shields.io/github/downloads/toydotgame/SinglePlayerSleep/total?style=plastic&label=GitHub%20Users&labelColor=2a2a2f&color=5865f2){:.shield}

  Before 1.13's multiplayer sleep threshold gamerule(s) and datapacks' similar
  implemented functionality to do this, there was no real way (other than `/time
  set 6000` of course) to skip to dawn with may players online. This plugin
  served to emulate Hermitcraft Season 3's (new at the time) plugin of the same
  function.

[SleepMessage](https://www.spigotmc.org/resources/sleepmessage.91191/)
: <img class="fleft" src="/media/projects/ssp.png" width="10%">
  
  ![](https://img.shields.io/spiget/downloads/91191?style=plastic&label=Spigot%20Users&labelColor=2a2a2f&color=5865f2){:.shield}
  ![](https://img.shields.io/github/downloads/toydotgame/SleepMessage/total?style=plastic&label=GitHub%20Users&labelColor=2a2a2f&color=5865f2){:.shield}

  An emulation of Minecraft Legacy Console Editions "\<Player\> is sleeping in a
  bed" chat messages.

[SetWorldSpawn](https://github.com/toydotgame/SetWorldSpawn/)
: `/setworldspawn` came in 1.7.2. I played 1.6.4. The Spigot API provided the
  ability to move the world spawn. I wanted to move the world spawn.<br>
  Simple as.

[Gamemode](https://github.com/toydotgame/Gamemode/)
: ![](https://img.shields.io/github/downloads/toydotgame/Gamemode/total?style=plastic&label=GitHub%20Users&labelColor=2a2a2f&color=5865f2){:.shield}
  
  `/gamemode <id|name>` command shorthand (e.g. `/gmc`, `/gms`).
