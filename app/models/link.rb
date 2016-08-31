class Link < ApplicationRecord
	is_impressionable
	validates :url, :presence => {:message => "cannot be blank"}, length: {minimum: 5}
	validates :title, length: {minimum: 4}, uniqueness: true #on: :update(we used this to validate uniqueness only during update)
	belongs_to :user
	acts_as_votable
	has_many :comments
	resourcify

end
