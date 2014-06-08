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
end
