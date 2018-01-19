import React from 'react';
import { Animated, StyleSheet } from 'react-native';
import { CheckBox } from 'react-native-elements';

const styles = StyleSheet.create({
  completeContainer: {
    backgroundColor: '#f0f0f0',
  },
  completeText: {
    color: '#c0c0c0',
    textDecorationLine: 'line-through',
  },
});

export default class Todo extends React.PureComponent {
  constructor(props) {
    super(props);
    this.onIconPress = this.onIconPress.bind(this);
    this.animatedValue = new Animated.Value(1);
  }

  onIconPress(id) {
    const { completeTodo, deleteTodo } = this.props;

    completeTodo(id);
    Animated.timing(this.animatedValue, {
      toValue: 0,
      duration: 300,
    }).start();
    setTimeout(() => deleteTodo(id), 300);
  }

  onPress(id) {
    const { openEditModal } = this.props;

    openEditModal(id);
  }

  render() {
    const { item } = this.props;

    return (
      <Animated.View style={{ opacity: this.animatedValue }}>
        <CheckBox
          title={item.text}
          checked={item.completed}
          checkedColor="gray"
          containerStyle={item.completed ? styles.completeContainer : ''}
          textStyle={item.completed ? styles.completeText : ''}
          onIconPress={() => this.onIconPress(item.id)}
          onPress={() => this.onPress(item.id)}
        />
      </Animated.View>
    );
  }
}
