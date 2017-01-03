import React from 'react';
import { allTodos } from '../../reducers/selectors.js';
import TodoListItem from './todo_list_item.jsx';

class TodoList extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    const todoTitles = this.props.todos.map((todo) => {
      return <TodoListItem key={todo.id} todo={todo}/>;
    });
    return(
      <div>
        {todoTitles}
      </div>
    );
  }
}

export default TodoList;
