require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it {should have_many :machine_snacks}
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'methods' do
    it "can calculate average price of all snacks" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      donuts = Snack.create(name: "Donuts", price: 2.00)
      cheezits = Snack.create(name: "Cheez-its", price: 1.50)
      cookies = Snack.create(name: "Cookies", price: 2.50)

      dons.snacks << [donuts, cheezits, cookies]
      expect(dons.average_price.to_i).to eq(2)
    end
  end
end
