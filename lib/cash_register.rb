class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @last_transaction = 0
    quantity.times do
      @total += price
      @items << item
      @last_transaction += price
    end
  end

  def apply_discount
    if @discount > 0
      @total = (@total * (100 - @discount)) / 100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
