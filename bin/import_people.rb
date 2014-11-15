# this assumes that name field is unique

# if you need to update the name, this will not do it

def import_people(fname)
  File.open(fname, 'r').each_line do |line|
    unless line.start_with?('name')
      name, email, p_type, picture, info = line.chomp.split("\t")

      person = Person.find_by(name: name)

      if person.nil?
        Person.create(name: name,
                      email: email,
                      p_type: p_type,
                      picture: picture,
                      info: info)
      else
        person.update(email: email,
                      p_type: p_type,
                      picture: picture,
                      info: info)
      end
    end
  end
end

def main(fname)
  if !fname.nil? && File.exist?(fname)
    import_people(fname)
  else
    abort("ERROR: The file: '#{fname}' doesn't exist!")
  end
end
