module.exports = App.IndexController = Ember.Controller.extend
  life: 5
  is_included: (letter) ->
    @current_problem.get('word').indexOf(letter) != -1
  actions:
    submit: (value)->
      if @is_included(value)
        alert('match')
      else
        alert('no match')
