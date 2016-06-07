class Review < ActiveRecord::Base
  validates :body, presence: true, length: { minimum: 10, maximum: 55}
  
  belongs_to :recipe
  belongs_to :chef
  
end
