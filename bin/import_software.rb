# this assumes that name field is unique

# if you need to update the name, this will not do it

def import_software(fname)
  File.open(fname, 'r').each_line do |line|
    unless line.start_with?('name')
      name, description, link = line.chomp.split("\t")

      software = Software.find_by(name: name)

      if software.nil?
        Software.create(name: name,
                        description: description,
                        link: link)
      else
        software.update(description: description,
                        link: link)

      end
    end
  end
end

def main(fname)
  if !fname.nil? && File.exist?(fname)
    import_software(fname)
  else
    abort("ERROR: The file: '#{fname}' doesn't exist!")
  end
end
