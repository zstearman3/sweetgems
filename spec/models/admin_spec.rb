require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "validate admin" do
    before :each do
      @admin = Admin.new(name: "Example User", email: "user@example.com",
                         password: "foobar", password_confirmation: "foobar")
    end
    it "should be valid Admin" do
      expect(@admin.valid?).to be_truthy
    end
    it "should invalidate empty name" do
      @admin.name = "     "
      expect(@admin.valid?).to be false
    end
    it "should invalidate empty email" do
      @admin.email = "     "
      expect(@admin.valid?).to be false
    end
    it "should allow valid email addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @admin.email = valid_address
        expect(@admin.valid?).to be_truthy
      end
    end
    it "should not allow invalid email addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @admin.email = invalid_address
        expect(@admin.valid?).to be false
      end
    end
    it "should not allow for a duplicate admin" do
      duplicate = @admin.dup
      duplicate.email = @admin.email.upcase
      @admin.save
      expect(duplicate.valid?).to be false
    end
    it "should save email addresses as lower-case" do
      mixed_case_email = "Foo@ExaMpLE.CoM"
      @admin.email = mixed_case_email
      @admin.save
      expect(@admin.reload.email).to eq(mixed_case_email.downcase)
    end
    it "should not allow a blank password" do
      @admin.password = @admin.password_confirmation = " " * 6
      expect(@admin.valid?).to be false
    end
    it "should not allow a password shorter than 6 characters" do
      @admin.password = @admin.password_confirmation = "a" * 5
      expect(@admin.valid?).to be false
    end
  end
end
