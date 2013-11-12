class PreorderController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :ipn

  def index
  end

  #def create
  def checkout!
    @user = User.find_or_create_by_email!(params[:email])
    redirect_to root_url unless params[:stripe_token]
    @amount = Settings.price

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
end
