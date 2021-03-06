class Article < ApplicationRecord
  	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 1 }

    has_many :tag_references, dependent: :destroy
    has_many :tags, through: :tag_references
    belongs_to :author
end
