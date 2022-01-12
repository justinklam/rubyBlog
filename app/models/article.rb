class Article < ActiveRecord::Base
  # association, and destroy dependent on delete of comments
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end