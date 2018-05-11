require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { User.create!(email:'test@gmail.com', password: 'password1', confirmed_at: Time.now) }
  let(:wiki) { Wiki.create!(title: "New Wiki title", body: "New Wiki Body", private: true, user: user) }

  describe "attributes" do
     it "has title, body, private, user  attributes" do
       expect(wiki).to have_attributes(title: "New Wiki title", body: "New Wiki Body", private: true, user: user)
     end
   end
 end
