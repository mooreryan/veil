# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  name        :text
#  url         :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Link do
  before do
    @link = Link.new(name: 'PubMed',
                     description: 'Everybody runs success apples.',
                     url: 'http://www.ncbi.nlm.nih.gov/pubmed')
  end

  subject { @link }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :url }

  it { should be_valid }

  describe "when name is not present" do
    before { @link.name = " " }
    it { should_not be_valid }
  end

  describe "when url is not present" do
    before { @link.url = " " }
    it { should_not be_valid }
  end
  
end
