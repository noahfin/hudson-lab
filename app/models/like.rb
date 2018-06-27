class Like < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :mainposts
    has_and_belongs_to_many :deals
end
