class User < ApplicationRecord
	has_many :members
	has_many :meetings, :through => :members
end
