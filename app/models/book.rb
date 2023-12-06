class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :user

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.current)
  end
end
