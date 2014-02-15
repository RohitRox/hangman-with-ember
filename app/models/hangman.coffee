module.exports = App.Hangman = DS.Model.extend
  word: DS.attr('string'),
  hint: DS.attr('string')

module.exports = App.Hangman.FIXTURES = 
  [
    {
      id: 1,
      word: "turkey",
      hint: "A country or A species"
    },
    {
      id: 2,
      word: "hangman",
      hint: "A game"
    },
    {
      id: 3,
      word: "fightclub",
      hint: "A movie"
    },
    {
      id: 4,
      word: "atombomb",
      hint: "Science"
    }
  ]