require "rails_helper"

RSpec.describe "Registrations", type: :system do
  context "When the information is entered correctly" do
    it "A new user can be registered, and an account linked to user is created" do
      visit new_user_registration_path
      fill_in "user_account_attributes_name", with: "TEST inc."
      fill_in "user_email", with: "user@example.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"

      expect do
        click_button "アカウント登録"
        expect(page).to have_current_path new_user_session_path
      end.to change(User, :count).by(1).and change(Account, :count).by(1)

      user = User.last
      account = Account.last
      expect(user.account).to eq(account)
      expect(user.admin).to eq(true)
    end
  end
end
