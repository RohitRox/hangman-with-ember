module.exports = App.IndexRoute = Ember.Route.extend
  model: ->
    @.store.findAll('hangman')
  ,
  setupController: (controller, model)->
    problems = model.content
    rand = problems[Math.floor(Math.random() * problems.length)]
    controller.set('current_problem', rand)
