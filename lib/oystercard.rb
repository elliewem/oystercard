class Oystercard

  CARD_LIMIT = 90
  MIN_BALANCE = 1

  attr_reader :balance

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(money)
    raise("There cannot be more than #{CARD_LIMIT} on the card") if (@balance + money) > CARD_LIMIT
    @balance += money
  end


  def touch_in
    raise("Insufficient funds") if @balance < MIN_BALANCE
    @in_journey = true
    in_journey?
  end

  def touch_out
    deduct
    @in_journey = false
    in_journey?
  end

  def in_journey?
    @in_journey ? "in use" : "not in use"
  end

  private
  def deduct
    @balance -= 1
  end
  
end
