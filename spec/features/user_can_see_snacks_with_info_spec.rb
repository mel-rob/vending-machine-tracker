require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  scenario 'they see the snack with info' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    donuts = Snack.create(name: "Donuts", price: 2.00)
    cheezits = Snack.create(name: "Cheez-its", price: 1.50)
    cookies = Snack.create(name: "Cookies", price: 2.50)

    dons.snacks << [donuts, cheezits, cookies]

    owner2 = Owner.create(name: "Melissa's Snacks")
    turing  = owner.machines.create(location: "Turing School")

    turing.snacks << [donuts, cheezits]

    visit snack_path(donuts)

    expect(page).to have_content(donuts.name)
    expect(page).to have_content(donuts.price)

  end
end
