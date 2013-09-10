Live.SessionsController = Ember.ArrayController.extend({
  nextUp: function() {
    return this.filter(function(song) {
      return true;
    });
  }.property('@each')
});
