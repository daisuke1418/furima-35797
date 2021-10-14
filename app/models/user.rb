class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角(平仮名,カタカナ,漢字)文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶ一]+\z/, message: '全角(カタカナ)を使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角の英字と数字の両方を含めて設定してください'

  has_many :items
  has_many :orders
end
