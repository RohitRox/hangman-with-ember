module.exports = App.IndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('hangman')
  setupController: (controller, model)->
    @_super(controller, model)
    # initialize game variables
    problems = model.content
    # get a random from model
    rand = problems[Math.floor(Math.random() * problems.length)]
    # prepare a words array with active false, in the view active is used for show/hide
    word_array = rand.get('word').split('').map (w)->
      {letter: w, active: false}
    controller.set('current_problem', rand)
    controller.set('current_word', word_array)
    score = @store.createRecord('score',{value: 0})
    # set a current_score, current_score holds score for a game session, ie until game is over
    controller.set('current_score', score)
    # sort scores by id desc so that latest score comes on top in UI
    scores = Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      content: [controller.current_score]
      sortProperties: ['id']
      sortAscending: false
    controller.set('scores', scores)
