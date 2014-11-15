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

class Software < ActiveRecord::Base
  validates :name, :description, :link, presence: true
end
