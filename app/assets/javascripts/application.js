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

// ******** Begin Google Maps ********* //
function initMap() {
  // latitude and longitude for different location
  // var name format: location x streetName

 // car marker hosted on imgur
  var carMarker = "https://i.imgur.com/7Vts37R.png";

  //3000 City
  //var cityxmc = {lat: -37.811316, lng: 144.962345};
  // var cityxeli = {lat: -37.812621, lng: 144.961197};
  // var cityxflin = {lat: -37.817611, lng: 144.964273};
  // var cityxltbourke = {lat: -37.816001, lng: 144.953093};
  // var cityxspring = {lat: -37.813479, lng: 144.973582};

  // //3002 East Melbourne
  // var eastxalbert = {lat: -37.810182, lng: 144.981044};

  // //3008 Docklands
  // var dockxbourke = {lat: -37.819007, lng: 144.946385};
  // var dockxlatrobe = {lat: -37.814998, lng: 144.945537};
  // 
  // //3053 Carlton
  // var carlxlygon = {lat: -37.798246, lng: 144.967267};
  // var carlxgrattan = {lat: -37.800836, lng: 144.967508};

  //map, Melbourne Central 
  var map = new google.maps.Map(
    document.getElementById('googleMaps'), {
      zoom: 17, 
      //center: cityxeli
      center: { lat: gon.locations[0].latitude, lng: gon.locations[0].longitude}
    });

    // ******** BEGIN POP UP WINDOW ******** //
    var contentString = 
      '<div id="content1">'+
      '<div class="container">'+
      '<div class="p-3 mb-6 bg-dark text-white text-center" style="margin-bottom:30px;" >Available Vehicles</div>'+
      '<div class="row">'+
      '<div class="col">'+
      '<img src="https://st.motortrend.com/uploads/sites/10/2017/12/2018-nissan-rogue-s-suv-angular-front.png" alt="nissanSuv" width="300" height="200">'+
      '</div>'+
      '<div class="col text-center">'+
      '<table class="table">'+
      '<tbody>'+
      '<tr>'+
      '<th scope="row">Model</th>'+
      '<td>Insert</td>'+
      '</tr>'+
      '<tr>'+
      '<th scope="row">Year</th>'+
      '<td>Insert</td>'+
      '</tr>'+
      '<tr>'+
      '<th scope="row">Body</th>'+
      '<td>Insert</td>'+
      '</tr>'+
      '</tbody>'+
      '</table>'+
      '<button type="button" class="btn btn-primary">Book Now</button>'+
      '</div>'+
      '</div>'+
      '</div>'+
      '</div>'
    ;
   // ******** END POP UP WINDOW ******** //
  
    //Reference for pulling image<%= image_tag "uteSil.png", alt: "Ute", :width => '100px' %>
    
    for (var i = 0; i < gon.locations.length; i++){
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

      gMapsMarker.addListener('click', function() {
        return this.gMapsInfo.open(map, this);
      });

      //Stable
      //gMapsMarker.addListener('click', function() {
      //  gMapsInfo.open(map, gMapsMarker);
      //});
     

      // var info1 = new google.maps.InfoWindow({
      //   content: contentString,
      //   maxWidth: 600 
      // });
      // marker1.addListener('click', function() {
      //   info1.open(map,marker1);
      // });

    }
      //var info1 = new google.maps.InfoWindow({
      //  content: contentString,
      //  maxWidth: 600 
      //});
      //marker1.addListener('click', function() {
      //  info1.open(map,marker1);
      //});

  //position for marker cityxmc
  // var marker1 = new google.maps.Marker({
  //   position: cityxmc,  
  //   map: map, 
  //   icon: carMarker
  // });


  // The car marker, positioned for City 3000
  //var marker = new google.maps.Marker({position: cityxmc, map: map, icon: carMarker});
  //var marker = new google.maps.Marker({position: cityxeli, map: map, icon: carMarker});
  // var marker = new google.maps.Marker({position: cityxflin, map: map, icon: carMarker});
  // var marker = new google.maps.Marker({position: cityxltbourke, map: map, icon: carMarker});
  // var marker = new google.maps.Marker({position: cityxspring, map: map, icon: carMarker});

  // // The car marker, positioned for East Melbourne 3002
  // var marker = new google.maps.Marker({position: eastxalbert, map: map, icon: carMarker});

  // // The car marker, positioned for Docklands 3008
  // var marker = new google.maps.Marker({position: dockxbourke, map: map, icon: carMarker});
  // var marker = new google.maps.Marker({position: dockxlatrobe, map: map, icon: carMarker});

  // // The car marker, positioned for Carlton 3053
  // var marker = new google.maps.Marker({position: carlxlygon, map: map, icon: carMarker});
  // var marker = new google.maps.Marker({position: carlxgrattan, map: map, icon: carMarker});

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


//Paypal integration
    // Configure environment
   paypal.Button.render({
    env: 'sandbox',
    client: {
      sandbox: 'Ad5qmwmHtRJtHjg8KNIME-hgnOFmTRMgQ9gwgKvRwJhhJj21MoMybjHDLxqkiArv1BwY8nvqEU5FC0A_',
      production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_AU',
    style: {
      size: 'large',
      color: 'gold',
      shape: 'rect',
    },

    // This part can be done using paypal SDK for rails
    payment: function(data, actions) {
      return actions.payment.create({
        transactions: [{
          amount: {
            total: '10.00', //read from the value user select
            currency: 'AUD'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // Show a confirmation message to the buyer
        window.alert('Thank you for your purchase!');
      });
    }
  }, '#paypal-button');

