# Configuration script for Linux or OSX systems

# Todo List
# =========
# - check for zsh installation
# - configure zshrc
# - configure custom aliases
# - configure ls-colors
# - configure vimrc
#
# - add spacing in zsh theme
# - add specific colors in prompt for ssh connections
# - add resizable functionality
# - multilangue script
# - macosx compatibility
# - nice n colored output

# ohmyzsh installation
	echo "install oh-my-zsh"
	curl="$(which curl)"
	if [ -z $curl ]; then
		echo "installing curl for oh-my-zsh download"
		sudo apt-get install curl
	fi
	# vérifier ici si zsh est installé sinon il faut l'installer et le configurer comme interpréteur de commande par defaut
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# theming zsh with oscarus
	echo "copying oscarus theme for zsh"
	cp zsh_themes/oscarus.zsh-theme
	# remplacer ici le theme par default par oscarus

echo "configuring zshrc file"
echo "custom aliases selection"
echo "configuring vimrc file"
echo "configuring ls-colors"

# while [ 42 ]
# do
# 	# ************ Choose language menu *****************
# 	echo -n "Choose your language(en) / Choisissez votre langue(fr) : "
# 	read language

# 	# ************ Installation pour linux desktop ******************
# 	if [ "$language" = "fr" ]; then
# 		echo "fr"
# 	elif [ "$language" = "en" ]; then
# 		echo "en"
# 	# *********** Message d'erreur option invalide ******************
# 	else
# 		echo "Unvalid parameter"
# 	fi
# done

