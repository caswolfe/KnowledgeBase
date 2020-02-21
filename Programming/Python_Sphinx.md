# Autodoc w/ Sphinx in Python

## Table of Contents
1) [Getting Started](#Getting-Started)
1) [Formatting the Docs](#Formatting-the-Docs)

## Getting Started
1) Install Sphinx  
	```$ pip install sphinx```
1) Create a folder 'docs' in your top-level workspace.
1) In a console, cd into the 'docs' dir
1) run quickstart  
	```$ sphinx-quickstart```
1) If desired, add all files to a gitignore file except for these:
	1) conf.py
	1) index.rst
	1) make.bat
	1) .gitignore (if you have one in this dir)
	1) build_docs.sh (a script which will be detailed later)
1) Edit index.rst  
	Add 'modules' after contents.
	```
	.. toctree::
		:maxdepth: 2
		:caption: Contents:

		modules
	```
1) Crete build_docs.sh
	```shell
	#!/bin/bash

	sleep 2s
	sphinx-apidoc -o . .. -f

	sleep 2s
	make html

	sleep 2s
	```
1) Run build_docs.sh to generate auto-docs  
	```bash build_docs.sh```
	
## Formatting the Docs