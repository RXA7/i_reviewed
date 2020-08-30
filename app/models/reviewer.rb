class Reviewer < ApplicationRecord

	has_secure_password #MAL

	has_many :books 	#MAL
end
