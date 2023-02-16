require 'rails_helper'

# Capybara 'feature' is like 'describe' in RSpec.
RSpec.feature "User vists homepage", type: :feature do
  scenario "successfully" do
    # We have access to Rails route helpers so we don't have to pass "/" as the
    # arg to the `visit` method here.
    visit root_path

    # `page` is provided by Capybara
    expect(page).to have_css 'h1', text: 'Todos'
  end

  # Example to show how `have_current_path` works.
  scenario "while not signed in" do
    # If not signed in, user is redirected to the path /sessions/new, so we
    # want to check that the page we land on has that path.
    visit root_path
    expect(page).to have_current_path(new_session_path)
  end
end
