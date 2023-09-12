#!/bin/bash

git diff $@ --name-only | xargs bat --diff-context=3
