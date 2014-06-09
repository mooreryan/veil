require 'spec_helper'

describe "Static pages" do
  before do
    Person.create(name: "Foo Grad", email: "foo_grad@thing.edu",
                  p_type: "grad", info: lorem)
    Person.create(name: "Undergrad Foo", email: "undergrad@thing.edu",
                  p_type: "undergrad", info: lorem)
    Person.create(name: "Collab Orator", email: "collab_man@thing.edu",
                  p_type: "collab", info: lorem)
    Person.create(name: "Old Member", email: "old_guy@thing.edu",
                  p_type: "former", info: lorem)
  end
  
  subject { page }

  it "should have the right links on the layout" do
    visit root_path

    click_link 'People'
    expect(page).to have_title(full_title('People'))
    
    click_link 'Research'
    expect(page).to have_title(full_title('Research'))

    click_link 'Software'
    expect(page).to have_title(full_title('Software'))

    click_link 'Publications'
    expect(page).to have_title(full_title('Publications'))

    click_link 'Pictures'
    expect(page).to have_title(full_title('Pictures'))

    click_link 'Links'
    expect(page).to have_title(full_title('Links'))

    click_link 'VEIL'
    expect(page).to have_title(full_title(''))
  end

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'VEIL' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"

    it { should_not have_title('| VEIL') }
  end

  describe "People page" do
    before do 
      visit people_path
    end

    let(:heading) { 'People' }
    let(:page_title) { 'People' }
    let(:all_people) { Person.all }

    it_should_behave_like "all static pages"
    it { should have_title('People') }

    it "lists all the people" do
      all_people.each do |person|
        expect(page).to have_selector('p', text: person.name)
      end
    end
  end
end
