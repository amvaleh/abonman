// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require skel.min
//= require skel-viewport.min
//= require util
//= require main
//= require jquery.easyModal



// $("recover_modal").easyModal();
// var recover = document.getElementById('recover_password');
// recover.addEventListener('click', function() {
//   // alert("in");
//   $("modal1").easyModal();
//   $("modal1").trigger('openModal');
// } , false);

$('#modal1').easyModal({
	top: 200,
	overlayOpacity: 0.9,
});

$('#recover_password').click(function(e){
	$('#modal1').trigger('openModal');
	e.preventDefault();
});
