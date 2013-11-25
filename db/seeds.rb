# This file should contain all the record creation needed to seed the database
# with its default values.  The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PaymentOption.create(
    [
        {
            amount: 5.00,
            amount_display: '$5',
            description: '<strong>Supporter: </strong>You are part of the project and you receive a sincere thank you from us',
            shipping_desc: '',
            delivery_desc: '',
            limit: -1
        },
        {
            amount: 100.00,
            amount_display: '$100',
            description: '<strong>Strategic member : </strong>You will be granted with an early access to our private beta and become a pioneer of Unide',
            shipping_desc: '',
            delivery_desc: 'Estimated connection: Dec 2013',
            limit: 50
        },
        {
            amount: 1000.00,
            amount_display: '$1000',
            description: '<strong>Premium Sponsor : </strong>Get a priority vote on features development, a team access to Unide and priviledged place on our site',
            shipping_desc: '',
            delivery_desc: 'Estimated delivery: Mar 2014',
            limit: 10
        },
        {
            amount: 10000.00,
            amount_display: '$10000',
            description: '<strong>Diamond Sponsor : </strong>Receive everything above plus an opportunity to exchange views on the project with our team around a great dinner in Paris',
            shipping_desc: '',
            delivery_desc: 'Estimated delivery: Mar 2014',
            limit: -1
        }
    ])
