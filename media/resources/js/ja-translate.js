/*
 * AUTHOR: toydotgame
 * CREATED: 2025-11-09
 * A simple inline script to replace the more statically-set English components
 * of _most_ of an article with Japanese versions. It's far from rigorous but
 * it's really more of just a patch fix for the v6 migration of my few Japanese
 * articles. :3
 */

document.documentElement.lang = "ja";

let aeroSections = document.querySelectorAll("body > *");
for(let section of aeroSections) {
	try {
		section.dataset.aeroTitle = section.dataset.aeroTitle
			.replace("Navigation",  "ナビゲーション")
			.replace("Blog: ", "ブログ：")
			.replace("Moar!!!", " フッター");
	} catch {}
}

let siteTitle = document.querySelector("header h1");
siteTitle.innerHTML = siteTitle.innerHTML
	.replace("toy​dot​game", "トイ​ドット​ゲーム"); // Note ZWSP present in source and replacement

let subtitle = document.querySelector(".subtitle");
subtitle.innerHTML = subtitle.innerHTML
	.replace("Written: ", "書いた：")
	.replace("Last updated: ", "更新した：");

let subtitleDates = document.querySelectorAll(".subtitle b");
for(let date of subtitleDates)
	date.innerText = date.innerText
		.replace(/-0*/, "年")
		.replace(/-0*/, "月")
		+ "日";

let footerRename = document.createElement("style");
footerRename.innerHTML = `
	.footnotes::before {
		content:	"脚注・参考文献";
	}
`;
document.head.appendChild(footerRename);
