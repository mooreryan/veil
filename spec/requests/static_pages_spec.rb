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

    # @person = Person.new(name: "Foo Bar Grad",
    #                      email: "foobargrad@baz.edu",
    #                      p_type: "grad",
    #                      info: lorem)
    # @person = Person.new(name: "Bar Baz Grad",
    #                      email: "barbazgrad@baz.edu",
    #                      p_type: "grad",
    #                      info: lorem)
    # @person = Person.new(name: "Foo Bar Undergrad",
    #                      email: "foobarundergrad@baz.edu",
    #                      p_type: "undergrad",
    #                      info: lorem)
    # @person = Person.new(name: "Bar Baz Undergrad",
    #                      email: "barbazundergrad@baz.edu",
    #                      p_type: "undergrad",
    #                      info: lorem)
    # @person = Person.new(name: "Foo Bar Collab",
    #                      email: "foobarcollab@baz.edu",
    #                      p_type: "collab",
    #                      info: lorem)
    # @person = Person.new(name: "Bar Baz Collab",
    #                      email: "barbazcollab@baz.edu",
    #                      p_type: "collab",
    #                      info: lorem)
    # @person = Person.new(name: "Foo Bar Former",
    #                      email: "foobarformer@baz.edu",
    #                      p_type: "former",
    #                      info: lorem)
    # @person = Person.new(name: "Bar Baz Former",
    #                      email: "barbazformer@baz.edu",
    #                      p_type: "former",
    #                      info: lorem)
    # @person = Person.new(name: "Foo Bar Pi",
    #                      email: "foobarpi@baz.edu",
    #                      p_type: "pi",
    #                      info: lorem)
    # @person = Person.new(name: "Bar Baz Pi",
    #                      email: "barbazpi@baz.edu",
    #                      p_type: "pi",
    #                      info: lorem)
    

  end
  
  subject { page }

  it "should have the right links on the layout" do
    visit root_path

    click_link 'People'
    expect(page).to have_title(full_title('People'))

    pending("specify difference between the two people links")
    
    # click_link 'Grad students'
    # expect(page).to have_title(full_title('Grad students'))

    # click_link 'Undergrads'
    # expect(page).to have_title(full_title('Undergrads'))

    # click_link 'Collaborators'
    # expect(page).to have_title(full_title('Collaborators'))

    # click_link 'Former members'
    # expect(page).to have_title(full_title('Former members'))

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

  shared_examples_for "all people pages" do
    it "has the people link panel" do
      pending
    end
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'VEIL' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"

    it { should_not have_title('| VEIL') }
  end

  describe "Publications page" do
    before { visit publications_path }
    let(:heading) { 'Publications' }
    let(:page_title) { 'Publications' }

    it_should_behave_like "all static pages"

    it { should have_title('Publications') }
  end

  describe "Software page" do
    before { visit software_path }
    let(:heading) { 'Software' }
    let(:page_title) { 'Software' }

    it_should_behave_like "all static pages"

    it { should have_title('Software') }
  end
  
  describe "People page" do
    before do 
      visit people_path
    end

    let(:heading) { 'People' }
    let(:page_title) { 'People' }
    let(:all_people) { Person.all }

    it_should_behave_like "all static pages"
    it_should_behave_like "all people pages"
    it { should have_title('People') }

    it "lists all the people" do
      all_people.each do |person|
        expect(page).to have_selector('li', text: person.name)
      end

    end
    it "sorts the people" do
      pending("The people should be sorted by first letter of first name")
    end
  end

  describe "Faculty page" do
    before do 
      visit faculty_path
    end

    let(:heading) { "Faculty" }
    let(:page_title) { "Faculty" }
    let(:faculty) { Person.where(p_type: "faculty") }

    it_should_behave_like "all static pages"
    it_should_behave_like "all people pages"
    it { should have_title("Faculty") }

    it "lists all the faculty" do
      faculty.each do |person|
        expect(page).to have_selector('li', text: person.name)
      end
    end
  end

  
  describe "Grad students page" do
    before do 
      visit grads_path
    end

    let(:heading) { "Grad students" }
    let(:page_title) { "Grad students" }
    let(:all_grads) { Person.where(p_type: "grad") }

    it_should_behave_like "all static pages"
    it_should_behave_like "all people pages"
    it { should have_title("Grad students") }

    it "lists all the grad students" do
      all_grads.each do |person|
        expect(page).to have_selector('li', text: person.name)
      end
    end
  end

  describe "Undergrads page" do
    before do 
      visit undergrads_path
    end

    let(:heading) { "Undergrads" }
    let(:page_title) { "Undergrads" }
    let(:all_undergrads) { Person.where(p_type: "undergrad") }

    it_should_behave_like "all static pages"
    it_should_behave_like "all people pages"
    it { should have_title("Undergrads") }

    it "lists all the grad students" do
      all_undergrads.each do |person|
        expect(page).to have_selector('li', text: person.name)
      end
    end
  end

  describe "Collaborators page" do
    before do 
      visit collabs_path
    end

    let(:heading) { "Collaborators" }
    let(:page_title) { "Collaborators" }
    let(:all_collabs) { Person.where(p_type: "collab") }

    it_should_behave_like "all static pages"
    it_should_behave_like "all people pages"
    it { should have_title("Collaborators") }

    it "lists all the grad students" do
      all_collabs.each do |person|
        expect(page).to have_selector('li', text: person.name)
      end
    end
  end

  describe "Former members page" do
    before do 
      visit formers_path
    end

    let(:heading) { "Former members" }
    let(:page_title) { "Former members" }
    let(:all_formers) { Person.where(p_type: "former") }

    it_should_behave_like "all static pages"
    it_should_behave_like "all people pages"
    it { should have_title("Former members") }

    it "lists all the grad students" do
      all_formers.each do |person|
        expect(page).to have_selector('li', text: person.name)
      end
    end
  end

  describe "Links page" do
    pending 'test me'
  end

  describe "Research page" do
    pending 'test me'
  end

end
