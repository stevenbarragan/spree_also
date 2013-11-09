SpreeAlso
=========
[![Build Status](https://travis-ci.org/stevenbarragan/spree_also.png?branch=master)](https://travis-ci.org/stevenbarragan/spree_also)

This extension allows you get related products based on the user orders.
It relates all products in an order when it gets completed.

```ruby
product.also_bought
=> [ #<Spree::Product id: 2>, #<Spree::Product id: 3>, #<Spree::Product id: 4> ... ]
```

The products are returned sorted by the amount of times it has been related (they have been bought together), if product_1 has been bought with product_2 more times than the product_3, product_2 is returned first than product_3

Installation
------------

Add spree_also to your Gemfile:

```ruby
gem 'spree_also', github: 'stevenbarragan/spree_also'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_also:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_also/factories'
```

Copyright (c) 2013 [name of extension creator], released under the New BSD License
