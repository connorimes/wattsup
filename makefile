targets=wattsup libwattsup.so test_library

all: $(targets)

wattsup: wattsup.c util.c config.c globals.c

libwattsup.so: util.c config.c globals.c
	$(CC) -fPIC -shared -Wl,-soname,$@ -o $@ $^

test_library: test_library.c libwattsup.so
	$(CC) -fPIC test_library.c -o $@ -L./ -lwattsup

install: all
	install -m 0555 wattsup /usr/local/bin/
	install -m 0444 libwattsup.so /usr/local/lib/
	mkdir -p /usr/local/include/wattsup/
	install -D -m 0644 wattsup_common.h /usr/local/include/wattsup/
	install -D -m 0644 util.h /usr/local/include/wattsup/

uninstall:
	rm -f /usr/local/bin/wattsup
	rm -f /usr/local/lib/libwattsup.so
	rm -rf /usr/local/include/wattsup/

clean:
	rm -f *~ $(targets)
