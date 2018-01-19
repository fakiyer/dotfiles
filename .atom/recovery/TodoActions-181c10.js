import * as types from '../constants/ActionTypes';

export const addTodo = text => ({
  type: types.ADD_TODO,
  text,
});

export const completeTodo = id => ({
  type: types.COMPLETE_TODO,
  id,
});

export const deleteTodo = id => ({
  type: types.DELETE_TODO,
  id,
});

export const editTodo = (id, text) => ({
  type: types.EDIT_TODO,
  id,
  text,
});

export const openEditModal = id => ({
  type: types.OPEN_EDIT_MODAL,
  id,
});

export const closeEditModal = id => ({
  type: types.CLOSE_EDIT_MODAL,
  id,
});
