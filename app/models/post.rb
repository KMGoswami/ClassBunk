class Post < ApplicationRecord

   belongs_to :user
   has_many_attached :images
   validates :title, presence: true
   validates :description, presence: true
   #validate :image_type

   def thumbnail input
     return self.images[input].variant(resize: '300x300').processed
   end

#   private
#   def image_type
#      if images.attached? == false
#          puts "Images are missing.....!!!!"
#          errors.add(:images,"are missing!")
#      end
#   end
end
