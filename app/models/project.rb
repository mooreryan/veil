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

class Project < ActiveRecord::Base
  validates :name, presence: true
end
