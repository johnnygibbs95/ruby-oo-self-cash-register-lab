require 'pry'
class CashRegister

    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount    
        @all_items = []  
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @all_items << title.split(", ") * quantity
        @last_transaction = price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        @total -= @total * @discount / 100
        "After the discount, the total comes to $#{@total}."
    end

    def items
        @all_items.flatten
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end
