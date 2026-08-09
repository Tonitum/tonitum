#!/bin/bash

# Set the environment variable for the context length
export OLLAMA_CONTEXT_LENGTH=32768
export OLLAMA_NUM_PARALLEL=1
export OLLAMA_KEEP_ALIVE=30m

# Bail if the server is already running
pgrep -f "ollama serve" > /dev/null && { echo "ollama already running"; exit 0; }

# Run the ollama server
ollama serve
