class CashRegister

attr_accessor :total, :discount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
    end

  def add_item(title, price, quantity = 1)
    @total = @total + price * quantity
    @items.concat([title]*quantity)
    @transactions.push((price*quantity).to_f)
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      @total = @total.to_f * (1-(@discount.to_f/100))
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop()
    @total = @total - (@transactions.pop())
  end

end
