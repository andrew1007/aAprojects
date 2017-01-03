import React from 'react';
const TodoList = require('./todo_list.jsx');

class TodoListItem extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    return <li>{this.props.todo.title}</li>
  }
}

export default TodoListItem;
