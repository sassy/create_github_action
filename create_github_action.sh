#!/bin/bash

path=".github/workflows/action.yml"

mkdir -p "$(dirname "$path")"  && touch $path

cat << EOF > .github/workflows/action.yml
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