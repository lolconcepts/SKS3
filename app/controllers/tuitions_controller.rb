class TuitionsController < ApplicationController
def index
  respond_to do |format|
      format.html # index.html.erb
      format.mobile
    end
end

def new
  
end

def create
  # Amount in cents
  @amount = params[:amount]
  @amount = @amount.to_i
  @student = Student.find(params[:student_id])
  @description = "Sidekick - Tuition - #{@student.fullname}"
  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: @description,
    currency: 'usd',
  })
  tuition = Tuition.create({
    stripe_id: customer.source,
    student_id: @student.id,
    amount: @amount
  })
  redirect_to "https://www.t0urnament.net"
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end


end
