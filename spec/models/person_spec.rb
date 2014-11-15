# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  p_type     :string(255)
#  info       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Person do
  before do
    @person = Person.new(name: "Foo Bar", email: "foobar@baz.edu", 
                         p_type: "grad", info: lorem,
                         picture: 'https://flic.kr/p/pLWsEq')
  end

  subject { @person }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:p_type) }
  it { should respond_to(:info) }
  it { should respond_to(:picture) }

  it { should be_valid }

  describe "when name is not present" do
    before { @person.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @person.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[person@foo,com person_at_foo.org example.person@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @person.email = invalid_address
        expect(@person).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[person@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @person.email = valid_address
        expect(@person).to be_valid
      end
    end
  end

  describe "when email is duplicated" do
    it "should be invalid" do
      pending
    end
  end

  describe "when p_type format is invalid" do
    # acceptable: grad, undergrad, former, collab, pi
    it "should be invalid" do
      pending
    end
  end

  describe "when p_type format is valid" do
    it "should be valid" do
      pending
    end
  end
end
