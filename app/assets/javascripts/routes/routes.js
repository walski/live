Live.Router.map(function() {
  // put your routes here
});

Live.IndexRoute = Ember.Route.extend({
  setupController: function(controller) {
    var store = this.get('store');
    controller.set('contacts', store.find('contact'));
    controller.set('sessions', store.find('session'));
  }
});
