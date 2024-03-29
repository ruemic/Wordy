ScoreSound = require('views/score/score_sound')
module.exports = Score = Backbone.Model.extend

  initialize: (options) ->
    @.set(total_score: 0)
    @.set(score: 0)
    @points = @.get('score')
    @words = options.words
    @sound = new ScoreSound()

    @listenTo(@words, 'change:answered_correctly',   @raiseScore)
    @listenTo(@words, 'change:answered_incorrectly', @lowerScore)

  raiseScore: ->
    @changePoints(+3)
    @sound.success()

  lowerScore: ->
    @changePoints(-1)
    @sound.fail()

  changePoints: (integer) ->
    @points += integer
    @.set(score: @points)

  endLevel: ->
    totalScore = @.get('total_score') + @points
    @.set(total_score: totalScore)
    @.set(score: 0)
    @points = 0

