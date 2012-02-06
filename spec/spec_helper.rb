# Quick way of just loading all the specs and library files.
root = File.expand_path('..', File.dirname(__FILE__))
Dir[File.join(root, "lib/**/*.rb")].each {|f| require f}
