#!/bin/bash

# Generate Go code from protobuf definitions
echo "Generating Go code from protobuf definitions..."

# Create output directory
mkdir -p gen

# Generate for each service
services=("auth" "userprofile" "vehicle" "telemetry" "booking" "trip" "pricing" "payment" "notifications")

for service in "${services[@]}"; do
    echo "Generating code for $service..."
    protoc --go_out=gen --go_opt=paths=source_relative \
           --go-grpc_out=gen --go-grpc_opt=paths=source_relative \
           proto/$service/*.proto
done

echo "Protobuf code generation completed!"