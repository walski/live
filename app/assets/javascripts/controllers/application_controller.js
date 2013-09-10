Live.SessionsController = Ember.ArrayController.extend({
  nextUp: function() {
    return this.find(function(session) {
      var date = session.get('time');
      var duration = 30;
      return date >= Live.currentTime && date < new Date(Live.currentTime.getTime() + duration * 60000);
    });
  }.property('@each', 'currentTime'),

  current: function() {
    return this.find(function(session) {
      var date = session.get('time');
      var duration = 30;
      return date <= Live.currentTime && date > new Date(Live.currentTime.getTime() - duration * 60000);
    });
  }.property('@each', 'currentTime'),

  currentTimeBinding: Ember.Binding.oneWay('Live.currentTime')
});
