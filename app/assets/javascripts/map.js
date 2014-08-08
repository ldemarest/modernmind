$(function () {

    function initialize() {

        var mapOptions = {
            center: new google.maps.LatLng(40.783027, -73.965387),
            zoom: 13,
            streetViewControl: false,
            mapTypeControl: false,
            //Theme from http://snazzymaps.com/
            styles: [{
                "featureType": "administrative",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "poi",
                    "stylers": [{
                    "visibility": "simplified"
                }]
            }, {
                "featureType": "poi.park",
                    "elementType": "labels.icon",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "poi.attraction",
                    "elementType": "labels.icon",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "poi.business",
                    "elementType": "labels.icon",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "road",
                    "stylers": [{
                    "visibility": "simplified"
                }]
            }, {
                "featureType": "water",
                    "stylers": [{
                    "visibility": "simplified"
                }]
            }, {
                "featureType": "transit",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "transit.station",
                    "elementType": "labels.icon",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "transit.station.bus",
                    "elementType": "labels.icon",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "landscape",
                    "stylers": [{
                    "visibility": "simplified"
                }]
            }, {
                "featureType": "road.highway",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "road.local",
                    "stylers": [{
                    "visibility": "on" // simplified removes street names
                }]
            }, {
                "featureType": "road.highway",
                    "elementType": "geometry",
                    "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "water",
                    "stylers": [{
                    "color": "#84afa3"
                }, {
                    "lightness": 52
                }]
            }, {
                "stylers": [{
                    "saturation": -77
                }]
            }, {
                "featureType": "road"
            }, {
                "elementType": "labels.icon", //this overwrites a ton of stuff
                "stylers": [{
                    "visibility": "off"
                }]
            }]
        };
        map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
    } 

});