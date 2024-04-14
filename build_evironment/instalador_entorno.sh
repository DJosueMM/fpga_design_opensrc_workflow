
#Esto instalara todo el toolchain a utilizar
#DJMM - 4/24

#!/bin/bash

# Paso 1: Actualizar repositorios
sudo apt-get update

# Paso 2: Instalar pre-requisitos para la cadena de herramientas
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
libffi-dev liblzma-dev git cmake libboost-all-dev libeigen3-dev \
libftdi1-2 libftdi1-dev libhidapi-hidraw0 libhidapi-dev \
libudev-dev pkg-config g++ clang bison flex \
gawk tcl-dev graphviz xdot pkg-config zlib1g-dev

# Paso 3: Instalar pyenv
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1 >/dev/null 2>&1; then \n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

/.bashrc

# Paso 4: Instalar Python 3.9.13
pyenv install 3.9.13
pyenv global 3.9.13

# Paso 5: Instalar apicula
pip install apycula

# Paso 6: Instalar Yosys
git clone https://github.com/YosysHQ/yosys.git
cd yosys
make
sudo make install

# Paso 7: Instalar nextpnr
cd ~
git clone https://github.com/YosysHQ/nextpnr.git
cd nextpnr
cmake . -DARCH=gowin -DGOWIN_BBA_EXECUTABLE=`which gowin_bba`
make
sudo make install

# Paso 8: Instalar openFPGAloader
cd ~
git clone https://github.com/trabucayre/openFPGALoader.git
cd openFPGALoader
mkdir build
cd build
cmake ../
cmake --build .
sudo make install

# Paso 9: Instalar Icarus Verilog
sudo apt-get install -y iverilog

# Paso 10: Instalar gtkwave
sudo apt-get install -y gtkwave

echo "¡Instalación completada!"
