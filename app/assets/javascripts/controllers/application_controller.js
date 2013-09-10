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
