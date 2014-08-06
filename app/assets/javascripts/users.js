$(document).ready(function() {

    window.requestAnimationFrame = function() {
        return window.requestAnimationFrame ||
            window.webkitRequestAnimationFrame ||
            window.mozRequestAnimationFrame ||
            window.msRequestAnimationFrame ||
            window.oRequestAnimationFrame ||
            function(f) {
                window.setTimeout(f, 1e3 / 60);
            }
    }();

    var canvas = document.querySelector('#front_page');
    var ctx = canvas.getContext('2d');

    var W = canvas.width;
    var H = canvas.height;

    // We want to move/slide/scroll the background
    // as the player moves or the game progresses

    // Velocity X
    var vx = 0;

    var img = new Image();
    img.src = 'http://www.tate.org.uk/art/images/work/P/P78/P78459_10.jpg';

    (function renderGame() {
        window.requestAnimationFrame(renderGame);

        ctx.clearRect(0, 0, W, H);

        ctx.fillStyle = '#333';
        ctx.fillRect(0, 0, 500, 400);

        ctx.drawImage(img, vx, 50);
        ctx.drawImage(img, img.width - Math.abs(vx), 50);

        if (Math.abs(vx) > img.width) {
            vx = 0;
        }

        vx -= 2;
    }());

});