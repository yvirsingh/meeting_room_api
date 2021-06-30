class Meeting < ApplicationRecord
	enum status: [:MEETING, :OFFLINE, :BUSY, :CANCEL]
	has_many :members, dependent: :destroy
	has_many :users, :through => :members
	accept_nested_attributes_for :members
end
