patches=\
	dwm-swallow-20170909-ceac8c9.diff \

src=source

patch: init download
	@for P in $(patches); do \
		echo " → Applying patch $$P"; \
		patch -d $(src) <$$P; \
	done
	@cd $(src) && make config.h && \
	ed config.h <../sirjofri.ed

install:
	cd $(src) && make install

init:
	git submodule update --init

download: $(patches)

dwm-swallow-20170909-ceac8c9.diff:
	wget http://dwm.suckless.org/patches/swallow/dwm-swallow-20170909-ceac8c9.diff

clean:
	- rm -Rf source $(patches)

.PHONY: patch install init download clean
