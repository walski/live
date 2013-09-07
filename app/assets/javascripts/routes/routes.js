Live.Router.map(function() {
  // put your routes here
});

Live.IndexRoute = Ember.Route.extend({
  model: function() {
    var store = this.get('store');
    return store.find('contact');
  }
});
