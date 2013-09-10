Live.Router.map(function() {
  this.resource('sessions', function() {
    this.resource('session', { path: ':session_id' });
  });
});

// Live.Router.reopen({
//   location: 'history'
// });

Live.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('sessions');
  }
});

Live.SessionsRoute = Ember.Route.extend({
  model: function() {
    var store = this.get('store');
    return store.find('session')
  }
});
