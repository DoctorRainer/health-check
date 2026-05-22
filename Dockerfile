FROM rust:1.85-slim AS builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/target/release/health-test /app/health-test
EXPOSE 3007
CMD ["./health-test"]
