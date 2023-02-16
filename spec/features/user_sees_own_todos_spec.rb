require 'rails_helper'

RSpec.feature "User sees own todos", type: :feature do
  scenario "does not see todos of other users" do
    Todo.create!(title: "Buy eggs", email: "someone_else@example.com")

    sign_in "someone@example.com"

    expect(page).not_to have_css ".todos li", text: "Buy eggs"
  end
end
