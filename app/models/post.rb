class Post < ApplicationRecord
    validates :title,  presence: true, length: {maximum: 20}
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validates :memo, length:{maximum: 500} 
    validate :start_end_check

    def start_end_check
        if self.start_date == nil
            errors.add(:start_date,"は必須項目です")
        elsif
            self.finish_date == nil
            errors.add(:finish_date,"は必須項目です")
        elsif
            self.start_date > self.finish_date
            errors.add(:finish_date,"は開始日より前の日に設定出来ません")
        end
           
    end


   
end
