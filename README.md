server
======

[![Dependency Status](https://img.shields.io/gemnasium/amylum/server.svg)](https://gemnasium.com/amylum/server)
[![Code Climate](https://img.shields.io/codeclimate/github/amylum/server.svg)](https://codeclimate.com/github/amylum/server)
[![Coverage Status](https://img.shields.io/coveralls/amylum/server.svg)](https://coveralls.io/r/amylum/server)
[![Build Status](https://img.shields.io/travis/amylum/server.svg)](https://travis-ci.org/amylum/server)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Proxy server for packages stored in S3

## Usage

## Installation

First, you need packages on S3 to serve. The packages can be managed with the [s3repo](https://github.com/amylum/s3repo) gem. For an example, see [my repo repo](https://github.com/amylum/repo).

### Running the server

I run this inside my [dock0/amylum docker container](https://github.com/dock0/amylum). Instructions for that can be found in its README, but it essentially amounts to setting the following env vars and running the container (which runs the server's procfile):

* AWS_ACCESS_KEY_ID: access key for S3 credentials
* AWS_SECRET_ACCESS_KEY: secret key for S3 credentials
* AWS_REGION: region of S3 bucket
* S3_BUCKET: bucket name where packages are stored
* MAINTAINER_EMAIL: email to show on error pages
* PUMA_ADDRESS: address to bind to, defaults to localhost
* PUMA_HTTP_PORT: port for HTTP (defaults to 8080)
* PUMA_SSL: enable SSL listening
* PUMA_HTTPS_PORT: port for HTTPS (defaults to 8443)
* PUMA_SSL_DIR: directory for finding ./cert and ./key for SSL

## License

This repo is released under the MIT License. See the bundled LICENSE file for details.
