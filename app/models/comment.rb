class Comment < ApplicationRecord
   has_and_belongs_to_many :posts
   has_and_belongs_to_many :users
   has_and_belongs_to_many :mainposts

end
