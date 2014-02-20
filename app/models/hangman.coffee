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
    },
    {
      id: 5,
      word: "neutron",
      hint: "Science"
    },
    {
      id: 6,
      word: "cell",
      hint: "Biology"
    },
    {
      id: 7,
      word: "decode",
      hint: "Computers"
    },
    {
      id: 8,
      word: "monalisa",
      hint: "Arts"
    },
    {
      id: 9,
      word: "venice",
      hint: "A place"
    }
  ]