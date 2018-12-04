require 'csv'

# base module for reading data for communication company
module ReadingModule
  def self.read_initial_subscribers
    subscribers = []
    CSV.foreach('../initial/subscribers.csv', headers: true) do |row|
      subscribers.push(row.to_h)
    end
    subscribers
  end
  
  def self.save_subscribers
  
  end
end
