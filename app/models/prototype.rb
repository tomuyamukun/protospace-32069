class Prototype < ApplicationRecord
  belongs_to :user
  #画像ファイルを紐付ける
  has_one_attached :image
  #バリデーション設定
  validates :image, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  has_many :comments, dependent: :destroy
end
