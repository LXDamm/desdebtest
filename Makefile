prefix = /usr/local

all: src/des

src/des: src/main.c
	@echo "CFLAGS=$(CFLAGS)" | \
		fold -s -w 70 | \
		sed -e 's/^/# /'
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/des
	install -D src/des \
		$(DESTDIR)$(prefix)/bin/des

clean:
	-rm -f src/des

distclean: clean

uninstall:
	-rm -f $(DESTDIRE)$(prefix)/bin/des

.PHONY: all install clean distclean uninstall
