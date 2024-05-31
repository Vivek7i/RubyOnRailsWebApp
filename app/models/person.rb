class Person < ApplicationRecord
    has_many :cardz
    has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email" }
end
