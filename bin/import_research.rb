# this assumes that name field is unique

def import_projects(fname)
  File.open(fname, 'r').each_line do |line|
    unless line.start_with?('name')
      name, description, image = line.chomp.split("\t")

      project = Project.find_by(name: name)

      if project.nil?
        Project.create(name: name,
                       description: description,
                       image: image)
      else
        project.update(name: name,
                       description: description,
                       image: image)

      end
    end
  end
end

def main(fname)
  if !fname.nil? && File.exist?(fname)
    import_projects(fname)
  else
    abort("ERROR: The file: '#{fname}' doesn't exist!")
  end
end

main('/Users/ryanmoore/Downloads/projects_hehe.txt')
