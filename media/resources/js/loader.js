/*
 * AUTHOR: toydotgame
 * CREATED: 2025-10-29
 * Script to load/modify the document in non-essential ways (ideally this site
 * won't REQUIRE JavaScript to run to work). This succeeds the v5
 * contentloader.js (created 2023-12-16) and imgmodal.js (created 2024-01-01).
 * This script is run as a module from the document head, and thus is only run
 * once the entire page is downloaded.
 */

// IMAGE MODAL

for(let element of document.querySelectorAll("article img:not(.banner img), #modaldim"))
	element.addEventListener("click", onImageClick);
let modal = document.querySelector("#modaldim");
let modalimg = document.querySelector("#modaldim img");

/**
 * Handles click events on content images or the image modal itself. Regardless
 * of the event target, the modal's display will be toggled.
 * @param {PointerEvent} e <code>click</code> event sent by the target
 */
function onImageClick(e) {
	// Don't change the modal image's src if e.target.src is null. This happens
	// very rarely but does cause a HTTP 404 and is annoying so…:
	if(e.target.src != null) modalimg.src = e.target.src;

	if(modal.className == "hidden") modal.className = "";	// Show
	else modal.className = "hidden";						// Hide
}

// EXTERNAL LINK MARKING

for(let i of document.querySelectorAll("article a"))
	if(i.hostname != window.location.hostname)
		i.classList.add("external"); // Won't duplicate if already there

// VISITOR COUNTER

try {
	const RESPONSE = await fetch("https://raw.githubusercontent.com/toydotgame/toydotgame.net/refs/heads/visitor-count/visitor-count"); // Throws AbortError, NotAllowedError, TypeError
	if(!RESPONSE.ok) throw new Error( // HTTP error, so throw that too
		"Got a "+RESPONSE.status+" error when trying to fetch visitor count!"
	);

	const VISITOR_COUNT = await RESPONSE.text(); // Throws DOMException, TypeError
	document.querySelector("#visitor-counter").innerHTML
		= "You are the <b>"+getLocalizedOrdinalSuffix(VISITOR_COUNT)+"</b> visitor!";
} catch(e) {
	console.warn("Error when loading visitor counter: "+e.message);
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

	// 11th, 12th, and 13th are exceptions whose ordinal suffix is "th":
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

// NAV PFP SPIN ANIMATION (Let it complete)

const NAV_PFP = document.querySelector("header h1 img");
NAV_PFP.addEventListener("click", () => {
	NAV_PFP.classList.add("animating");
});
NAV_PFP.addEventListener("animationend", () => {
	NAV_PFP.classList.remove("animating");
});
