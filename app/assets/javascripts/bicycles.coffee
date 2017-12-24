$ ->
  $form = $('.category-form')

  $('.add-category').on 'click', (e) =>
    e.preventDefault()
    $form.show()

  $('.cancel-category').on 'click', (e) =>
    e.preventDefault()
    $form.hide()

  $('.create-category').on 'click', (e) =>
    e.preventDefault()
    $name = $('.category-name').val()
    $.ajax
      type: 'POST'
      url: '/categories'
      data: {
        category: {
          name: $name
        }
      }
      dataType: 'json'
      success: (data) ->
        $form.hide()
        $('.categories select').append("<option value=#{data.id} selected='selected'>#{data.name}</option>")
      error: () ->
        alert('Something went wrong')

  # search
  $('.bicycle-search input').keyup (e) =>
    $search = e.target.value
    if e.keyCode == 13
      $.ajax
        type: 'GET'
        url: '/bicycles'
        data: {
          search: $search
        }
        dataType: 'json'
        success: (data) ->
          content = ''
          for i in [0...data.length]
            content += '<tr>'
            content += '<td>' + data[i].name + '</td>'
            content += '<td>' + data[i].description + '</td>'
            content += '</tr>'

          $('.table-responsive tbody').html(content)
        error: () ->
          alert('Something went wrong')

  # $('.bicycle-search')
