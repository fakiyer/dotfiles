import React from 'react';
import { connect } from 'react-redux';

import { addTodo, completeTodo, deleteTodo, editTodo, openEditModal, closeEditModal } from '../actions/TodoActions';
import Todos from '../components/Todos';

const TodosContainer = props => <Todos {...props} />;

const mapStateToProps = (state) => {
  const { todos } = state;
  let editingTodo = null;
  if (todos.openEditModal) {
    editingTodo = todos.items.find(item => item.editing);
  }

  return {
    todos,
    editingTodo,
  };
};

export default connect(mapStateToProps, {
  addTodo,
  completeTodo,
  deleteTodo,
  editTodo,
  openEditModal,
  closeEditModal,
})(TodosContainer);
