/*
 * AUTHOR: toydotgame
 * CREATED ON: 2023-12-16
 * Content-loading script so that I can update nav, header and footer,
 * etc all here and have it dynamically update across all pages.
 */

document.querySelector("#nav").innerHTML = `
<div id="navpfp"></div><h1>toydotgame</h1>
<a href="/home">home</a>
|
<a href="/blog/">blog</a>
|
<a href="/projects/">projects</a>
|
<a href="/utils">utils</a>
|
<a href="/">card</a>
<hr>
`;

for(let element of document.querySelectorAll(".cite")) {
	let refNumber = element.getAttribute("href").substring(1); // element.href yields mangled result; trim off "#"
	element.style.setProperty("--txt", '"['+refNumber+']"'); // CSS cascade effectively overwrites content
}

// Run imgmodal code:
import {} from "/media/js/imgmodal.js";

let recentblogs = `
<div id="recentblogs">
<h1>Recent Blog Posts</h1>
<ul>
	<li><a href="/blog/2025/07-08_eclipse-splash-history"><b>2025-07-08:</b> History of the Eclipse IDE Splash Screen</a></li>
	<li><a href="/blog/2025/01-18_how-to-downgrade-from-ios-9-to-6"><b>2025-01-18:</b> How to Downgrade from iOS 9 to iOS 6</a></li>
	<li><a href="/blog/2024/07-23_mbs"><b>2024-07-23:</b> The Tale of Minecraft's Baddest Server</a></li>
	<li><a href="/blog/2024/06-17_versioning"><b>2024-06-17:</b> toy's Standardised Versioning</a></li>
	<li><a href="/blog/2024/01-03_fs-measurements"><b>2024-01-03:</b> Digital Metric Unit Nomenclature for Dummies</a></li>
</ul>
</div>
`;

let visitorCounter = `
<p id="visitorCounter">I don't know what number visitor you are!</p>
<br>
`;

let badges = `
<img src="/media/resources/badges/toydotgame.gif" width="88">
<a href="https://one.one.one.one/"><img src="/media/resources/badges/1.1.1.1.gif" width="88"></a>
<img src="/media/resources/badges/8pride.gif" width="88">
<a href="https://web.archive.org/web/19980509035420if_/http://www.apple.com/"><img src="/media/resources/badges/apple.gif" width="88"></a>
<img src="/media/resources/badges/bi.gif" width="88">
<a href="https://escargot.chat/"><img src="/media/resources/badges/escargot.gif" width="88"></a>
<img src="/media/resources/badges/genderfluid.gif" width="88">
<img src="/media/resources/badges/mslive.gif" width="88">
<img src="/media/resources/badges/nyaabanner.gif" width="88">
<img src="/media/resources/badges/trans.gif" width="88">
<img src="/media/resources/badges/virtualdiva.gif" width="88">
<a href="https://en.wikipedia.org/"><img src="/media/resources/badges/wikipedia.gif" width="88"></a>
<a href="https://www.7-zip.org/"><img src="/media/resources/badges/7z.gif" width="88"></a>
<img src="/media/resources/badges/win7.gif" width="88">
<img src="/media/resources/badges/invalidator.gif" width="88">
<img src="/media/resources/badges/vcss-blue.gif" width="88">
<a href="https://thardwardy.com/"><img src="/media/resources/badges/thardwardy.gif" width="88"></a>
<img src="/media/resources/badges/2019.gif" width="88">
<a href="https://cyber.dabamos.de/88x31/"><img src="/media/resources/badges/88x31.gif" width="88"></a>
<img src="/media/resources/badges/abrowser.gif" width="88">
<img src="/media/resources/badges/anythingbut.gif" width="88">
<a href="https://archlinux.org/"><img src="/media/resources/badges/archlinux.gif" width="88"></a>
<img src="/media/resources/badges/cssdif.gif" width="88">
<a href="https://www.dell.com/"><img src="/media/resources/badges/dell.gif" width="88"></a>
<a href="https://www.mozilla.org/en-US/firefox/new/"><img src="/media/resources/badges/firefox3.gif" width="88"></a>
<img src="/media/resources/badges/gregg.gif" width="88">
<a href="https://archive.org/donate"><img src="/media/resources/badges/internetarchive.gif" width="88"></a>
<img src="/media/resources/badges/miku.gif" width="88">
<a href="https://minecraft.net/"><img src="/media/resources/badges/minecraft.gif" width="88"></a>
<img src="/media/resources/badges/minibanner.gif" width="88">
<img src="/media/resources/badges/right2repair.gif" width="88">
<a href="https://yesterweb.org/no-to-web3/"><img src="/media/resources/badges/roly-saynotoweb3.gif" width="88"></a>
<img src="/media/resources/badges/transnow2.gif" width="88">
<a href="https://donate.wikimedia.org/"><img src="/media/resources/badges/donate-wikipedia.gif" width="88"></a>
`;

// Double `<br>` because first one occurs on the same line as last badge:
let footer = `
<br><br>
<p>Website © 2025 toydotgame</p>
`;

try {
	document.querySelector("#footer").innerHTML = "<hr>"+recentblogs+visitorCounter+badges+footer;
} catch {
	// Extra `<br>` to have nicer padding because there's no recentblogs margins:
	document.querySelector("#blogfooter").innerHTML = "<hr><br>"+visitorCounter+badges+footer;
	document.querySelector("#blogfooter").id = "footer";
}

try {
	const RESPONSE = await fetch("https://raw.githubusercontent.com/toydotgame/toydotgame.github.io/refs/heads/visitor-count/visitor-count"); // Throws AbortError, NotAllowedError, TypeError
	if(!RESPONSE.ok) throw new Error( // HTTP error, so throw that too
		"Got a "+RESPONSE.status+" error when trying to fetch visitor count!"
	);

	const VISITOR_COUNT = await RESPONSE.text(); // Throws DOMException, TypeError
	document.querySelector("#visitorCounter").innerHTML
		= "You are the <b>"+getLocalizedOrdinalSuffix(VISITOR_COUNT)+"</b> visitor!";
} catch(e) {
	console.error(e.message);
}

/**
 * Converts an integer (stored as type string) to a comma-separated string (for
 * orders of magnitude, i.e. 1,000, 1,000,000, etc), with an ordinal suffix
 * (i.e. -<i>st</i>, -<i>nd</i>, -<i>rd</i>, -<i>th</i>) appended.<br>
 * <br>
 * Returns +1 of the value because the fetched number from the get-visitor-count
 * Action is technically exclusive of this current visitor. (Not very accurate
 * but hey the best we can assume is +1)
 * @param {string} number Plain digits-only string to work on
 * @returns {string} Number with ordinal suffix and commas
 * @throws {TypeError} If the input number is not a number
 */
function getLocalizedOrdinalSuffix(number) {
	if(!Number.isInteger(Number(number)))
		throw new TypeError("Number \""+number+"\" is not a number!");

	const X = Number(number)+1, X_ORDINAL = X.toLocaleString();
	const LAST_DIGIT = X%10, LAST_TWO_DIGITS = X%100;

	// 11, 12, and 13th are exceptions whose ordinal suffix is "th":
	if(LAST_TWO_DIGITS >= 11 && LAST_TWO_DIGITS <= 13) return X_ORDINAL+"th";

	switch(LAST_DIGIT) {
		case 1:
			return X_ORDINAL+"st";
		case 2:
			return X_ORDINAL+"nd";
		case 3:
			return X_ORDINAL+"rd";
		default:
			return X_ORDINAL+"th";
	}
}
