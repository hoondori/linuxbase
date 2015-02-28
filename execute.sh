
# for console font
sudo dpkg-reconfigure console-setup
#select "UTF-8"
#select "Guess optimal character set"
#select "Terminus"
#select 16*32 (my selection for a 7 inch monitor on raspberry pi

# for scala color highlight
mkdir -pv ~/.vim/ftdetect
mkdir -pv ~/.vim/indent
mkdir -pv ~/.vim/syntax

wget --no-check-certificate https://lampsvn.epfl.ch/trac/scala/export/18260/scala-tool-support/trunk/src/vim/ftdetect/scala.vim -O ~/.vim/ftdetect/scala.vim
wget --no-check-certificate https://lampsvn.epfl.ch/trac/scala/export/18260/scala-tool-support/trunk/src/vim/indent/scala.vim -O ~/.vim/indent/scala.vim
wget --no-check-certificate https://lampsvn.epfl.ch/trac/scala/export/18260/scala-tool-support/trunk/src/vim/syntax/scala.vim -O ~/.vim/syntax/scala.vim
