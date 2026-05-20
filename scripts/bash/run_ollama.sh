#!/bin/bash

# Set the environment variable for the context length
export OLLAMA_CONTEXT_LENGTH=32768
export OLLAMA_NUM_PARALLEL=1

# Run the ollama server
ollama serve
