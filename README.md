# tcc-for-emscripten
Tiny C Compiler for emscripten

Steps to reproduce:

	wget http://download.savannah.gnu.org/releases/tinycc/tcc-0.9.26.tar.bz2
	unp tcc-0.9.26.tar.bz2
	cd tcc-0.9.26
	git init
	git add .
	git commit -m "Initial commit"
	> add the doit_32.sh file
	./doit_32.sh
	git add doit_32.sh tcc.html tcc.js
	git commit -m "Add build script and keep the output"
	
	
Demo: http://killtube.org/downloads/emscripten/tcc/tcc.html