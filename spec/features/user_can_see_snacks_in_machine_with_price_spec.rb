require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the snacks in that machine with prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    donuts = Snack.create(name: "Donuts", price: 2.00)
    cheezits = Snack.create(name: "Cheez-its", price: 1.50)
    cookies = Snack.create(name: "Cookies", price: 2.50)

    dons.snacks << [donuts, cheezits, cookies]

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content(donuts.name)
    expect(page).to have_content(donuts.price)

    expect(page).to have_content(cheezits.name)
    expect(page).to have_content(cheezits.price)

    expect(page).to have_content(cookies.name)
    expect(page).to have_content(cookies.price)
  end
end
