---
title: Welcome!
updated: 2025-11-08
---

Hi! I'm
toydotgame<sup><a class="noexternal" href="https://en.pronouns.page/@toydotgame">(she/they)</a></sup>!
I'm a software developer (currently 1<sup>st</sup> Year BSc in Info. Tech.) who
specialises in Java, with some additional experience in personal web development
projects in your typical HTML5/CSS3/JS/PHP/etc configurations. Since 2020, I've
run the [ICCMC](https://iccmc.toydotgame.net/) Minecraft server for myself and
my friends. I enjoy homelabbing, and thus have played a lot with that server, my
own personal web services, and a Home Assistant configuration too.

*[BSc]: Bachelor of Science

<img class="fright nomodal" width="64px" src="/media/resources/profile.webp" style="image-rendering:pixelated" />
What you're looking at now is the **_sixth_** iteration of my personal website,
with the first being from 2017. This is also my first serious attempt at using a
static site generator (Jekyll). <small>(Although technically my second attempt
at it overall)</small>

Other than that, I maintain a few of my own [projects](/projects) as FOSS for
the world, I contribute infrequently to Wikipedia, and I'm also a technical
Minecrafter to an extent :3.

*[FOSS]: Free and Open Source Software

## Links
<style>
	.links {
		display:	flex;
			flex-wrap:	wrap;
			gap:		8px;
		justify-content:	center;
	}

	/* Button styles are adapted from v5's "card" page, which are in turn
	 * adapted from https://btxx.org/posts/aui/ */

	.links a {
		all:	unset;
			cursor:	pointer; /* Unset browser styles apparently lmao? */

		/* Min width of 200px for items. max-width of `article` is set such that
		 * (conveniently) this only gives 1 or 2 cols: */
		flex:		0.5 1 200px; /* Hello I am a full-stack web developer from
					                Slop Factory® and this is my masterpiece */
		max-width:	calc(100% - 32px - 1lh); /* 100% minus hor. padding below */
		overflow:	hidden;

		position:		relative; /* SVG anchor */
		padding:		8px;
			padding-left:	calc(24px + 1lh); /* Account for icon */
		color:			#000; /* Lazy match SVG */
		background:		hsl(from var(--accent) h s 82%);
		border:			2px solid var(--accent);
			border-radius:	999px;
		font-size:		1.5em;
		white-space:	nowrap;
		user-select:	none;
		box-shadow:		0 13px 25px	var(--accent) inset,
						0 3px 5px	#0003,
						0 10px 13px	#0002;
		transition:		all 0.05s ease-in-out;
	}

	.links a::before {
		content:		"";
		width:			calc(100% - min(128px, 8%));
		height:			60%;
		position:		absolute;
			top:		0;
			left:		4%;
			z-index:	1;
		background:		linear-gradient(#fffb, #fff0);
		border-radius:	999px;
	}

	.links a:is(:hover, :focus-visible) {
		color:				hsl(0 0 90%); /* Lazy match SVG filter below */
		background:			hsl(from var(--link) h calc(s/1.25) l);
		box-shadow:			0 13px 25px	hsl(from var(--link) h calc(s/2) l) inset,
							0 3px 5px	#0003,
							0 10px 13px	#0002;
		text-decoration:	none !important;
		text-shadow:		1px 1px 2px #000 !important;
		transform:			scale(1.02);
	}

	.links img {
		all:	unset;
			min-width:	unset !important; /* Conflict with main styles specificity */

		width:			1lh;
		position:		absolute;
			top:	8px;
			left:	16px;
		vertical-align:	middle;
	}

	.links a:is(:hover, :focus-visible) img {
		filter:	invert(100%) brightness(90%) drop-shadow(1px 1px 2px #000);
	}
</style>

<div class="links">
	{%- for account in site.data.social-links.active -%}
		<a class="noexternal" href="{{ account.link }}"><img class="nomodal" src="/media/resources/card-icons/{{ account.logo }}.svg" /> {{ account.site }}</a>
	{%- endfor -%}
</div>

<style>
	summary::marker {
		content:	"";
	}

	summary::-webkit-details-marker { /* Safari. Embarrassing */
		display:	none;
	}

	summary * {
		margin:	0 !important;
	}

	details[open] summary small, summary:is(:focus-visible, :hover) small {
		visibility:	hidden;
	}

	summary h3 {
		margin-top:	-0.25lh !important;
	}

	summary h3:hover {
		text-decoration:	dashed underline;
	}
</style>

<details>
	<summary style="cursor:pointer; text-align:center;"><small>(click)</small><h3>Inactive-ish accounts</h3></summary>
	<div class="links">
		{%- for account in site.data.social-links.inactive -%}
			<a class="noexternal" href="{{ account.link }}"><img class="nomodal" src="/media/resources/card-icons/{{ account.logo }}.svg" /> {{ account.site }}</a>
		{%- endfor -%}
	</div>
</details>

<!-- Mastodon verification because I'm too lazy to implement this dynamically: -->
<a class="hidden" href="https://tech.lgbt/@toydotgame" rel="me"></a>
