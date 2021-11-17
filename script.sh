#!/bin/bash

echo "what is project name?"
read project_name

yarn create react-app $project_name --template=typescript
wait

echo "project created!"

cd "./$project_name" 

echo "Intalling Redux"

yarn add redux react-redux redux-saga immer redux-devtools-extension redux-persist typesafe-actions 
wait

echo "Redux Installed"

echo "Installing Types for Redux"

yarn add @types/redux -D
wait

echo "Installing Router Dom"

yarn add react-router-dom history
wait

echo "Installing types for router dom"

yarn add @types/react-router-dom -D
wait

# Redux folders structure

mkdir ./src/store
mkdir ./src/store/modules

cd ..

cp ./config/redux/index.ts $project_name/src/store

cp ./config/redux/rootReducer.ts $project_name/src/store/modules
cp ./config/redux/rootSaga.ts $project_name/src/store/modules

# Routes and App config

rm -rf $project_name/src/App.tsx

mkdir $project_name/src/routes
mkdir $project_name/src/components
mkdir $project_name/src/pages
mkdir $project_name/src/hooks
mkdir $project_name/src/styles

cp ./config/router-dom/index.tsx $project_name/src/routes
cp ./config/app/App.tsx $project_name/src/

rm -rf $project_name/src/logo.svg
rm -rf $project_name/src/App.test.tsx
rm -rf $project_name/src/App.css








