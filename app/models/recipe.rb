class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :cuisine
  belongs_to :user
  has_attached_file :photo


  validates :title, :cuisine, :difficulty, :cook_time,
            :ingredients, :cook_method, presence: true

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/, message: 'Tipo da imagem não é válido'

  def cook_time_min
    "#{cook_time} minutos"
  end
end