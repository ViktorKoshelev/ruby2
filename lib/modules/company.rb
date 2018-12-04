require_relative 'reading_module.rb'
require_relative 'subscriber.rb'

# base class of communication company
class Company
  def initialize
    @subscribers = []
    
    initial_subscribers = ReadingModule.read_initial_subscribers
    
    @subscribers += initial_subscribers
    
    @subscribers.map {|sub| Subscriber.new(sub)}
  end
  
  def find_subscriber_by_name(sub)
    subs = @subscribers.select do |subscriber|
      subscriber.first_name == sub['firstName'] && subscriber.last_name == sub['lastName']
    end
    result = ''
    subs.each {|sub| result += sub.to_s + '\n'}
    return nil if result == ''
    result
  end
  
  def add_subscriber(sub)
    numbers = Hash.new(false)
    @subscribers.each {|sub| numbers[sub.number] = true}

    i = 100000
    while i < 1000000
      break if !numbers[i]
      i += 1
    end

    if i == 1000000
      puts 'Company full'
    else
      sub['number'] = i
      @subscribers.push(Subscriber.new(sub))
      return i
    end
  end
  
  def delete_subscriber(sub_h)
    @subscribers.delete_if {|sub| sub.first_name == sub_h['firstName'] && sub.last_name == sub['lastName']}
  end
  
  def find_subscriber_by_number(num)
    sub = @subscribers.find {|sub| sub.number == num}
    sub.to_s if sub
    'Company hasn\'t subscriber with such number'
  end
  
  def get_subscribers
    result = ''
    @subscribers.each do |sub| 
      result += sub.to_s
    end
    result if result
    'Company has no subscribers'
  end
  
  def calc_receipt(num, mins)
    sub = @subscribers.find {|sub| sub.number == num}
    case sub.tarif
    when 1
      return 'You have to paid 420'
    when 2
      if mins <= 350
        return 'You have to paid 300'
      else
        cost = 300 + (mins - 350)*0.34
      end
    when 3
      cost = mins * 0.38 + 180
    end
    return "You have to paid #{cost}"
  end
  
  def get_subscribers_by_tarif(tarif)
    subs = @subscribers.select do |subscriber|
      subscriber.tarif == tarif
    end
    result = ''
    subs.each {|sub| result += sub.to_s}
    return 'No subscribers with such tarif' if result == ''
    result
  end
end