import React from 'react';
import { View } from 'react-native';
import { PersistGate } from 'redux-persist/es/integration/react';
import { Provider } from 'react-redux';
import Spinner from 'react-native-loading-spinner-overlay';
import configureStore from './src/store/configureStore';
import Root from './src/Root';

const { persistor, store } = configureStore();

const onBeforeLift = () => {
  // take some action before the gate lifts
};

export default function App() {
  return (
    <Provider store={store}>
      <PersistGate
        loading={
          <View style={{ flex: 1 }}>
            <Spinner visible textStyle={{ color: '#FFF' }} />
          </View>
        }
        onBeforeLift={onBeforeLift}
        persistor={persistor}
      >
        <Root />
      </PersistGate>
    </Provider>
  );
}
