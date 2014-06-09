class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end

  def people
    @grads = Person.where(p_type: "grad")
    @undergrads = Person.where(p_type: "undergrad")
    @collabs = Person.where(p_type: "collab")
    @formers = Person.where(p_type: "former")
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
