/**
 * @name SmoothScrollBD
 * @author Obscure.#4719
 * @description Smooth Scroll for BetterDiscord
 * @version 1.0.0
 * @invite B9TK7nqRE4 
 * @authorId 755436063828213821
 * @website https://github.com/Obscure-Git/Lavender
 * @source https://github.com/LynithDev/SmoothScrollPowerCord
 */

module.exports = class ExamplePlugin {
    load() {}
    start() {
	let ssb;
	ssb = document.createElement("script");
	ssb.id = "SmoothScrollBD";
	ssb.type = "text/javascript";
	ssb.src = "https://cdn.jsdelivr.net/gh/LynithDev/SmoothScrollPowerCord@master/smoothscroll.js";
	document.head.appendChild(ssb);
}
    stop() {} 
}