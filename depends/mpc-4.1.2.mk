#!/bin/bash
package=MPC
$(package)_version=MPC_4_1_2
$(package)_out_dir=$${abs_repo_root}/build
$(package)_download_url="https://github.com/objectcomputing/$(package)/archive/$($(package)_version).tar.gz"
$(package)_file=$${abs_repo_root}/depends/sources/$(package)-$($(package)_version).tar.gz
$(package)_sha256hash=
$(package)_temp_build_dir=/tmp/$(package)-$($(package)_version)

all: $($(package)_file)
	tar zxvf $($(package)_file) -C /tmp && \
	cp -rf $($(package)_temp_build_dir) $($(package)_out_dir) 

$($(package)_file):
	if [ -f $($(package)_file) ] ; then echo cached; else curl -k -L $($(package)_download_url) -o $($(package)_file); fi

.PHONY: all
