set -exuo pipefail
PATH=''
SELF_DIR=$"${0%build.sh}"
cd "${SELF_DIR}"

bootstrap/mkdir -p dl
bootstrap/mkdir -p o

if ! bootstrap/sha256sum --check dl_sums; then
    bootstrap/wget https://cosmo.zip/pub/cosmos/zip/cosmos-3.3.1.zip -O dl/cosmos.zip
    bootstrap/wget https://cosmo.zip/pub/cosmocc/cosmocc-3.3.3.zip -O dl/cosmocc.zip
fi
bootstrap/sha256sum --check dl_sums

bootstrap/unzip -o dl/cosmos.zip -d o/cosmos
bootstrap/unzip -o dl/cosmocc.zip -d o/cosmocc

for file in o/cosmos/bin/*.ape; do
    o/cosmos/bin/ln -f "${file}" "${file%.ape}" 
done

o/cosmos/bin/ln -f o/cosmos/bin/bash o/cosmos/bin/bash.com
