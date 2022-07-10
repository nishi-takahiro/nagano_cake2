class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    
    enum making_status: { work_wrong: 0, work_wait: 1, work_middle: 2, work_completion: 3 }
end