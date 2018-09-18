class Deal < ApplicationRecord
  has_many :posts
  has_many :issues
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :users
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :leads
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :mainpost
  has_and_belongs_to_many :maincomments
  has_and_belongs_to_many :address
  has_one_attached :image
  def average_ratings
   return 0 if posts.empty?
   posts.map{|p| p.rating}.inject(:+) / posts.size
 end

 def issue_count
  list = issues.map{|issue| issue.severity}
  counts = Hash.new(0)
    list.each {|issue| counts[issue] += 1}
  counts
 end

 def self.search(term)
    where('name LIKE ? ', "%#{term}%") if term.present?
  end

end
