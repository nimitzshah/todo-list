window.onload = () ->
  todo = new Vue(
    el: '#todos'

    data:
      todos: [
        { message: 'Eat food' },
        { message: 'Go to School' }
      ]
      new_todo: ''

    methods:
      add_todo: () ->
        new_todo = @new_todo
        new_todo.trim()
        @todos.push( {message: new_todo} ) if new_todo.length >1
        @new_todo = ''

      remove_todo: (index) ->
        @todos.splice(index, 1)
  )
