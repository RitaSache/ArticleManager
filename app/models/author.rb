class Author < ApplicationRecord
	has_many :articles, dependent: :destroy
	validates :name, presence: true,
                    length: { minimum: 2}
end
