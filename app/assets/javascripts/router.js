Live.Router.map(function() {
  this.route("contacts");
  this.route("sessions");
});

Live.ContactsRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('contact');
  }
});
Live.SessionsRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('session');
  }
});
