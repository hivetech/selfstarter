class PreorderController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :ipn

  def index
  end

  def checkout!
    #TODO Use these informations to subscribe to mailchimp
    @user = User.find_or_create_by_email!(params[:email])
    redirect_to root_url unless params[:stripe_token]

    if Settings.use_payment_options
      payment_option_id = params['payment_option']
      raise Exception.new("No payment option was selected") if payment_option_id.nil?
      payment_option = PaymentOption.find(payment_option_id)
      # Stripe takes amount as cents
      @amount = (payment_option.amount * 100).to_i
    else
      @amount = (Settings.price * 100).to_i
    end

    puts "Charge user #{@amount}"

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_url
  end

  def share
    @order = Order.find_by_uuid(params[:uuid])
  end

  def subscribe
    # Assume MAILCHIMP_API_KEY and MAILCHIMP_LIST_ID are set
    gb = Gibbon::API.new
    #TODO list = gb.lists.list({:filters => {:list_name => list_name}})
    list_id = ENV["MAILCHIMP_LIST_ID"]

    response = gb.lists.subscribe({
      :id => list_id,
      :email => {:email => params[:email]},
      :update_existing => true,
      :double_optin => false,
      :send_welcome => true,
      :throws_exceptions => true
    })

    if(response.is_a?(Hash))
      puts "======= Got response: #{response}"
      case response['code']
      when 502
        puts "======= Invalid Address!"
      when 214
        puts "======= Already signed up!"
      else
        puts "======= Error: #{response['error']}"
      end
    else
      puts"Successfully signed up !"
    end

    redirect_to root_url
  end
end
