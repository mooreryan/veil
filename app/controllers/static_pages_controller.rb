require 'feedjira'

class StaticPagesController < ApplicationController
  def home
    url = 'http://www.ncbi.nlm.nih.gov/entrez/eutils/erss.cgi?rss_guid=1jye2CWYy7V98G0HVAr6FZWvhJYEhcJdZu93YQE77EDqxGCQAj'

    feed = Feedjira::Feed.fetch_and_parse(url)
    @entries = feed.entries

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
    @pis = Person.where(p_type: "pi").sort_by(&:name)
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
    @software = Software.all.sort_by { |software| software.name.downcase }
  end

  def publications
  end

  def pictures
  end

  def links
  end
end
