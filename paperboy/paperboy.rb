class Paperboy

  attr_accessor :name, :side, :quota, :experience
  attr_reader :earnings # read-only

  def initialize(name, side, quota = 50, experience = 0, earnings = 0)
    @name = name
    @quota = quota
    @experience = experience
    @side = side
    @earnings = earnings
  end



  def quota
    @quota = (@experience / 2) + 50
  end

  def deliver(start_address, end_address)
    # Calculates number of odd/even houses in the interval
    total_house = (end_address - start_address).abs + 1
    if start_address < end_address
      odd_house_number = (start_address..end_address).inject(0) { |sum, n| sum + (n % 2) }
      even_house_number = total_house - odd_house_number
    elsif start_address > end_address
      odd_house_number = (start_address.downto(end_address)).inject(0) { |sum, n| sum + (n % 2) }
      even_house_number = total_house - odd_house_number
    end
    #
    # another way to calculate
    #
    # @delivered = 0
    # if total_house % 2 == 0
    #   @delivered = total_house / 2
    # else
    #   if start_address % 2 == 0
    #     if @side == 'even'
    #       @delivered = (total_house / 2) + 1
    #     elsif @side == 'odd'
    #       @delivered = (total_house / 2)
    #     end
    #   elsif start_address % 2 == 1
    #     if @side == 'even'
    #       @delivered = (total_house / 2)
    #     elsif @side == 'odd'
    #       @delivered = (total_house / 2) + 1
    #     end
    #   end
    # end

    # Determines the number of papers delivered based on @side
    if @side == 'even'
      @delivered = even_house_number
    elsif @side == 'odd'
      @delivered = odd_house_number
    end

    #Updates experience
    @experience += @delivered

    # Calculates @earnings based on @delivered
    regular_pay = @delivered * 0.25
    over_time_pay = (@delivered - @quota) * 0.25
    if @delivered <= @quota
      @earnings = regular_pay.to_f
    elsif @delivered > @quota
      @earnings = regular_pay.to_f + over_time_pay.to_f
    end

    # Deducts $2 if you don't meet the quota
    if @delivered < @quota
      @earnings -= 2
    end

    #return @earnings
    return @earnings
  end

  def report
    "I am #{@name}, I've delivered #{@experience} papers and I've earned #{@earnings}"
  end

end
