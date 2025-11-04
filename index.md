---
title: Welcome!
---

Hi! I'm
toydotgame<sup><a class="noexternal" href="https://en.pronouns.page/@toydotgame">(she/they)</a></sup>!
I'm a software developer (currently 1<sup>st</sup> Year
<abbr title="Bachelor of Science"><b>BSc</b></abbr> in Info. Tech.) who
specialises in Java, with some additional experience in personal web development
projects in your typical HTML5/CSS3/JS/PHP/etc configurations. Since 2020, I've
run the [ICCMC](https://iccmc.toydotgame.net/) Minecraft server for myself and
my friends. I enjoy homelabbing, and thus have played a lot with that server, my
own personal web services, and a Home Assistant configuration too.

<img class="fright nomodal" width="64px" src="/media/resources/profile.png" style="image-rendering:pixelated" />
What you're looking at now is the **_sixth_** iteration of my personal website,
with the first being from 2017. This is also my first serious attempt at using a
static site generator (Jekyll). <small>(Although technically my second attempt
overall)</small>

Other than that, I maintain a few of my own [projects](/projects) as
<abbr title="Free and Open Source Software">FOSS</abbr> for the world, I
contribute infrequently to Wikipedia, and I'm also a technical Minecrafter to an
extent :3.

## Links
<style>
	.links {
		display:	grid;
			grid-template-columns:	1fr 1fr;
			gap:					8px;
		overflow-x:	ckip; /* This sucks */
	}

	/* Button styles are adapted from v5's "card" page, which are in turn
	 * adapted from https://btxx.org/posts/aui/ */

	.links a {
		all:	unset;
			cursor:	pointer; /* Unset browser styles apparently lmao? */

		position:		relative; /* SVG anchor */
		padding:		8px;
			padding-left:	calc(24px + 1lh); /* Account for icon */
		color:			#000; /* Lazy match SVG */
		background:		hsl(from var(--accent) h s 82%);
		border:			2px solid var(--accent);
			border-radius:	999px;
		font-size:		1.5em;
		vertical-align:	middle;
		box-shadow:		0 13px 25px	var(--accent) inset,
						0 3px 5px	#0003,
						0 10px 13px	#0002;
		transition:		all 0.05s ease-in-out;
	}

	.links a::before {
		content:		"";
		width:			92%;
		height:			60%;
		position:		absolute;
			top:		0;
			left:		4%;
			z-index:	1;
		background:		linear-gradient(#fffb, #fff0);
		border-radius:	999px;
	}

	.links a:hover {
		color:			hsl(0 0 90%); /* Lazy match SVG filter below */
		background:		hsl(from var(--link) h calc(s/1.25) l);
		box-shadow:		0 13px 25px	hsl(from var(--link) h calc(s/2) l) inset,
						0 3px 5px	#0003,
						0 10px 13px	#0002;
		text-shadow:	1px 1px 2px #000;
		transform:		scale(1.02);
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

	.links a:hover img {
		filter:	invert(100%) brightness(90%) drop-shadow(1px 1px 2px #000);
	}
</style>

<div class="links">
	{% for account in site.data.social-links.active %}
		<a class="noexternal" href="{{ account.link }}"><img class="nomodal" src="/media/resources/card-icons/{{ account.logo }}.svg" /> {{ account.site }}</a>
	{% endfor %}
</div>

<details>
	<summary style="cursor:pointer; text-align:center;"><small>(click)</small><h3>Inactive Accounts</h3></summary>
	<a class="button" rel="me" href="https://tech.lgbt/@toydotgame"><img class="svg" src="/media/resources/card/icons/mastodon.svg">Mastodon</a>
	<a class="button" href="https://bsky.app/profile/toydotgame.bsky.social"><img class="svg" src="/media/resources/card/icons/bluesky.svg">Bluesky</a>
	<a class="button" href="https://www.pinterest.com/toydotgame/"><img class="svg" src="/media/resources/card/icons/pinterest.svg">Pinterest</a>
	<a class="button" href="https://bandcamp.com/toydotgame"><img class="svg" src="/media/resources/card/icons/bandcamp.svg">Bandcamp</a>
	<a class="button" href="https://en.pronouns.page/@toydotgame"><img class="svg" src="/media/resources/card/icons/zaimki.svg">pronouns.page</a>
	<a class="button" href="https://threads.net/@toydotgame"><img class="svg" src="/media/resources/card/icons/threads.svg">Threads</a>
	<a class="button" href="https://reddit.com/u/toydotgame"><img class="svg" src="/media/resources/card/icons/reddit.svg">Reddit</a>
	<a class="button" href="https://toydotgame.tumblr.com/"><img class="svg" src="/media/resources/card/icons/tumblr.svg">Tumblr</a>
	<a class="button" href="https://twitch.tv/toydotgame"><img class="svg" src="/media/resources/card/icons/twitch.svg">Twitch</a>
	<a class="button" href="https://www.minecraftforum.net/members/toydotgame"><img class="svg" src="/media/resources/card/icons/minecraft.svg">Minecraft Forum</a>
	<a class="button" href="https://www.planetminecraft.com/member/toydotgame/"><img class="svg" src="/media/resources/card/icons/mcsrv.svg">Planet Minecraft</a>
	<a class="button" href="https://xboxgamertag.com/search/toydotgame"><img class="svg" src="/media/resources/card/icons/xbox.svg">Xbox Live</a>
	<a class="button" href="https://www.sevenforums.com/members/toydotgam.html"><img class="svg" src="/media/resources/card/icons/7f.svg">SevenForums</a>
	<a class="button" href="https://www.tenforums.com/members/toydotgam.html"><img class="svg" src="/media/resources/card/icons/10f.svg">TenForums</a>
	<a class="button" href="https://addons.mozilla.org/en-US/firefox/user/17086453/"><img class="svg" src="/media/resources/card/icons/amo.svg">AMO</a>
	<a class="button" href="https://www.dndbeyond.com/members/Toydotgam"><img class="svg" src="/media/resources/card/icons/dnd.svg">D&D Beyond</a>
	<a class="button" href="https://bbs.archlinux.org/profile.php?id=146622"><img class="svg" src="/media/resources/card/icons/archlinux.svg">Arch Forums</a>
	<a class="button" href="https://en.wikipedia.org/wiki/User:Toydotgame"><img class="svg" src="/media/resources/card/icons/wikipedia.svg">Wikipedia</a>
	<a class="button" href="https://www.spigotmc.org/members/toydotgam.1096646/"><img class="svg" src="/media/resources/card/icons/mcsrv.svg">SpigotMC</a>
	<a class="button" href="https://scratch.mit.edu/users/Toydotgam/"><img class="svg" src="/media/resources/card/icons/scratch.svg">Scratch</a>
</details>