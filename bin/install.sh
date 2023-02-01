export PATH="$ln/bin:$git/bin"

if [ ! -d "${HOME}/.config/nvim" ]; then
  ln -s "${PWD}/nvim" "${HOME}/.config/"
fi

REPOSITORY_URL="https://github.com/wbthomason/packer.nvim"
DESTINATION="~/.local/share/nvim/site/pack/packer/opt/packer.nvim"
if [ ! -d "${DESTINATION}" ]; then
  git clone --depth 1 "${REPOSITORY_URL}" "${DESTINATION}"
fi

#nvim -c "PackerClean|qa"
#nvim -c "PackerInstall|qa"
