#!/bin/bash 

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

logo() {
    declare -A logo
    seconds="0.004"
logo[0]="Develop by @Alit7005"
printf "\e[38;5;213m\t"
    for i in ${!logo[@]}; do
        for x in `seq 0 ${#logo[$i]}`; do
            printf "${logo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
printf "\n"
}

 }

install_luarocks() {
 echo -e "\e[38;5;142mInstalling LuaRocks\e"
  git clone https://github.com/keplerproject/luarocks.git
  cd luarocks
  git checkout tags/v2.4.2 # Current stable

  PREFIX="$THIS_DIR/.luarocks"

  ./configure --prefix=$PREFIX --sysconfdir=$PREFIX/luarocks --force-config
   make build && make install
cd ..
  rm -rf luarocks
}

install_rocks() {
echo -e "\e[38;5;105mInstall rocks service\e"
rocks="luasocket luasec redis-lua lua-term serpent dkjson Lua-cURL multipart-post lanes xml fakeredis luaexpat luasec lbase64 luafilesystem lub lua-cjson feedparser serpent"
    for rock in $rocks; do
     sudo ./.luarocks/bin/luarocks install $rock
    done
}
  
tg() {
echo -e "\e[38;5;099minstall telegram-cli\e"
    wget https://valtman.name/files/telegram-cli-1222
    mv telegram-cli-1222 telegram-cli
    chmod 777 telegram-cli
}
  
install2() {
echo -e "\e[38;5;034mInstalling more dependencies\e"
    sudo apt-get install screen -y
    sudo apt-get install tmux -y
    sudo apt-get install upstart -y
    sudo apt-get install libstdc++6 -y
    sudo apt-get install lua-lgi -y
    sudo apt-get install libnotify-dev -y
}

install() {
echo -e "\e[38;5;035mUpdating packages\e"
   sudo apt-get update -y
   sudo apt-get upgrade -y

echo -e "\\e[38;5;129mInstalling dependencies\e"
	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	sudo apt-get install g++-4.7 -y c++-4.7 -y
	sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
install2
install_luarocks
install_rocks
tg
log
echo -e "\e[38;5;046mInstalling packages successfully\033[0;00m"
}

if [ "$1" = "install" ]; then
install
fi


if [ ! -f telegram-cli ]; then
    echo -e "\033[38;5;208mError! telegram-cli not found, Please reply to this message:\033[1;208m"
    read -p "Do you want to install and config? [y/n] = "
	if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
	chmod 777 make.sh
	chmod 777 r.sh
        install
    elif [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        exit 1
  fi
fi

