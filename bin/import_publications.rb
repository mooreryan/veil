# this assumes that name field is unique

def import_publications(fname)
  File.open(fname, 'r').each_line do |line|
    unless line.start_with?('authors')
      authors, title, journal, date, doi, pmid, citation, link, info = line.chomp.split("\t")

      publication = Publication.find_by(citation: citation)

      if publication.nil?
        Publication.create(authors: authors,
                           title: title,
                           journal: journal,
                           date: date,
                           doi: doi,
                           pmid: pmid,
                           citation: citation,
                           link: link,
                           info: info)
      else
        publication.update(authors: authors,
                           title: title,
                           journal: journal,
                           date: date,
                           doi: doi,
                           pmid: pmid,
                           citation: citation,
                           link: link,
                           info: info)

      end
    end
  end
end

def main(fname)
  if !fname.nil? && File.exist?(fname)
    import_publications(fname)
  else
    abort("ERROR: The file: '#{fname}' doesn't exist!")
  end
end

main('/Users/ryanmoore/Downloads/publications_hehe.txt')
