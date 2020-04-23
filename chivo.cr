require "./unistd"
require "system/user"
require "./shadow"
require "./crypt"

comando = ARGV.join(" ")
puts "chivo is going to run: #{comando}"

user_id = LibUnistd.getuid
current_user = System::User.find_by(id: user_id.to_s)
current_username = current_user.username

puts "[chivo] password for #{current_username}:"
password = STDIN.noecho &.gets.try &.chomp

raise "Didn't input a password" unless password

current_shadow = LibShadow.getspnam(current_username)
raise "Couldn't read shadow password - are we root?" unless current_shadow

shadow_password = String.new(current_shadow.value.encrypted_password)
puts "   Shadow: #{shadow_password}"

current_encrypted = String.new(LibCrypt.crypt(password, shadow_password))
puts "Encrypted: #{current_encrypted}"

raise "Wrong password!" unless current_encrypted == shadow_password

raise "Couldn't set uid" unless LibUnistd.setuid(0) == 0
puts `#{comando}`
