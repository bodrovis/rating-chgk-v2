# RatingChgkV2

![Gem](https://img.shields.io/gem/v/rating-chgk-v2)
![CI](https://github.com/bodrovis/rating-chgk-v2/actions/workflows/ci.yml/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/bodrovis/rating-chgk-v2/badge.svg?branch=master)](https://coveralls.io/github/bodrovis/rating-chgk-v2?branch=master)
![Downloads total](https://img.shields.io/gem/dt/rating-chgk-v2)

Ruby client for [competitive "What? Where? When?" (aka "CHGK") API](http://api.rating.chgk.net/). This gem is a replacement for [ChgkRating](https://github.com/bodrovis/ChgkRating) which worked only with the deprecated API version.

## Installation and requirements

This gem requires Ruby 2.7+. Install it by running:

```
$ gem install rating-chgk-v2
```

Include it in your script:

```ruby
require 'rating_chgk_v2'
```

## Client initialization

Initialize an API client:

```ruby
@client = RatingChgkV2.client
```

Optionally, provide your JWT token and connection options (please note that JWT is not required to access most of the endpoints):

```ruby
@client = RatingChgkV2.client token: 'MY_JWT', params: {open_timeout: 100, timeout: 500}
```

Now use client to perform API requests:

```ruby
teams = @client.teams itemsPerPage: 2, name: 'Н', page: 3
```

## Usage

**[Please find documentation at our Wiki](https://github.com/bodrovis/rating-chgk-v2/wiki)**.

## Running tests

Tests are written in RSpec (all HTTP requests are stubbed):

```
rspec .
```

Observe test results and coverage.

## Copyright and license

Licensed under the [MIT license](./LICENSE.md).

Copyright (c) 2023 [Ilya Bodrov-Krukowski](http://bodrovis.tech)
