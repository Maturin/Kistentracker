
# Execute: rails runner script/addadmin.rb la em pa

name     = ARGV[0]
email    = ARGV[1]
password = ARGV[2]

def error(msg)
  puts msg
  puts "addadmin.rb <user name> <email address> <password>"
  exit(1)
end 

if name.nil?
  error("User name must be set!")
end 

if email.nil?
  error("Email address must be set!")
end

if password.nil?
  error("Passord must be set!")
end

puts "Name    : " + name 
puts "Email   : " + email
puts "Password: " + password


tm = Teammate.new
tm.password = password
tm.save

cp = Cratepayer.new
cp.teammate_id = tm.id
cp.name = name
cp.email = email
cp.save



