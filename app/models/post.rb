class Post < ApplicationRecord
    belongs_to :user

    has_many_attached :images
    validates :title, presence: true
    validates :body, presence: true
    validate :image_type

    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }

    def thumbnail input
        self.images[input].variant(resize: '350x300!').processed
    end

    private

    def image_type
        if images.attached? == false
            errors.add(:images, "are missing")            
        end

        images.each do |image|
            if !image.content_type.in?(%('image/png image/jpeg'))
                errors.add(:images, "image must have type of: .jpeg, .png")
            end
        end
    end
end
