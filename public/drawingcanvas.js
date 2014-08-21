
var purpleR  = 203;
var purpleG = 53;
var purpleB = 148;
var greenR = 101;
var greenG = 155;
var greenB = 65;
var yellowR = 255;
var yellowG = 207;
var yellowB = 5;
var blueR = 0;
var blueG = 0;
var blueB = 255;
var redR = 255;
var redG = 0;
var redB = 0;
var orangeR = 255;
var orangeG = 102;
var orangeB = 0;
var blackR = 0;
var blackG = 0;
var blackB = 0;
var whiteR = 255;
var whiteG = 255;
var whiteB = 255;
var eraserR = 255;
var eraserG = 239;
var eraserB = 213;

var strokeSmall = 1;
var strokeMedium = 8;
var strokeLarge = 23;

var opacitySmall = 10;
var opacityMedium = 100;
var opacityLarge = 255;

var alpha = opacityLarge;
var red = blackR;
var green = blackG;
var blue = blackB;
var curStroke = strokeSmall;

$("#red").click(function () {
red = redR;
green = redG;
blue = redB;
});

$("#orange").click(function () {
red = orangeR;
green = orangeG;
blue = orangeB;
});

$("#yellow").click(function () {
red = yellowR;
green = yellowG;
blue = yellowB;
});

$("#green").click(function () {
red = greenR;
green = greenG;
blue = greenB;
});

$("#blue").click(function () {
red = blueR;
green = blueG;
blue = blueB;
});

$("#purple").click(function () {
red = purpleR;
green = purpleG;
blue = purpleB;
});

$("#black").click(function () {
red = blackR;
green = blackG;
blue = blackB;
});

$("#white").click(function () {
red = whiteR;
green = whiteG;
blue = whiteB;
});

$("#eraser").click(function () {
red = eraserR;
green = eraserG;
blue = eraserB;
});

$("#stroke-small").click(function () {
curStroke = strokeSmall;
});

$("#stroke-medium").click(function () {
curStroke = strokeMedium;
});

$("#stroke-large").click(function () {
curStroke = strokeLarge;
});

$("#opacity-small").click(function () {
alpha = opacitySmall;
});

$("#opacity-medium").click(function () {
alpha = opacityMedium;
});

$("#opacity-large").click(function () {
alpha = opacityLarge;
});

function setup() {
$p.colorMode(RGB, 255, 255, 255, 255);	
$p.size(900, 400);
$p.background(255, 239, 213);
// b = loadImage("paper.jpg");
// $p.background(b);
$p.smooth();
$p.frameRate(60);
}

$p.setup = setup;
setup = setup.bind($p);

function draw() {
stroke(red, blue, green, alpha);
strokeWeight(curStroke);
if (mousePressed == true) {
line(mouseX, mouseY, pmouseX, pmouseY);
}
}

$p.draw = draw;
draw = draw.bind($p);