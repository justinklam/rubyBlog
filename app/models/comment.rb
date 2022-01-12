class Comment < ActiveRecord::Base
  # each comment belongs to one article
  belongs_to :article
end
