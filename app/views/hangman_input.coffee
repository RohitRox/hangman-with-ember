module.exports = App.HangmanInputView = Ember.TextField.extend
  type: "button"
  click: ->
    value = @get('value')
    controller = @get('targetObject')
    controller.send('submit', value)
    @toggleProperty('disabled')
