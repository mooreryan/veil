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

  describe "get_first_author" do
    it "parses the first name out of the author list" do
      authors = 'Sasaki M, Orba Y, Ueno K, Ishii A'
      expect(get_first_author(authors)).to eq('Sasaki et al.')
    end

    it "just returns first author if there is only one author" do
      authors = 'Sasaki MK'
      expect(get_first_author(authors)).to eq('Sasaki')
    end

    it "returns the first two last names if only two authors" do
      authors = 'Sasaki M K, Orba Y'
      expect(get_first_author(authors)).to eq('Sasaki & Orba')
    end

    it "doesn't care about white space" do
      authors = '  Sasaki    M,    Orba  Y    ,     Ueno   K   '
      expect(get_first_author(authors)).to eq('Sasaki et al.')
    end
  end
end
