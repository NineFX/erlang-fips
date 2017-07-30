# erlang-fips

FIPS 140-2 enabled Erlang containers

## Erlang installation

This container contains [Erlang/OTP](http://erlang.org) configured with `--enable-fips` for a [FIPS mode crypto application](http://erlang.org/documentation/doc-9.0-rc1/lib/crypto-4.0/doc/html/fips.html). The container builds on an [Alpine image compiled in FIPS mode](https://hub.docker.com/r/ninefx/alpine-fips/).

## rebar3

It also includes a recent version [rebar3](https://www.rebar3.org) on the `$PATH`, installed under `/root/.cache`. You can update to the latest version with `rebar3 local upgrade`.

## Self-test

The `Dockerfile` tests that FIPS mode is successfully enabled using a simple escript. This escript is only used during the Docker image build process and is not present in the final image.

## Not FIPS compliant

This Docker image is not FIPS compliant. The OpenSSL FIPS Security Policy requires that "An independently acquired FIPS 140­-2 validated implementation of SHA­1 HMAC must be used for this digest verification." The SHA1 HMAC in this image is validated by a vanilla OpenSSL installation in the underlying `Dockerfile`. However, feel free to modify the underlying `Dockerfile` for use with a FIPS module you validate with your own FIPS 140-2 implementation.

The goal of this project is to provide a convenient image to build/test Erlang software in FIPS mode. It is not suitable for a production deployment when FIPS 140-2 compliance is required.
