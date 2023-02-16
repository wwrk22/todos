module Features
  module UserSessionHelpers
    def sign_in(email)
      visit root_path
      fill_in "Email", with: email
      click_on "Sign in"
    end
  end
end
