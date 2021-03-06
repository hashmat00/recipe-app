class Recipe < ActiveRecord::Base
    belongs_to :chef
    has_many :reviews, dependent: :destroy
    has_many :like, dependent: :destroy
    has_many :recipe_styles, dependent: :destroy
    has_many :styles, through: :recipe_styles
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :chef_id, presence: true
    validates :name, presence: true, length: { minimum: 3, maximum: 50}
   validates :summary, presence: true, length: {minimum: 10, maximum: 250}
   validates :description, presence: true, length: {minimum: 20, maximum: 1000}
   mount_uploader :picture, PictureUploader
   validate :picture_size
   default_scope -> { order(created_at: :desc) }
   
   
  def thumbs_up_total
      self.like.where(like: true).size
  end
  
  def thumbs_down_total
      self.like.where(like: false).size
  end
  
  
   
   private
   def picture_size
      if picture.size > 5.megabytes
          errors.add(:picture, "Should be less than 5MB")
      end
   end
    
    
    
end