# [recipient](http://recipient.herokuapp.com)
*A container for your recipes*

[![Circle CI](https://circleci.com/gh/maximebedard/recipient.svg?style=svg)](https://circleci.com/gh/maximebedard/recipient)
[![Code Climate](https://codeclimate.com/github/maximebedard/recipient/badges/gpa.svg)](https://codeclimate.com/github/maximebedard/recipient)
[![Test Coverage](https://codeclimate.com/github/maximebedard/recipient/badges/coverage.svg)](https://codeclimate.com/github/maximebedard/recipient)

# Installation

    brew install postgresql imagemagick
    git clone https://github.com/maximebedard/recipient
    cd recipient
    bundle install
    bundle rake db:migrate
    bundle rails server
    # now you are cooking...