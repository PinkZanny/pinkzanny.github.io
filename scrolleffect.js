const intro = document.querySelector('.intro');
const video = document.querySelector('video');
const text = intro.querySelector('h1');
const vh = Math.max(document.documentElement.clientHeight || 0, window.innerHeight || 0)

const controller = new ScrollMagic.Controller()

let scene = new ScrollMagic.Scene({
    duration: 4500,
    triggerElement: intro,
    triggerHook: 0
}).setPin(intro).addTo(controller);

let scene2 = new ScrollMagic.Scene({
    duration: 4000,
    triggerElement: intro,
    triggerHook: 0,
})

const textAnim = TweenMax.fromTo(text, 4, {opacity: 1}, {opacity: 0});

let accelAmount = 0.1;
let scrollpos = 0;
let delay = 0;

scene.on('update', e => {
    scrollpos = e.scrollPos / 1000;  
})

setInterval(() => {
    delay += (scrollpos - delay) * accelAmount;
    video.currentTime = delay;
}, 16.6); //1000 / fps
