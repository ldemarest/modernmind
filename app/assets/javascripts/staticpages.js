
(function() {

    window.requestAnimationFrame = function() {
    return window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        function(f) {
            window.setTimeout(f,1e3/60);
        }
    }();

    <canvas id="caro"></canvas>

    var canvas = document.getElementById('caro'),
            context = canvas.getContext('2d');

    // resize the canvas to fill browser window dynamically
    window.addEventListener('resize', resizeCanvas, false);

    function resizeCanvas() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            var W = canvas.width;
            var H = canvas.height;
            var ctx = canvas.getContext('2d');
            var vx = 0;
            var img = new Image();
            img.src = 'http://www.stephenwiltshire.co.uk/images/Madrid_Panorama_by_Stephen_Wiltshire.jpg';


            /**
             * Your drawings need to be inside this function otherwise they will be reset when 
             * you resize the browser window and the canvas goes will be cleared.
             */
            drawStuff(); 
    }
    resizeCanvas();

    function drawStuff() {
            (function renderGame() {
    window.requestAnimationFrame(renderGame);
    
    ctx.clearRect(0, 0, W, H);
    
    // ctx.fillStyle = '#333';
    ctx.fillRect(0, 0, W, H);
    
    ctx.drawImage(img, vx, 50);
    ctx.drawImage(img, img.width-Math.abs(vx), 50);


    
    if (Math.abs(vx) > img.width) {
        vx = 0;
    }
    
    vx -= 2;
}());
    }
})();











// We want to move/slide/scroll the background
// as the player moves or the game progresses

// Velocity X




