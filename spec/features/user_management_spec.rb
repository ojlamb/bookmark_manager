require 'spec_helper'

feature 'User sign up' do
  before :each do
     @user = User.new(user_attributes)
   end

  scenario 'I can sign up as a new user' do
    expect { sign_up(@user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
    @user.password_confirmation = 'wrong'
    expect { sign_up(@user) }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'With an email that is already registered' do
    sign_up(@user)
    expect { sign_up(@user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
end

def user_attributes
  {email: 'alice@example.com', password: '12345678', password_confirmation: '12345678'}
end

end
