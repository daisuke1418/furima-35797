class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :leadtime

  with_options numericality: { other_than: 1 , messages: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :lead_time_id
  end
  with_options presence: true do
    validates :title
    validates :explanation
    validates :price
  end

  def was_attached?
    self.image.attached?
  end

  belongs_to :user
  has_one_attached :image

end
