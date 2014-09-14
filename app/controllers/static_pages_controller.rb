class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end

  def people
    @grads = Person.where(p_type: "grad").sort_by(&:name)
    @undergrads = Person.where(p_type: "undergrad").sort_by(&:name)
    @collabs = Person.where(p_type: "collab").sort_by(&:name)
    @formers = Person.where(p_type: "former").sort_by(&:name)
  end

  def grads
    @grads = Person.where(p_type: "grad").sort_by(&:name)
  end

  def undergrads
    @undergrads = Person.where(p_type: "undergrad").sort_by(&:name)
  end

  def collabs
    @collabs = Person.where(p_type: "collab").sort_by(&:name)
  end

  def formers
    @formers = Person.where(p_type: "former").sort_by(&:name)
  end

  def research
  end 

  def software
  end

  def publications
  end

  def pictures
  end

  def links
  end
end
