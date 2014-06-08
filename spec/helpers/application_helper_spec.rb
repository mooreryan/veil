require 'spec_helper'

describe ApplicationHelper do

  describe 'full_title' do
    it 'should include the page title' do
      expect(full_title('foo')).to match(/foo/)
    end

    it 'should include the base title' do
      expect(full_title('foo')).to match(/^VEIL/)
    end

    it 'should not include a bar for the home page' do
      expect(full_title('')).not_to match(/\|/)
    end
  end

  describe "lorem" do
    it 'starts with the lorem text' do
      expect(lorem).to start_with('Lorem ipsum dolor sit amet, ')
    end

    it "is followed by a lower case letter" do
      lorem_rest = lorem.gsub(/^Lorem ipsum dolor sit amet, /)
      expect(lorem_rest.first).to match(/[a-z]/)
    end
  end
end
