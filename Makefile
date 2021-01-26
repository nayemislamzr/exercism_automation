all: install 
	./binaries/.exercism.sh
submit:		
	./binaries/.exercism.sh
install: 
	./binaries/.install.sh
uninstall: 
	./binaries/.uninstall.sh
version:
	./binaries/.version.sh
clean:
	./binaries/.clean.sh
