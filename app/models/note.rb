class Note < ApplicationRecord
  belongs_to :book, optional:true 	#MAL
end
