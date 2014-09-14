def import_people(fname)
  File.open(fname, 'r').each_line do |line|
    unless line.start_with?('name')
      name, email, p_type, info = line.chomp.split("\t")
      Person.create(name: name, email: email, p_type: p_type, info: info)
    end
  end
end
