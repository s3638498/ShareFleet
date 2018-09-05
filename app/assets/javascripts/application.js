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
//= require_tree .

//= require main
//= require bootstrap.min
//= require jquery.magnific-popup.min
//= require jquery.nice-select.min
//= require owl.carousel.min
//= require superfish.min
//= require jquery-2.2.4.min




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




  // Initiate superfish on nav menu
  $('.nav-menu').superfish({
    animation: {
      opacity: 'show'
    },
    speed: 400
  });


    //$( function() {
    //    $( "#datepicker" ).datepicker();
    //    $( "#datepicker2" ).datepicker();
    // });
  

  // Mobile Navigation
  if ($('#nav-menu-container').length) {
    var $mobile_nav = $('#nav-menu-container').clone().prop({
      id: 'mobile-nav'
    });
    $mobile_nav.find('> ul').attr({
      'class': '',
      'id': ''
    });
    $('body').append($mobile_nav);
    $('body').prepend('<button type="button" id="mobile-nav-toggle"><i class="lnr lnr-menu"></i></button>');
    $('body').append('<div id="mobile-body-overly"></div>');
    $('#mobile-nav').find('.menu-has-children').prepend('<i class="lnr lnr-chevron-down"></i>');

    $(document).on('click', '.menu-has-children i', function(e) {
      $(this).next().toggleClass('menu-item-active');
      $(this).nextAll('ul').eq(0).slideToggle();
      $(this).toggleClass("lnr-chevron-up lnr-chevron-down");
    });

    $(document).on('click', '#mobile-nav-toggle', function(e) {
      $('body').toggleClass('mobile-nav-active');
      $('#mobile-nav-toggle i').toggleClass('lnr-cross lnr-menu');
      $('#mobile-body-overly').toggle();
    });

    $(document).click(function(e) {
      var container = $("#mobile-nav, #mobile-nav-toggle");
      if (!container.is(e.target) && container.has(e.target).length === 0) {
        if ($('body').hasClass('mobile-nav-active')) {
          $('body').removeClass('mobile-nav-active');
          $('#mobile-nav-toggle i').toggleClass('lnr-cross lnr-menu');
          $('#mobile-body-overly').fadeOut();
        }
      }
    });
  } else if ($("#mobile-nav, #mobile-nav-toggle").length) {
    $("#mobile-nav, #mobile-nav-toggle").hide();
  }

  // Smooth scroll for the menu and links with .scrollto classes
  $('.nav-menu a, #mobile-nav a, .scrollto').on('click', function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      if (target.length) {
        var top_space = 0;

        if ($('#header').length) {
          top_space = $('#header').outerHeight();

          if( ! $('#header').hasClass('header-fixed') ) {
            top_space = top_space;
          }
        }

        $('html, body').animate({
          scrollTop: target.offset().top - top_space
        }, 1500, 'easeInOutExpo');

        if ($(this).parents('.nav-menu').length) {
          $('.nav-menu .menu-active').removeClass('menu-active');
          $(this).closest('li').addClass('menu-active');
        }

        if ($('body').hasClass('mobile-nav-active')) {
          $('body').removeClass('mobile-nav-active');
          $('#mobile-nav-toggle i').toggleClass('lnr-times lnr-bars');
          $('#mobile-body-overly').fadeOut();
        }
        return false;
      }
    }
  });


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


function initMap() {
  // latitude and logitude for different location
  // var name in location x streetName

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
  var marker = new google.maps.Marker({position: cityxmc, map: map});
  var marker = new google.maps.Marker({position: cityxeli, map: map});
  var marker = new google.maps.Marker({position: cityxflin, map: map});
  var marker = new google.maps.Marker({position: cityxltbourke, map: map});
  var marker = new google.maps.Marker({position: cityxspring, map: map});

  // The red marker, positioned for East Melbourne 3002
  var marker = new google.maps.Marker({position: eastxalbert, map: map});

  // The red marker, positioned for Docklands 3008
  var marker = new google.maps.Marker({position: dockxbourke, map: map});
  var marker = new google.maps.Marker({position: dockxlatrobe, map: map});

  // The red marker, positioned for Carlton 3053
  var marker = new google.maps.Marker({position: carlxlygon, map: map});
  var marker = new google.maps.Marker({position: carlxgrattan, map: map});

  // Set autocomplete project
  var defaultBounds = new google.maps.LatLngBounds(
      //new google.maps.LatLng(-33.8902, 151.1759),
      //new google.maps.LatLng(-33.8474, 151.2631));
      
      // set not boundaries
     new google.maps.LatLng(-90, -180),
     new google.maps.LatLng(90, 180));
  
  var input = document.getElementById('pac-input');
  var options = {
      bounds: defaultBounds,
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
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
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

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);

        document.getElementById('use-strict-bounds')
            .addEventListener('click', function() {
              console.log('Checkbox clicked! New state=' + this.checked);
              autocomplete.setOptions({strictBounds: this.checked});
            });

}

 

