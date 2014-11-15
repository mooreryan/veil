module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'VEIL'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def lorem
    s = 'Lorem ipsum dolor sit amet, '
    s2 = BetterLorem.w(rand(40) + 15, true, false)
    s2[0] = s2[0].downcase
    s << s2
  end

  def kitty
    n = rand(9) + 1
    "http://lorempixel.com/400/600/cats/#{n}"
  end

  # parse the author names from the PubMed RSS feed
  def get_first_author(authors)
    author_list = authors.strip.split(/ *, */)
    if author_list.length == 1
      return(author_list.first.split(/ +/).first)
    elsif author_list.length == 2
      splits = author_list.map { |author| author.split(/ +/) }
      first_author_last_name = splits.first.first
      second_author_last_name = splits.second.first
      return("#{first_author_last_name} & #{second_author_last_name}")
    else
      first_author_last_name = author_list.first.split(/ +/).first
      return("#{first_author_last_name} et al.")
    end
  end
end
