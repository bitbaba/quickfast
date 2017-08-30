package=zeromq
package_version=4.2.1
package_out_dir=$${INSTALLROOT}
#package_download_url="https://github.com/zeromq/libzmq/releases/download/v4.2.1/zeromq-4.2.1.tar.gz"
package_download_url="https://github-production-release-asset-2e65be.s3.amazonaws.com/263379/600e5824-cf76-11e6-9ee9-98eb57481a87?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20170830%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20170830T091332Z&X-Amz-Expires=300&X-Amz-Signature=bbc063ee19f0852ea084ff4f7828d2b5f6de47ffa4d62a9dcd403e590269f408&X-Amz-SignedHeaders=host&actor_id=19676172&response-content-disposition=attachment%3B%20filename%3Dzeromq-4.2.1.tar.gz&response-content-type=application%2Foctet-stream"
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
