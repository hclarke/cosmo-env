PS1='$\w: '

if [ -f "${HOME}/.bashrc" ]; then
    if ! [ "${HOME}" = "${COSMO_ENV_PATH}" ]; then
        . "${HOME}/.bashrc"
    fi
fi