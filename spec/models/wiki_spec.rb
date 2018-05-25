require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { User.create!(email: "user@bloccit.com", password: "password") }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user) }

   it { is_expected.to belong_to(:user) }

   describe "attributes" do
     it "has title,body, private and user attributes" do
       expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user)
     end

     it "is not private by default" do
       expect(wiki.private).to be(false)
     end
   end
end
