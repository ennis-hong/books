class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
  confirmation: true

  has_many :books
  has_many :comments

  has_many :like_books
  has_many :liked_books, through: :like_books, source: :book

  before_create :encrypt_password

  def own?(b)
    book_ids.include?(b.id)
  end

  def self.login(data)
    email = data[:email]
    password = do_encrypt(data[:password])
    find_by(email: , password: )
  end

  def self.do_encrypt(target)
    salted_password = "*xx#{target}yy-"
    Digest::SHA256.hexdigest(salted_password)
  end

  private

  def encrypt_password
    self.password = self.class.do_encrypt(self.password)
  end
end
