Live.Router.map(function() {});
 
Live.IndexRoute = Ember.Route.extend({
  setupController: function(controller) {
    var store = this.get('store');
    controller.set('model', store.find('session'));
  }
});
