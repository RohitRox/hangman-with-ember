# extend from Ember.Evented http://stackoverflow.com/questions/15991871/ember-js-how-to-trigger-view-method-from-controller
module.exports = App.IndexController = Ember.Controller.extend Ember.Evented,
  life: 5

  is_included: (letter) ->
    @current_problem.get('word').indexOf(letter) != -1

  scores_map: Ember.computed.mapBy('scores', 'value'),
  best: Ember.computed.max('scores_map')

  game_win: (->
    that = @
    # game is won when all items in current_word have active false
    if @current_word.filterBy('active', false).length < 1
      setTimeout (->
        that.reset_game()
      ), 1000
    ).observes('current_word.@each.active')

  game_over: (->
    # game is over if life is less than 1
    if @life < 1
      # on Em.run.next alert the user and begin a new game, create a new score object for a new game session
      Em.run.next =>
        alert('You Lost! Begin a new game.')
        @reset_game()
        score = @store.createRecord('score',{value: 0})
        @set('current_score', score)
        @scores.pushObject(score)
    ).observes('life')

  reset_game: (callback)->
    # reset everything
    callback.call() if callback
    new_problem = @get('model').content[Math.floor(Math.random() * @get('model').content.length)]
    @set('current_problem', new_problem)
    word_array = new_problem.get('word').split('').map (w)->
      {letter: w, active: false}
    @set('current_word', word_array)
    @set('life', 5)
    # trigger reset in view
    @trigger('reset')

  actions:
    submit: (value)->
      # check if submitted letter id included in current_word
      if @is_included(value)
        matched_letter_objs = @current_word.filterBy('letter', value)
        matched_letter_objs.forEach (item, index, enumerable)->
          # set true for matched ones so that they appear in UI
          Ember.set(item, "active", true)
        # increase the score
        @incrementProperty('current_score.value', 10)
      else
        # decrease life if the submitted letter is not matched
        @decrementProperty('life')