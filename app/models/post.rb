class Post < ApplicationRecord
  validates :title, :body, presence: true #проверка на не пустое значение
  belongs_to :user
  has_one_attached :image
end
