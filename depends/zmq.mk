package=zeromq
package_version=4.2.1
package_out_dir=$${INSTALLROOT}
package_download_url="https://github.com/zeromq/libzmq/releases/download/v4.2.1/zeromq-4.2.1.tar.gz"
package_build_dir=/tmp/$(package)-$(package_version)
package_tarball=/tmp/$(package)-$(package_version).tar.gz

all: $(package_tarball)
	tar zxvf $(package_tarball) -C /tmp && \
	cd $(package_build_dir) && \
	./configure --prefix=$(package_out_dir) && \
	make && \
        make install && \
        make clean

$(package_tarball):
	curl $(package_download_url) -o $(package_tarball)

.PHONY: all 
