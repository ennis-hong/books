class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user

  has_many :comments, ->{ order(id: :desc) }
  has_many :like_books
  has_many :liked_user, through: :like_books, source: :user

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end
end
