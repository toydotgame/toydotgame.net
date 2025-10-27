/*
 * AUTHOR: toydotgame
 * CREATED ON: 2024-01-01
 * Code to add an image popup modal on click. 
 */

// Look, I could use document.createElement() slop, but innerHTML is short and
// sweet and is totally safe to this use case:
document.querySelector("#content").innerHTML
	+= '<div id="modaldim" style="display:none;"><img id="modalimg"></div>';
let modal = document.querySelector("#modaldim");
let img = document.querySelector("#modalimg");

for(let element of document.querySelectorAll("#content img:not(#modalimg), #modaldim"))
	element.addEventListener("click", onClick);

function onClick(e) {
	// Don't change the modal image's src if e.target.src is null. This happens
	// very rarely but does cause a HTTP 404 and is annoying so…
	if(e.target.src != null) img.src = e.target.src;
	if(modal.style.display == "none") modal.style.display = "block";
	else modal.style.display = "none";
}
