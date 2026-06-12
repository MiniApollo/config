#!/usr/bin/env bash

# https://github.com/ollama/ollama/issues/1890#issuecomment-1885381713

ollama list | tail -n +2 | awk '{print $1}' | while read model; do
    echo "Updating: $model"
    ollama pull "$model"
done
