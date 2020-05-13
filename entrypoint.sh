#!/bin/bash
set -e
git clone --recurse-submodules https://github.com/analogdevicesinc/scopy-flatpak
cd scopy-flatpak
git checkout master && git pull

make
