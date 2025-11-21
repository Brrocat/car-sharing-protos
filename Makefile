.PHONY: proto clean

PROTOC := protoc
PROTO_ROOT := proto

proto:
	@echo "Generating all protobuf code..."
	$(PROTOC) \
		--proto_path=$(PROTO_ROOT) \
		--go_out=$(PROTO_ROOT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_ROOT) \
		--go-grpc_opt=paths=source_relative \
		$(shell find $(PROTO_ROOT) -name "*.proto")
	@echo "Protobuf code generation completed"

clean:
	@echo "Cleaning generated protobuf files..."
	find $(PROTO_ROOT) -name "*.pb.go" -delete
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