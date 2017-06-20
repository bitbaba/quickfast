package=MPC
package_version=MPC_4_1_2
package_out_dir=$${INSTALLROOT}
package_download_url="https://codeload.github.com/objectcomputing/MPC/tar.gz/MPC_4_1_2"
package_build_dir=/tmp/$(package)-$(package_version)
package_tarball=/tmp/$(package)-$(package_version).tar.gz

all: $(package_tarball)
	tar zxvf $(package_tarball) -C /tmp && \
	cp -rf $(package_build_dir) $(package_out_dir) 

$(package_tarball):
	curl -k $(package_download_url) -o $(package_tarball)

.PHONY: all
