class Deal < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :users
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :tasks
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
