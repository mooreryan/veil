# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  citation   :string(255)
#  link       :string(255)
#  info       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Publication do
  pending "citation field should be unique"
end
