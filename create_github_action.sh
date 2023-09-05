#!/bin/bash

if [ $# = 0 ]; then
    echo ファイル名指定してください
    exit 1
fi

path=".github/workflows/${1}.yml"

mkdir -p "$(dirname "$path")"  && touch $path

cat << EOF > $path
name: sample-actions
run-name: sample GitHub Actions
on: [push]
jobs:
  check-bats-version:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '14'
      - run: npm install -g bats
      - run: bats -v
EOF