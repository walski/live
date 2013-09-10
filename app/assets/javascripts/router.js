App.Router.map(function() {
  this.resource('sessions', function() {
    this.resource('session', { path: ':session_id' });
  });
});

App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('sessions');
  }
});

App.SessionsRoute = Ember.Route.extend({
  model: function() {
    var store = this.get('store');
    return store.find('session');
  }
});
