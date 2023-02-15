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
  scenario "at the correct path" do
    # We expect the page that we `visit` to have the path returned by
    # `root_path`.
    visit root_path
    expect(page).to have_current_path(root_path)
  end
end
