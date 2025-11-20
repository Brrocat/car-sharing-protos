# Makefile for generating protobuf contracts

# Protoc compiler and plugins
PROTOC = protoc
PROTOC_GEN_GO = protoc-gen-go
PROTOC_GEN_GO_GRPC = protoc-gen-go-grpc

# Directories
PROTO_DIR = proto
SERVICES = auth userprofile pricing telemetry booking payment vehicle trip notifications

# Default target
all: generate

# Generate all protobuf contracts
generate: $(SERVICES)

# Generate code for specific service
$(SERVICES):
	@echo "Generating Go code for $@ service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/$@ \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/$@ \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/$@/*.proto
	@echo "✓ $@ service generated"

# Generate auth service
auth:
	@echo "Generating Go code for auth service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/auth \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/auth \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/auth/*.proto
	@echo "✓ auth service generated"

# Generate userprofile service
userprofile:
	@echo "Generating Go code for userprofile service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/userprofile \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/userprofile \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/userprofile/*.proto
	@echo "✓ userprofile service generated"

# Generate pricing service
pricing:
	@echo "Generating Go code for pricing service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/pricing \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/pricing \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/pricing/*.proto
	@echo "✓ pricing service generated"

# Generate telemetry service
telemetry:
	@echo "Generating Go code for telemetry service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/telemetry \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/telemetry \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/telemetry/*.proto
	@echo "✓ telemetry service generated"

# Generate booking service
booking:
	@echo "Generating Go code for booking service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/booking \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/booking \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/booking/*.proto
	@echo "✓ booking service generated"

# Generate payment service
payment:
	@echo "Generating Go code for payment service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/payment \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/payment \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/payment/*.proto
	@echo "✓ payment service generated"

# Generate vehicle service
vehicle:
	@echo "Generating Go code for vehicle service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/vehicle \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/vehicle \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/vehicle/*.proto
	@echo "✓ vehicle service generated"

# Generate trip service
trip:
	@echo "Generating Go code for trip service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/trip \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/trip \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/trip/*.proto
	@echo "✓ trip service generated"

# Generate notifications service
notifications:
	@echo "Generating Go code for notifications service..."
	@$(PROTOC) \
		--go_out=$(PROTO_DIR)/notifications \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(PROTO_DIR)/notifications \
		--go-grpc_opt=paths=source_relative \
		-I=$(PROTO_DIR) \
		$(PROTO_DIR)/notifications/*.proto
	@echo "✓ notifications service generated"

# Clean generated files
clean:
	@echo "Cleaning generated Go files..."
	@for service in $(SERVICES); do \
		echo "Cleaning $$service..."; \
		rm -f $(PROTO_DIR)/$$service/*.pb.go; \
	done
	@echo "✓ All generated files cleaned"

# Install dependencies
deps:
	@echo "Installing protoc dependencies..."
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@echo "✓ Dependencies installed"

# Verify protoc is installed
check-protoc:
	@which $(PROTOC) > /dev/null || (echo "Error: protoc is not installed. Please install protobuf compiler." && exit 1)
	@echo "✓ protoc is installed"

# Verify plugins are installed
check-plugins:
	@which $(PROTOC_GEN_GO) > /dev/null || (echo "Error: protoc-gen-go is not installed. Run 'make deps'." && exit 1)
	@which $(PROTOC_GEN_GO_GRPC) > /dev/null || (echo "Error: protoc-gen-go-grpc is not installed. Run 'make deps'." && exit 1)
	@echo "✓ protoc plugins are installed"

# Check environment
check: check-protoc check-plugins
	@echo "✓ Environment is ready for code generation"

# Help
help:
	@echo "Available targets:"
	@echo "  all, generate    - Generate all protobuf contracts"
	@echo "  [service]        - Generate specific service (auth, userprofile, etc.)"
	@echo "  clean            - Remove all generated files"
	@echo "  deps             - Install dependencies"
	@echo "  check            - Check if environment is ready"
	@echo "  help             - Show this help"

.PHONY: all generate clean deps check check-protoc check-plugins help $(SERVICES)