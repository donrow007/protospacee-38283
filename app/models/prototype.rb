class Prototype < ApplicationRecord
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  

  belongs_to :user
  has_many :comments, dependent: :destroy  # commentsテーブルとのアソシエーション
  has_one_attached :image, dependent: :destroy
end
