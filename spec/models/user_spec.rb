require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "Validations" do
    it "is valid" do
      user = User.new(
        first_name: "ilia",
        last_name: "codes",
        email: "iliacodes@github.com",
        password: "1234567",
        password_confirmation: "1234567"

      )
      expect(user).to be_valid
    end
  end

  it "no email input" do
    user = User.new(
      first_name: "ilia",
      last_name: "codes",
      email: nil,
      password: "1234567",
      password_confirmation: "1234567"

    )
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "no password input" do
    user = User.new(
      first_name: "ilia",
      last_name: "codes",
      email: "iliacodes@github.com",
      password: nil,
      password_confirmation: "1234567"

    )
    expect(user).to be_invalid
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "no confirmation password input" do
    user = User.new(
      first_name: "ilia",
      last_name: "codes",
      email: "iliacodes@github.com",
      password: "1234567",
      password_confirmation: nil

    )
    expect(user).to be_invalid
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it "no first name input" do
    user = User.new(
      first_name: nil,
      last_name: "codes",
      email: "iliacodes@github.com",
      password: "1234567",
      password_confirmation: "1234567"
    )
    expect(user).to be_invalid
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "no last name input" do
    user = User.new(
      first_name: "ilia",
      last_name: nil,
      email: "iliacodes@github.com",
      password: "1234567",
      password_confirmation: "1234567"
    )
    expect(user).to be_invalid
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "email with whitespaces input" do
    user = User.new(
      first_name: "ilia",
      last_name: "codes",
      email: " iliacodes@github.com   ",
      password: "1234567",
      password_confirmation: "1234567"
    )
    expect(user).to be_valid
  end

  it "email with caps input" do
    user = User.new(
      first_name: "ilia",
      last_name: "codes",
      email: " iliaCODES@github.com   ",
      password: "1234567",
      password_confirmation: "1234567"
    )
    expect(user).to be_valid
  end

end
