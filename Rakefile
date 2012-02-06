require File.expand_path('lib/vending_machine.rb', File.dirname(__FILE__))

namespace :state_machine do
  task :draw
    directory "doc"
    VendingMachine.state_machines.each do |name, machine|
      machine.draw(:path => './doc')
    end
  end
file
