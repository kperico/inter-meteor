Players = new Meteor.Collection("players")

Template.leaderboard.players = ->
  Players.find {},
    sort:
      name: 1

Template.leaderboard.selected_name = ->
  player = Players.findOne(Session.get("selected_player"))
  player and player.name

Template.player.selected = ->
  (if Session.equals("selected_player", @_id) then "selected" else "")

Template.response.events = click: ->
  Session.set "selected_player", @_id
  Players.update @_id,
    $set:
      response: if @response == 'Si' then 'No' else 'Si'
