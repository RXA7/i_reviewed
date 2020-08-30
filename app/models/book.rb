class Book < ApplicationRecord
  belongs_to :reviewer, optional:true 	#MAL
  has_many :notes, dependent: :destroy
end
