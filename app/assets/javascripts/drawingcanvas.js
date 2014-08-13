var colorPurple = #cb3594;
var colorGreen = #659b41;
var colorYellow = #ffcf33;
var colorBlue = #0000FF;
var colorRed = #CC0000;
var colorOrange = #FF6600;
var colorBlack = #000000;
var colorWhite = #FFFFFF;
var eraser = #FFEFD5;

var strokeSmall = 1;
var strokeMedium = 8;
var strokeLarge = 23;

var opacitySmall = 10;
var opacityMedium = 100;
var opacityLarge = 255;

var alpha = opacityLarge;
var curColor = colorBlack;
var curStroke = strokeSmall;

$("#red").click(function () {
curColor = colorRed;
});

$("#orange").click(function () {
curColor = colorOrange;
});

$("#yellow").click(function () {
curColor = colorYellow;
});

$("#green").click(function () {
curColor = colorGreen;
});

$("#blue").click(function () {
curColor = colorBlue;
});

$("#purple").click(function () {
curColor = colorPurple;
});

$("#black").click(function () {
curColor = colorBlack;
});

$("#white").click(function () {
curColor = colorWhite;
});

$("#eraser").click(function () {
curColor = eraser;
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
stroke(curColor, alpha);
strokeWeight(curStroke);
if (mousePressed == true) {
line(mouseX, mouseY, pmouseX, pmouseY);
}
}

$p.draw = draw;
draw = draw.bind($p);