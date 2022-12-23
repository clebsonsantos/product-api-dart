A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

# Product Api Dart

## Request Collection
[![Run in Insomnia}](https://insomnia.rest/images/run.svg)](https://insomnia.rest/run/?label=Product%20Api%20Dart&uri=https%3A%2F%2Fraw.githubusercontent.com%2Fclebsonsantos%2Fproduct-api-dart%2Fmaster%2Finsomnia%2FInsomnia_2022-12-23.json)

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ dart run bin/server.dart
Server listening on port 3000
```

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 3000:3000 myserver
Server listening on port 3000
```
