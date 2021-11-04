#!/bin/bash

echo "what is project name?"
read project_name

yarn create react-app $project_name 

echo "project created!"

cd "./$project_name" 

echo "Intalling Redux"

yarn add redux react-redux redux-saga immer redux-devtools-extension redux-persist typesafe-actions 

echo "Redux Installed"

echo "Installing Types for Redux"

yarn add @types/redux -D

echo "Installing Router Dom"

yarn add react-router-dom history

echo "Installing types for router dom"

yarn add @types/react-router-dom -D


