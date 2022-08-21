motivation = 10
puts 'Go ' * motivation

def full_name(first_name, last_name)
  name = first_name.capitalize + " " + last_name.capitalize
  return name
end

puts full_name("Gabriel", "Mathias")
puts full_name("Seb", "Saunier")
