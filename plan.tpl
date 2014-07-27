inputs:

get module_name, prompt = "Enter new module name:"

get license, prompt = "License: ",
 			 default = "ISC"

yesno create_git_repo, prompt = "Create git repository?"

actions:

tree exclude = "optional"

template Makefile
template package.json
template README.md

shell "npm install --save-dev tape"
shall "npm install --save-dev uglify-js"

if create_git_repo?
	file optional/.gitignore, .gitignore
	shell "git init && git add . && git commit -m 'Initial commit'"
end