# Car Sharing Protos

Protocol buffer definitions for the Car Sharing microservices platform.

## Services

- **Auth Service** - Authentication and authorization
- **User Profile Service** - User management and profiles
- **Vehicle Service** - Vehicle management and status
- **Telemetry Service** - Real-time vehicle data ingestion
- **Booking Service** - Booking management
- **Trip Service** - Trip management and FSM
- **Pricing Service** - Dynamic pricing calculations
- **Payment Service** - Payment processing
- **Notifications Service** - Multi-channel notifications

## Usage

### Generate Protobuf Code

1. Install dependencies:
   ```bash
   make deps