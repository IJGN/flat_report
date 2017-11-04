@starToggle = (id, star) ->
  url = '/posts/' + id + '/stars'
  if star.text() == 'star'
    $.ajax(
      url: url
      type: 'delete'
      data:
        post_id: id
        dataType: 'json'
      ).done (data) ->
        star.text('star_outline')
        Materialize.toast('Unstarred', 1000, 'blue lighten')
        return
  else
    $.ajax(
      url: url
      type: 'post'
      data:
        post_id: id
        dataType: 'json'
      ).done (data) ->
        star.text('star')
        Materialize.toast('Starred', 1000, 'blue lighten')
        return
  return
