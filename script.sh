#!/bin/bash

echo "what is project name?"
read project_name

project_local="./apps/$project_name"
wait

yarn create react-app $project_local --template=typescript
wait

echo "project created!"

cd "./$project_local" 

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

echo "Installing styled-components"
yarn add styled-components
wait

yarn add @types/styled-components -D
wait

# Redux folders structure

mkdir ./src/store
mkdir ./src/store/modules

cd ..
cd ..

cp ./config/redux/index.ts $project_local/src/store

cp ./config/redux/rootReducer.ts $project_local/src/store/modules
cp ./config/redux/rootSaga.ts $project_local/src/store/modules

# Routes and App config

rm -rf $project_local/src/App.tsx

mkdir $project_local/src/routes
mkdir $project_local/src/components
mkdir $project_local/src/pages
mkdir $project_local/src/hooks
mkdir $project_local/src/styles

cp ./config/router-dom/index.tsx $project_local/src/routes
cp ./config/app/App.tsx $project_local/src/

rm -rf $project_local/src/logo.svg
rm -rf $project_local/src/App.test.tsx
rm -rf $project_local/src/App.css

# Create Minimal files

mkdir $project_local/src/pages/Home
touch $project_local/src/pages/Home/index.tsx
touch $project_local/src/pages/Home/styles.ts

printf 'import React from "react"\n
import { Container } from "./styles"\n
export const Home: React.FC = () => <Container>Home Page</Container>;' >> $project_local/src/pages/Home/index.tsx

printf 'import styled from "styled-components"\n 
export const Container = styled.div`
  display:flex;
  height:100vh;
  background:#777;
  color:#fff;

`;' >> $project_local/src/pages/Home/styles.ts








