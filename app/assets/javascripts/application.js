// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require handlebars
//= require ember
//= require ember-data
//= require_self
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./templates
//= require router
//= require twitter/bootstrap

// start ember

Live = Ember.Application.create({
  ready: function() {
    setInterval( function() {
      Live.set('currentTime', new Date(2013, 8, 19, 12));
    }, 1000);
  }
});

// app specific

$(document).ready(function () {
  $('body').scrollspy({ target: '#navigation' });
});
