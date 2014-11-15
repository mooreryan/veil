# == Schema Information
#
# Table name: publications
#
#  id         :integer          not null, primary key
#  citation   :text
#  link       :text
#  info       :text
#  created_at :datetime
#  updated_at :datetime
#  authors    :text
#  title      :text
#  journal    :text
#  date       :text
#  doi        :text
#  pmid       :text
#  year       :integer
#

require 'spec_helper'

describe Publication do
  pending "citation field should be unique"
end
