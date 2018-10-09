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
//= require moment 
//= require fullcalendar
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

//var contentString=[];
// ******** Begin Google Maps ********* //
function initMap() {

 // car marker hosted on imgur
  var carMarker = "https://i.imgur.com/7Vts37R.png";

  //map, Melbourne Central 
  var map = new google.maps.Map(
    // Default position when maps open
    document.getElementById('googleMaps'), {
      zoom: 17, 
      //center: cityxeli
      center: { lat: gon.locations[0].latitude, lng: gon.locations[0].longitude}
    });
  
  for (var i = 0; i < gon.locations.length; i++){
    for (var x = 0; x < gon.vehicles.length; x++){
      if (i<gon.vehicles.length){
        if (gon.vehicles[x].location_id == gon.locations[i].id){
          var contentString="";
            //alert(gon.vehicles[x].model);
            contentString = 
            '<div id="content1">'+
              '<div class="container">'+
              '<div class="p-3 mb-6 bg-dark text-white text-center" style="margin-bottom:30px;" >Available Vehicless</div>'+
              '<div class="row">'+
              '<div class="col">'+
              '<img src="'+ gon.vehicle_images[gon.vehicles[x].id]+' width="150px" height="150px">'+
              '</div>'+
              '<div class="col text-center">'+
              '<table class="table">'+
              '<tbody>'+
              '<tr>'+
              '<th scope="row">Make</th>'+
              '<td>'+
              gon.vehicles[x].make +
              '</td>'+
              '</tr>'+
              '<tr>'+
              '<th scope="row">Model</th>'+
              '<td>'+
              gon.vehicles[x].model +
              '</td>'+
              '</tr>'+
              '<tr>'+
              '<th scope="row">Year</th>'+
              '<td>'+
              gon.vehicles[x].year +
              '</td>'+
              '</tr>'+
              '<tr>'+
              '<th scope="row">Body</th>'+
              '<td>'+
              gon.vehicles[x].body +
              '</td>'+
              '</tr>'+
              '</tbody>'+
              '</table>'+
              "<a href=booking?vec=" + gon.vehicles[x].id +  " class='btn btn-info' role='button'>Book Now</a>"+
              '</div>'+
              '</div>'+
              '</div>'+
            '</div>'
            ;    
          }
        }
      }

      var gMapsMarker = new google.maps.Marker({
        position: { lat: gon.locations[i].latitude, lng: gon.locations[i].longitude},
        map: map,
        icon: carMarker
        });

      var gMapsInfo = new google.maps.InfoWindow({
        content: contentString,
        maxWidth: 600 
      });

      gMapsMarker.gMapsInfo = gMapsInfo;
       
       google.maps.event.addListener(gMapsMarker, 'click', function() {
	 	this.gMapsInfo.open(map, this);
	});
    }
  // Completed set red marker base on user input
  // Set autocomplete project, for assignment purpose set no boundaries -> -90, -180 90,180
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
// ******** END Google Maps ********* //


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
