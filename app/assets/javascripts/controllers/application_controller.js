Live.SessionsController = Ember.ArrayController.extend({
  nextUp: function() {
    console.log('fump');
    return this.find(function(session) {
      return session.get('id') === '3';
    });
  }.property('@each', 'currentTime'),

  currentTimeBinding: Ember.Binding.oneWay('Live.currentTime')
});
