class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :content, Presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
