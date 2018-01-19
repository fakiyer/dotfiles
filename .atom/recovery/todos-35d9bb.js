import * as types from '../constants/ActionTypes';

const initialState = {
  openEditModal: false,
  items: [],
};

export default function todos(state = initialState, action) {
  switch (action.type) {
    case types.ADD_TODO:
      return {
        ...state,
        items: [
          {
            id: new Date().getTime(),
            text: action.text,
            completed: false,
            editing: false,
          },
          ...state.items,
        ],
      };
    case types.COMPLETE_TODO:
      return {
        ...state,
        items: state.items.map(
          item => (item.id === action.id ? { ...item, completed: true } : item),
        ),
      };
    case types.DELETE_TODO:
      return {
        ...state,
        items: state.items.filter(item => item.id !== action.id),
      };
    case types.EDIT_TODO:
      return {
        ...state,
        items: state.items.map(
          item =>
            item.id === action.id ? { ...item, text: action.text } : item,
        ),
      };
    case types.OPEN_EDIT_MODAL:
      return {
        ...state,
        openEditModal: true,
        items: state.items.map(
          item => (item.id === action.id ? { ...item, editing: true } : item),
        ),
      };
    case types.CLOSE_EDIT_MODAL:
      return {
        ...state,
        openEditModal: false,
        items: state.items.map(
          item => (item.id === action.id ? { ...item, editing: false } : item),
        ),
      };
    default:
      return state;
  }
}
