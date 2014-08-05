
    var prevX = 0,
        prevY = 0;

    function setup() {
        $p.size(1000, 400);
        $p.background(255);
        $p.stroke(1);
        $p.strokeWeight(1);
        $p.rect(1, 1, 998, 398);
        $p.line(100, 1, 100, 398)
        $p.smooth();
    }
    $p.setup = setup;
    setup = setup.bind($p);

    function draw() {
        if ($p.__mousePressed && $p.mouseX > 0) {
            $p.line($p.mouseX, $p.mouseY, prevX, prevY);
        }
        prevX = $p.mouseX;
        prevY = $p.mouseY;
    }
    $p.draw = draw;
    draw = draw.bind($p);


