# SpecCombos

Rspec matchers that can combine other matchers together, to allow precise testing elements of a sequence for example. The goal is to get :

* concise and readable specs
* factorized code
* explicit assertion failure messages

## Installation

Add this line to your application's Gemfile:

    gem 'spec_combos'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spec_combos

## Usage

The matchers can be used like any matcher, just taking other matchers as arguments.

### All matcher

    expect([1,3,5]).to all_ { be_odd }

### Any matcher

    expect([2,1,4]).to have_any_that { be_odd }

### And matcher

    expect(2).to and_(be_even, be_instance_of(Fixnum))

It can be composed with 'any' or 'all' matchers :

    expect([1,3,5]).to all_ { and_(be_odd, be_instance_of(Fixnum)) }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
