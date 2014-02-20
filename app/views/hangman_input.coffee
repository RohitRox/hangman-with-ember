module.exports = App.HangmanInputView = Ember.TextField.extend
  type: "button"
  resetted: false
  didInsertElement: ->
    @get('targetObject').on('reset', $.proxy(@reset, @));
  click: ->
    value = @get('value')
    controller = @get('targetObject')
    controller.send('submit', value)
    if @resetted
      @set('resetted', false)
    else
      @toggleProperty('disabled')
  reset: ->
    @set('disabled', false)
    @set('resetted', true)
