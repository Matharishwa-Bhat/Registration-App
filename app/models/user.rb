class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  store :address,accessors: [:address_line,:street, :landmark, :city, :state, :pin_code]

  has_one_attached :picture
end
