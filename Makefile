.PHONY: proto clean

PROTOC := protoc
PROTO_ROOT := proto
OUTPUT_DIR := .

proto:
	@echo "Generating all protobuf code..."
	$(PROTOC) \
		--proto_path=$(PROTO_ROOT) \
		--go_out=$(OUTPUT_DIR) \
		--go_opt=module=github.com/Brrocat/car-sharing-protos \
		--go-grpc_out=$(OUTPUT_DIR) \
		--go-grpc_opt=module=github.com/Brrocat/car-sharing-protos \
		$(shell find $(PROTO_ROOT) -name "*.proto")
	@echo "Protobuf code generation completed"

clean:
	@echo "Cleaning generated protobuf files..."
	find . -name "*.pb.go" -not -path "./$(PROTO_ROOT)/*" -delete
	@echo "Clean completed"

deps:
	@echo "Installing protoc dependencies..."
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.31.0
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0
	@echo "Dependencies installed"

help:
	@echo "Available targets:"
	@echo "  proto    - Generate all protobuf code"
	@echo "  clean    - Remove all generated files"
	@echo "  deps     - Install protoc dependencies"
	@echo "  help     - Show this help message"

.DEFAULT_GOAL := help