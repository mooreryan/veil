# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  image       :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Project do
  before do
    @project = Project.new(name: 'Cattle microbiome',
                           description: "I'm a project description",
                           image: nil)
  end

  subject { @project }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :image }

  it { should be_valid }

  describe "when name is not present" do
    before { @project.name = " " }
    it { should_not be_valid }
  end

end
