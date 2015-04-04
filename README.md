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

### On Heroku

Create an application and set the following variables:

* AWS_ACCESS_KEY_ID: access key for S3 credentials
* AWS_SECRET_ACCESS_KEY: secret key for S3 credentials
* AWS_REGION: region of S3 bucket
* S3_BUCKET: bucket name where packages are stored
* MAINTAINER_EMAIL: email to show on error pages
* RACK_ENV: production

Fork this repo and push it to the Heroku app. Set up custom DNS if desired.

## License

This repo is released under the MIT License. See the bundled LICENSE file for details.
