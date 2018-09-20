// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require main
//= require jquery-2.2.4.min
//= require jquery.magnific-popup.min
//= require jquery.nice-select.min
//= require owl.carousel.min
//= require superfish.min
//= require bootstrap.min
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
	"use strict";

	var window_width 	 = $(window).width(),
	window_height 		 = window.innerHeight,
	header_height 		 = $(".default-header").height(),
	header_height_static = $(".site-header.static").outerHeight(),
	fitscreen 			 = window_height - header_height;


	$(".fullscreen").css("height", window_height)
	$(".fitscreen").css("height", fitscreen);

 if(document.getElementById("default-select")){
  $('select').niceSelect();
};

$('.img-pop-up').magnificPopup({
  type: 'image',
  gallery:{
    enabled:true
  }
});

$('.single-gallery').magnificPopup({
  type: 'image',
  gallery:{
    enabled:true
  }
});

    //  Counter Js
    if(document.getElementById("facts-area")){
      $('.counter').counterUp({
        delay: 10,
        time: 1000
      });
    };



$(document).ready(function() {

  $('html, body').hide();

  if (window.location.hash) {

    setTimeout(function() {

      $('html, body').scrollTop(0).show();

      $('html, body').animate({

        scrollTop: $(window.location.hash).offset().top-62

      }, 1000)

    }, 0);

  }

  else {

    $('html, body').show();

  }

});


  // Header scroll class
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('#header').addClass('header-scrolled');
    } else {
      $('#header').removeClass('header-scrolled');
    }
  })


  $('.active-model-carusel').owlCarousel({
    items:1,
    loop:true,
    margin:30,
    dots: true
  });

  $('.active-exibition-carusel').owlCarousel({
    items:3,
    margin:30,
    autoplay:true,
    loop:true,
    dots: true,
    responsive: {
      0: {
        items: 1
      },
      480: {
        items: 1,
      },
      768: {
        items: 2,
      },
      900: {
        items: 3,
      }

    }
  });

});

//Google Maps
function initMap() {
  // latitude and longitude for different location
  // var name format: location x streetName

 // car marker hosted on imgur
  var carMarker = "https://i.imgur.com/7Vts37R.png";

  //3000 City
  var cityxmc = {lat: -37.811316, lng: 144.962345};
  var cityxeli = {lat: -37.812621, lng: 144.961197};
  var cityxflin = {lat: -37.817611, lng: 144.964273};
  var cityxltbourke = {lat: -37.816001, lng: 144.953093};
  var cityxspring = {lat: -37.813479, lng: 144.973582};

  //3002 East Melbourne
  var eastxalbert = {lat: -37.810182, lng: 144.981044};

  //3008 Docklands
  var dockxbourke = {lat: -37.819007, lng: 144.946385};
  var dockxlatrobe = {lat: -37.814998, lng: 144.945537};

  //3053 Carlton
  var carlxlygon = {lat: -37.798246, lng: 144.967267};
  var carlxgrattan = {lat: -37.800836, lng: 144.967508};

  //map, Melbourne Central
  var map = new google.maps.Map(
    document.getElementById('googleMaps'), {
      zoom: 17,
      center: cityxeli
    });

  // The red marker, positioned for City 3000
  var marker = new google.maps.Marker({position: cityxmc, map: map, icon: carMarker});
  var marker = new google.maps.Marker({position: cityxeli, map: map, icon: carMarker});
  var marker = new google.maps.Marker({position: cityxflin, map: map, icon: carMarker});
  var marker = new google.maps.Marker({position: cityxltbourke, map: map, icon: carMarker});
  var marker = new google.maps.Marker({position: cityxspring, map: map, icon: carMarker});

  // The red marker, positioned for East Melbourne 3002
  var marker = new google.maps.Marker({position: eastxalbert, map: map, icon: carMarker});

  // The red marker, positioned for Docklands 3008
  var marker = new google.maps.Marker({position: dockxbourke, map: map, icon: carMarker});
  var marker = new google.maps.Marker({position: dockxlatrobe, map: map, icon: carMarker});

  // The red marker, positioned for Carlton 3053
  var marker = new google.maps.Marker({position: carlxlygon, map: map, icon: carMarker});
  var marker = new google.maps.Marker({position: carlxgrattan, map: map, icon: carMarker});

  // for assignment purpose set no boundaries -> -90, -180 90,180
  // Set autocomplete project
  var defaultBounds = new google.maps.LatLngBounds(
   new google.maps.LatLng(-90, -180),
   new google.maps.LatLng(90, 180));

  var input = document.getElementById('pac-input');
  var options = {
    bounds: defaultBounds,
      // for future reference if anyone want to set to any country
      // set location only in AU
      //types: ['(cities)'],
      //componentRestrictions: {country: 'au'}
    };

// Create the autocomplete object
var autocomplete = new google.maps.places.Autocomplete(input, options);

autocomplete.bindTo('bounds', map);

autocomplete.setFields(
  ['address_components', 'geometry', 'icon', 'name']);

var infowindow = new google.maps.InfoWindow();
var infowindowContent = document.getElementById('infowindow-content');
infowindow.setContent(infowindowContent);
var marker = new google.maps.Marker({
  map:map,
  //icon: carMarker,
  anchorPoint: new google.maps.Point(0, -29)
});

autocomplete.addListener('place_changed', function() {
  infowindow.close();
  marker.setVisible(false);
  var place = autocomplete.getPlace();
  // if the location not found, it will prompt a dialog box to let user know
  if (!place.geometry) {
    window.alert("The location you search are not found: '" + place.name + "'");
    return;
  }

// If location found then show on map
if (place.geometry.viewport) {
  map.fitBounds(place.geometry.viewport);
} else {
  map.setCenter(place.geometry.location);
  map.setZoom(17);
}

// It will set the location you search with red marker
marker.setPosition(place.geometry.location);
marker.setVisible(true);

var address = '';
if (place.address_components) {
  address = [
  (place.address_components[0] && place.address_components[0].short_name || ''),
  (place.address_components[1] && place.address_components[1].short_name || ''),
  (place.address_components[2] && place.address_components[2].short_name || '')
  ].join(' ');
}

infowindowContent.children['place-icon'].src = place.icon;
infowindowContent.children['place-name'].textContent = place.name;
infowindowContent.children['place-address'].textContent = address;
infowindow.open(map, marker);

});

}



$(document).on('turbolinks:load', function(){
$("table[role='datatable']").each(function(){
$(this).DataTable({

});
});
})

$(document).on('turbolinks:load', function(){
$("tr[data-link]").click(function() {
window.location = $(this).data("link")
});
})
