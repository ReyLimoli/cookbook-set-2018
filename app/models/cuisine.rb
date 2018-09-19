class Cuisine < ApplicationRecord
  validates :name, presence: { message: 'Você deve informar o campo Nome'}
  validates :name, uniqueness: {message: 'Esta cozinha já foi cadastrada.'} 
  has_many :recipes
end
