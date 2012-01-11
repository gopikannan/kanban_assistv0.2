# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
KanbanAssistv02::Application.initialize!
my_date_formats = { :default => '%m/%d/%Y' }
Rails.logger = Logger.new(STDOUT)
