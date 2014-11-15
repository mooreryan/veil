# == Schema Information
#
# Table name: softwares
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  link        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Software do
  before do
    @software = Software.new(name: 'VIROME',
                             description: 'A fun program',
                             link: 'http://virome.dbi.udel.edu')
  end

  subject { @software }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:link) }
  it { should be_valid }

  describe "when name is not present" do
    before { @software.name = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @software.description = " " }
    it { should_not be_valid }
  end

  describe "when link is not present" do
    before { @software.link = " " }
    it { should_not be_valid }
  end
end
