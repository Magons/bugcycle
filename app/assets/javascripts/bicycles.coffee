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
