class Book < ApplicationRecord
   belongs_to :user
   has_one_attached :image

   def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
   end
end
