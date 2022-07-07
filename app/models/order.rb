class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    enum payment_method: {credit_card: 0, transfer: 1 }
    enum status: { waiting_payment: 0, payment_confirmation: 1, under_prodction: 2, preparing_ship: 3, shipped: 4 }
    
    
    def address_display
        '〒' + postal_code + ' ' + address + ' ' + name
    end
  
end
