class Paperboy

  def initialize(name, quota, experience, side, earnings = nil)
    @name = name
    @quota = quota
    @experience = experience
    @side = side
    @earnings = earnings
  end

  def quota
    @experience / 2 + @quota
  end

  def deliver(start_address, end_address)

    total_house = (end_address - start_address) + 1

    delivered = 0
    if total_house % 2 == 0
      delivered = total_house / 2
    else
      if start_address % 2 == 0
        if @side == 'even'
          delivered = (total_house / 2) + 1
        elsif @side == 'odd'
          delivered = (total_house / 2)
        end
      elsif start_address % 2 == 1
        if @side == 'even'
          delivered = (total_house / 2)
        elsif @side == 'odd'
          delivered = (total_house / 2) + 1
        end
      end
    end
    puts "delivered: #{delivered}"

    # odd_house_number = (start_address..end_address).inject(0) { |sum, n| sum + (n % 2) }
    # even_house_number = total_house - odd_house_number
    # puts "total_house: #{total_house}"
    # puts "odd_house_number: #{odd_house_number}"
    # puts "even_house_number: #{even_house_number}"
    # regular_pay = total_house * 0.25
    # over_time_pay = (total_house - @quota) * 0.50
    # if total_house <= @quota
    #   @earnings = regular_pay.to_f
    # elsif total_house > @quota
    #   @earnings = regular_pay.to_f + over_time_pay.to_f
    # end
  end

end


#tom = Paperboy.new('tom', 50, 20, 'even')
