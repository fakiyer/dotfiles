import React from 'react';
import { Animated, FlatList, StyleSheet, View } from 'react-native';
import { FormInput, Header } from 'react-native-elements';
import Modal from 'react-native-modal';
import Todo from './Todo';

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  button: {
    backgroundColor: 'lightblue',
    padding: 12,
    margin: 16,
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 4,
    borderColor: 'rgba(0, 0, 0, 0.1)',
  },
  modalContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalContent: {
    backgroundColor: 'white',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 4,
    borderColor: 'rgba(0, 0, 0, 0.1)',
  },
});

export default class Todos extends React.PureComponent {
  constructor(props) {
    super(props);
    this.onEndEditing = this.onEndEditing.bind(this);
    this.onClose = this.onClose.bind(this);
    this.animatedValue = new Animated.Value(1);
  }

  onEndEditing(e) {
    const { addTodo } = this.props;

    addTodo(e.nativeEvent.text);
    this.formInput.clearText();
  }

  onClose(id) {
    const { closeEditModal, editTodo } = this.props;

    if (this.formModalInput._lastNativeText) {
      editTodo(id, this.formModalInput._lastNativeText);
    }
    closeEditModal(id);
  }

  render() {
    const { editingTodo, todos } = this.props;
    const { items, openEditModal } = todos;

    return (
      <View style={styles.container}>
        <Header
          centerComponent={{ text: 'MY TITLE', style: { color: '#fff' } }}
        />
        <FormInput
          ref={ref => {
            this.formInput = ref;
          }}
          placeholder="Add Todo..."
          onEndEditing={this.onEndEditing}
        />
        <FlatList
          data={items.length > 0 ? items : undefined}
          keyExtractor={item => item.id}
          renderItem={({ item }) => <Todo {...this.props} item={item} />}
        />
        {openEditModal && (
          <Modal
            isVisible={openEditModal}
            onBackButtonPress={() => this.onClose(editingTodo.id)}
            onBackdropPress={() => this.onClose(editingTodo.id)}
          >
            <View style={styles.modalContent}>
              <FormInput
                textInputRef={ref => {
                  this.formModalInput = ref;
                }}
                onEndEditing={() => this.onClose(editingTodo.id)}
                defaultValue={editingTodo.text}
              />
            </View>
          </Modal>
        )}
      </View>
    );
  }
}
