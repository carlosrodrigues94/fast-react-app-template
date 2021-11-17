import { createStore, applyMiddleware } from "redux";
import { composeWithDevTools } from "redux-devtools-extension";
import createSagaMiddleware from "redux-saga";

import { rootReducer } from "./modules/rootReducer";
import { rootSaga } from "./modules/rootSaga";
import storage from "redux-persist/lib/storage";
import { persistReducer, persistStore } from "redux-persist";

export interface IState {}

/**
 * Redux Persist
 */
const persist = () => {
  const persistedReducer = persistReducer(
    {
      key: "vibbra-invoice-test",
      storage,
      whitelist: ["companies", "categories", "invoices", "config", "expenses"],
    },
    rootReducer
  );

  return persistedReducer;
};

const sagaMiddleware = createSagaMiddleware();

const middlewares = [sagaMiddleware];

const store = createStore(
  persist(),
  process.env.NODE_ENV === "development"
    ? composeWithDevTools(applyMiddleware(...middlewares))
    : applyMiddleware(...middlewares)
);

sagaMiddleware.run(rootSaga);

const persistor = persistStore(store);

export { store, persistor };
