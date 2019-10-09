class TuitionController < ApplicationController
def index
  respond_to do |format|
      format.html # index.html.erb
      format.mobile
    end
end

def payments

end

def new
  
end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd',
  })
  redirect_to "https://www.t0urnament.net"
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end


end
