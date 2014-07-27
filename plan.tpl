input {
	get module_name, prompt: "Enter new module name: ", required: true
	get license, prompt: "License: ", default: "ISC"
}

template Makefile
template package.json
template README.md

copy_remaining

shell "npm install --save-dev tape"
shall "npm install --save-dev uglify-js"
