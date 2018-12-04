

# base class of subscriber
class Subscriber
  def initialize(hash)
    @first_name = hash['firstName']
    @last_name = hash['lastName']
    @tarif = Integer(hash['tarif'])
    @number = hash['number']
  end
  
  def to_s
    'Subscriber:\n' +
    "#{@first_name} #{last_name}, tarif: #{@tarif}, used: #{@minutes} minutes, num: #{@number}"
  end
  
  attr_accessor :number
  attr_reader :first_name, :last_name, :tarif
end