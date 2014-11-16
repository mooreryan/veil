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

class Link < ActiveRecord::Base
    validates :name, :url, presence: true
end
