FROM rust:latest as builder
WORKDIR /when
COPY . /when/
RUN git submodule init && git submodule update && cargo build

FROM debian:buster-slim
COPY --from=builder /when/target/debug/when .