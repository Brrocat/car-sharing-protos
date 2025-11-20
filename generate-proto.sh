#!/bin/bash

# Generate Go code from protobuf definitions using Makefile

echo "🚀 Generating Go code from protobuf definitions..."

# Check if Makefile exists
if [ ! -f "Makefile" ]; then
    echo "❌ Makefile not found in current directory"
    exit 1
fi

# Run make generate
make generate

echo "✅ Protobuf code generation completed!"