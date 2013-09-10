Live.Session = DS.Model.extend({
  time: DS.attr('date'),
  speaker: DS.attr('string'),
  info: DS.attr('string')
});
