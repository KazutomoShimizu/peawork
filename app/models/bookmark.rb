class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates_uniqueness_of :blog_id, scope: :user_id
  validates :user_id, uniqueness: { scope: :blog_id}
end
