patches=\

src=source

patch: init download
	for P in $(patches); do \
		echo " → Applying patch $$P"; \
		patch -d $(src) <$$P; \
	done
	cd $(src) && make config.h && \
	ed config.h <../sirjofri.ed

install:
	cd $(src) && make install

init:
	git submodule update --init

download: $(patches)

clean:
	- rm -Rf source

.PHONY: patch install init download clean
