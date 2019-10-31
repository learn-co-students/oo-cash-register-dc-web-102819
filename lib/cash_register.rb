require 'pry'

class CashRegister

attr_accessor :total, :discount, :items, :last_transaction

    def initialize(employee_discount=0)
        @total = 0
        @discount = employee_discount
        @items = []
        @last_transaction = {}
    end

    def log_recent_transaction(product, cost, quantity)
        self.last_transaction = {
            product: product,
            cost: cost,
            quantity: quantity
        }
    end

    def add_item(product, cost, quantity=1)
        quantity.times do
            self.total += cost
            self.items << product
        end
        log_recent_transaction(product, cost, quantity)
    end

    def apply_discount
        if discount > 0
            self.total -= total * (discount.to_f/100)
            "After the discount, the total comes to $#{total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        items.pop(last_transaction[:quantity])
        self.total -= last_transaction[:cost] * last_transaction[:quantity]
        self.last_transaction = {}
        total
    end

end
