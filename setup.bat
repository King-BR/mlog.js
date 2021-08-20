@ECHO OFF

git init
CALL npm init -y
CALL npm i --save-dev all-contributors-cli @babel/eslint-parser eslint eslint-config-prettier eslint-plugin-prettier prettier prettier-eslint

(goto) 2>nul & del "%~f0"