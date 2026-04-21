#!/bin/bash

# Set the environment variable for the context length
export OLLAMA_CONTEXT_LENGTH=64000

# Run the ollama server
ollama serve