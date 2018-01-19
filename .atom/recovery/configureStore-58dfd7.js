import { applyMiddleware, createStore } from 'redux';
import { persistStore, persistCombineReducers } from 'redux-persist';
import storage from 'redux-persist/es/storage';
import { createLogger } from 'redux-logger';
import reducers from '../reducers';

const logger = createLogger({
  predicate: () => __DEV__,
});

const reducer = persistCombineReducers(
  {
    key: 'root',
    storage,
  },
  reducers,
);

export default function configureStore() {
  const store = createStore(reducer, applyMiddleware(logger));
  const persistor = persistStore(store);

  return { persistor, store };
}
