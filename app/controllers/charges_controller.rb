class ChargesController < ApplicationController




  def new
    @amount = 15_00
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.email}",
     amount:@amount
   }
  end

  def create
# Creates a Stripe Customer object, for associating
# with the charge
@amount = 15_00

customer = Stripe::Customer.create(
  email: current_user.email,
  card: params[:stripeToken]
)

# Where the real magic happens
charge = Stripe::Charge.create(
  customer: customer.id, # Note -- this is NOT the user_id in your app
  amount: @amount,
  description: "BigMoney Membership - #{current_user.email}",
  currency: 'usd'
)
if charge.paid
      current_user.premium!
flash[:notice] = "Thanks for updating your plan, #{current_user.email}!Now you can create private wikis."
redirect_to edit_user_registration_path
end
# Stripe will send back CardErrors, with friendly messages
# when something goes wrong.
# This `rescue block` catches and displays those errors.
rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_charge_path
end

end
