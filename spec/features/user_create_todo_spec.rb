require "rails_helper"

RSpec.feature "User creates todo", type: :feature do
  scenario "successfully" do
    sign_in("someone@example.com")

    click_on "Add a new todo"
    fill_in "todo_title", with: "Buy milk"
    click_on "Create Todo"

    expect(page).to have_css '.todos li', text: "Buy milk"
  end
end
