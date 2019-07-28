#!/usr/bin/env bash

usage() {
    cat <<EOF
Usage: $0 [Option]

Option:
  -y,--yaml    (default) yaml
  -j,--json    json
EOF
}

option="${1:-y}"
case "${option#-}" in
    y|-yaml)
        file_type=yaml
        ;;
    j|-json)
        file_type=json
        ;;
    h|--help)
        usage
        exit 0
        ;;
    *)
        usage
        exit 1
        ;;
esac

cd "$(dirname "$0")"

curdir=$(pwd)
tmpdir=$(mktemp -d)
pushd "${tmpdir}" > /dev/null || exit 1

hash=5a02740f8bc9b3170e0bf15076e53072d630eb58
repo=aws-cloudformation-user-guide
curl -sSL -o "${repo}".zip https://github.com/awsdocs/"${repo}"/archive/"${hash}".zip
unzip -q "${repo}".zip
pushd "${repo}"-"${hash}"/doc_source > /dev/null || exit 1

snippetdir="${curdir}"/snippets/cfn-mode
rm -rf "${snippetdir}"
mkdir -p "${snippetdir}"

generate_snippet() {
    cat <<EOF
# -*- mode: snippet -*-
# name: $1
# key: $2
# group: cloudformation
# --
  \${1:Resource Name}:
$3
EOF
}

grep -l "^### ${file_type^^}" * | while read -r FILE; do
    name=$(echo "${FILE}" | sed -e 's/aws-resource-//' -e 's/aws-properties-//' -e 's/\.md//')
    snip="${snippetdir}"/"${name}"

    start=$(expr "$(sed -ne '/^### '${file_type^^}'/,$p' $FILE | grep -n '```' | awk -F: 'NR==1 { print $1}')" + 1)
    end=$(expr "$(sed -ne '/^### '${file_type^^}'/,$p' $FILE | grep -n '```' | awk -F: 'NR==2 { print $1}')" - 1)

    body=$(sed -ne "/^### ${file_type^^}/,\$p" "$FILE" \
        | sed -ne "${start},${end}p" \
        | sed -e "s/^/    /g" -e "s/([^)]*)//g" -e "s/\[//g" -e "s/\]//g" -e "s/ *$//g")

    generate_snippet "${name}" "${name}" "${body}" > "${snip}"
done

popd > /dev/null || exit 1
popd > /dev/null || exit 1
rm -fr "${tmpdir}"
