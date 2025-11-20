/*
 * AUTHOR: toydotgame
 * CREATED: 2025-11-08
 * Simple script that downloads and runs in async to HTML parse purely to add
 * an inline style to :root to change the bg as the page is loading (hopefully
 * unnoticeably).
 */

const BACKGROUNDS = ["clouds-crazy.webp", "dark-sky.webp", "tree-clouds.webp"];

document.documentElement.style
	.setProperty("--bg-img", 'url("/media/resources/bg/'
		+ BACKGROUNDS[Math.floor(Math.random()*BACKGROUNDS.length)]
		+ '")');
