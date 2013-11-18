# Nesstar API for Ruby

This is Nesstar REST API client written in Ruby. It represents the REST endpoints as plain old Ruby objects.

## Installation

```
$ rake install
```

## Getting started

Connect to a server like this:

```
server = NesstarAPI.get_server "http://my-instance-of-nesstar-rest-api.com"
```

From a server object you can list studies or load individual studies by ID:

```
studies = server.get_studies
my_study = server.get_study "my-study-id"
```

## Documentation

Run `rake docs` to build the documentation. The documentation will appear in the `docs` folder.
