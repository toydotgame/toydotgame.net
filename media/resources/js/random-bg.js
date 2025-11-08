/*
 * AUTHOR: toydotgame
 * CREATED: 2025-11-08
 * Simple script that runs directly after styles downloading and blocks the
 * render so it can replace the default --bg-img with a randomised one.
 */

const BACKGROUNDS = ["clouds-crazy.jpg", "dark-sky.jpg", "tree-clouds.jpg"];

document.documentElement.style
	.setProperty("--bg-img", 'url("/media/resources/bg/'
		+ BACKGROUNDS[Math.floor(Math.random()*BACKGROUNDS.length)]
		+ '")');
