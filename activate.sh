set -euo pipefail

COSMO_ENV_PATH="${0%activate.sh}"

export COSMO_ENV_PATH="$("${COSMO_ENV_PATH}o/cosmos/bin/realpath" "$("${COSMO_ENV_PATH}o/cosmos/bin/dirname" "$0")")"
export PATH="${COSMO_ENV_PATH}/o/cosmos/bin:${COSMO_ENV_PATH}/o/cosmocc/bin"
export HOME="$(pwd)"

"${COSMO_ENV_PATH}/o/cosmos/bin/bash.com" --rcfile "${COSMO_ENV_PATH}/.bashrc" $@

