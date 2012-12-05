# build_git.rb

# Delete dir dia
require 'FileUtils'
FileUtils.rm_rf 'dia'

# Pull dia folders from GitHub
puts "Grabbing Latest dia version. Please wait..."

puts `git clone https://vchung:arete01@github.com/areteinc/dia.git`

puts "running RSpec. please wait..."

# Run Rspec
Dir.glob(File.join('d:','deploy','dia','**','*_spec.rb')) do |rb_file|

  Dir.chdir(File.join('d:','deploy','dia')) do

    s_command = "rspec #{rb_file} | more /E /S >> D:/deploy/rspec-test-result.txt"

    puts "Running RSpec #{rb_file}. working dir #{Dir.pwd}. command #{s_command}. Please wait..."
    puts

    `#{s_command}`
    puts "Finished running RSpec #{rb_file}."
    puts
  end
end