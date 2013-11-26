# Selfstarter
Selfstarter makes it easy to roll your own crowdfunding site. To get started,
fork this repository and change around ```config/settings.yml``` to suit your
needs.

[See it in action](http://unide.co)

## Selfstarter Background

Find more about it on the [original project](https://github.com/lockitron/selfstarter#Background)

Selfstarter is a starting point. We made some specific choices with Selfstarter
for Unide and we recommend you tailor it for your project:

* We use [Stripe](https://stripe.com) for payments. You can use Amazon Payments
  or [WePay](https://www.wepay.com/).
* Optionnaly you can use bitcoin payments  through coinbase account.
* Mailing list is powered by [Mailchimp](http://mailchimp.com/)
* Selfstarter doesn't come with any authentication, administration, mailers or
  analytics tools. We recommend adding a basic set of these so that you can
  message backers and manage orders.
* There is a payment options component that allows you to define different
  packages or levels for people to puchase/support at.  You can turn it on and
  off with a configuration setting.

## Getting Started

*Note: This assumes you have Ruby 1.9.2 or later installed properly and have a
basic working knowledge of how to use RubyGems*

First you'll need to fork and clone this repo

```bash git clone https://github.com/lockitron/selfstarter.git ```

Let's get all our dependencies setup: ```bash bundle install --without
production ```

Now let's create the database: ```bash rake db:migrate ```

If you're using the payment options component (use_payment_options = true in
settings.yml) then need to seed some data for the options: ```bash rake db:seed
```

Let's get it running: ```bash PUBLISHABLE_KEY=foo_test SECRET_KEY=sk_test rails s
```

### Customizing

While it is *just* a skeleton, we did make it a little quicker to change around
things like your product name, the colors, pricing, etc.

To change around the product name, tweet text, and more, open this file:

``` config/settings.yml ```

To change around the colors and fonts, open this file:

``` app/assets/stylesheets/variables.css.scss ```

To change around payment options, open :
``` db/seeds.rb ```

To dive into the code, open this file:

``` app/controllers/preorder_controller.rb ```

### Deploying to Production

We recommend using Heroku, and we even include a ```Procfile``` for you. All
you need to do is first install the [Heroku
Toolbelt](https://toolbelt.heroku.com) and then run:

```bash 
heroku create 
git push heroku master 
heroku run rake db:migrate 
heroku run rake db:seed
heroku config:set STRIPE_PUBLISHABLE_KEY=xxx STRIPE_SECRET_KEY=xxx
heroku config:set COINBASE_BUTTON_ID=xxx
heroku open ``` 

## Contributing

In it's current state, Selfstarter is very skeletal. We welcome your pull
requests. If you're looking to contribute, here are some good starting points.

### Reporting

There is no admin panel with Selfstarter. This could be useful when the
project's funding time is over and you want to export your orders elsewhere.

Relatedly, some analytics would be nice. It'd be good to know how many
reservations you receive over time, as well as the specifics of each order.
Customers may have questions or might want to modify their order after they've
placed it.

### Alternate Payment Processors

Stripe Payments works great for us, but it may not work out for everyone. If
you'd rather use Amazon, WePay, or any other payment processor, feel free to
send out a pull request.

### Tests

There aren't any tests yet. Tests are very welcome!
