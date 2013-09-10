Live.SessionsController = Ember.ArrayController.extend({
  nextUp: function() {
    return this.find(function(session) {
      return session.get('id') === '3';
    });
  }.property('@each')
});
