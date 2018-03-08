## Project status

This project has been archived and its development halted. I don't have much interest in maintaining it anymore. Feel free to fork and have fun :)

# Browserlog

[![Build Status](https://travis-ci.org/aromaron/browserlog.svg?branch=master)](https://travis-ci.org/aromaron/browserlog)
[![Maintainability](https://api.codeclimate.com/v1/badges/2138ff84a3a51ae76871/maintainability)](https://codeclimate.com/github/aromaron/browserlog/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2138ff84a3a51ae76871/test_coverage)](https://codeclimate.com/github/aromaron/browserlog/test_coverage)
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/aromaron/browserlog.svg)](https://beta.gemnasium.com/projects/github.com/aromaron/browserlog)

[travis]: http://travis-ci.org/aromaron/browserlog
[codeclimate]: https://codeclimate.com/github/aromaron/browserlog

Browserlog is a live web log viewer for rails apps.

![Screenshot dark theme](https://dl.dropboxusercontent.com/u/27144161/browserlog-dark.png "Screenshot dark theme")
![Screenshot light theme](https://dl.dropboxusercontent.com/u/27144161/browserlog-light.png "Screenshot light theme")

## Features
* Auto-refresh

## Installation

The simplest way to install Browserlog is to use [Bundler](http://bundler.io).

```ruby
gem 'browserlog', '~> 0.0.2'
```

Browserlog is bundled as a Rails engine. Mount it on `config/routes.rb`.

```ruby
MyApp::Application.routes.draw do
  mount Browserlog::Engine => '/logs'
end
```

With this setup ``logs/development``, ``logs/staging``, ``logs/production`` and ``logs/test`` are automatically available on the browser.

## Note for production environments

For most production environments, it's recommended to not serve logs without authentication. While an authentication scheme
is not yet ready, this gem blocks by default any requests to ``logs/*`` in such production environment (i.e. ``RAILS_ENV=production``).

In case you want to allow those logs to be displayed under production (e.g. staging servers), use the following initializer:

```ruby
# config/initializers/allow_logs_on_production.rb
Browserlog.config.allow_production_logs = true
```

## Supported Rails Versions
* Rails >= 3.2.18 and 4.1.1
