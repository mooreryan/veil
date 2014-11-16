# this assumes that name field is unique

def import_links(fname)
  File.open(fname, 'r').each_line do |line|
    unless line.start_with?('name')
      name, url, description = line.chomp.split("\t")

      link = Link.find_by(name: name)

      if link.nil?
        Link.create(name: name,
                    description: description,
                    url: url)
      else
        link.update(name: name,
                    description: description,
                    url: url)

      end
    end
  end
end

def main(fname)
  if !fname.nil? && File.exist?(fname)
    import_links(fname)
  else
    abort("ERROR: The file: '#{fname}' doesn't exist!")
  end
end

main('/Users/ryanmoore/Downloads/links_hehe.txt')
