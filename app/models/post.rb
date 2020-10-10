class Post < ApplicationRecord
  validates :title, :body, presence: true #проверка на не пустое значение
end
