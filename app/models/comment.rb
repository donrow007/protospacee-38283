class Comment < ApplicationRecord
  belongs_to :user       # usersテーブルとのアソシエーション
  belongs_to :prototype  # prototypesテーブルとのアソシエーション
  validates :content, presence: true
end
