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
//= require_tree ./templates
//= require twitter/bootstrap

// start ember

App = Ember.Application.create({
  ready: function() {
    setInterval( function() {
      App.set('currentTime', new Date(2013, 8, 19, 13, 30));
    }, 1000);
  }
});

App.Session = DS.Model.extend({
  time: DS.attr('date'),
  speaker: DS.attr('string'),
  info: DS.attr('string')
});

App.IndexController = Ember.ObjectController.extend({
  needs: ['sessions']
});

App.SessionsController = Ember.ArrayController.extend({
  nextUp: function() {
    return this.find(function(session) {
      return session.get('time') >= App.currentTime;
    });
  }.property('@each', 'currentTime'),

  current: function() {
    return this.find(function(session) {
      var date = session.get('time');
      var duration = 60;
      return date <= App.currentTime && date > new Date(App.currentTime.getTime() - duration * 60000);
    });
  }.property('@each', 'currentTime'),

  currentTimeBinding: Ember.Binding.oneWay('App.currentTime')
});

App.Router.map(function() {
  this.resource('sessions', function() {
    this.resource('session', { path: ':session_id' });
  });
});

App.IndexRoute = Ember.Route.extend({
  setupController: function(controller, model) {
    var store = this.get('store');
    this.controllerFor('sessions').set('model', store.find('session'));
  }
});

App.SessionsRoute = Ember.Route.extend({
  model: function() {
    var store = this.get('store');
    return store.find('session');
  }
});


// app specific

$(document).ready(function () {
  $('body').scrollspy({ target: '#navigation' });
});
