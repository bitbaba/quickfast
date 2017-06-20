package=xerces-c
package_version=3.1.4
package_out_dir=$${INSTALLROOT}
package_download_url="http://mirrors.tuna.tsinghua.edu.cn/apache/xerces/c/3/sources/xerces-c-3.1.4.tar.gz"
package_build_dir=/tmp/$(package)-$(package_version)
package_tarball=/tmp/$(package)-$(package_version).tar.gz

all: $(package_tarball)
	tar zxvf $(package_tarball) -C /tmp && \
	cd $(package_build_dir) && \
	./configure --prefix=$(package_out_dir) --enable-shared=no --enable-static=yes && \
	make && \
        make install && \
        make clean

$(package_tarball):
	curl $(package_download_url) -o $(package_tarball)

.PHONY: all 
