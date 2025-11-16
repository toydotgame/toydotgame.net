/*
 * AUTHOR: toydotgame
 * CREATED: 2024-01-01
 * imgmodal.js (site v5): Code to add an image popup modal on click.
 * 
 * 2025-10-29: Code updated for site v6 and was part of loader.js for a bit.
 * 2025-11-13: Code moved back into its own modal.js module. Called by
 * loader.js.
 */

for(let element of document.querySelectorAll("article img:not(.nomodal), #modaldim"))
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
