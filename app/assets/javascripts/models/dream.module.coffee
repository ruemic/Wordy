Dream = Backbone.Model.extend
  validate: (attrs) ->
    name = $.trim(attrs.name)
    return "Can't be blank" if _.isEmpty(name)

module.exports = Dreams = Backbone.Collection.extend
  model: Dream
  url: '/api/dreams'

  initialize: ->
    @storage = new Offline.Storage('dreams', @, autoPush: true)

  comparator: (dream) ->
    (new Date(dream.get 'created_at')).getTime()
