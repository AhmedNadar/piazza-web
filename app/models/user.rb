class User < ApplicationRecord
  validates :name, presence: true
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    uniqueness: { case_sensitive: false }

    has_many :memberships, dependent: :destroy
    has_many :organizations, through: :memberships
    has_secure_password

    before_validation :strip_extraneous_spaces

    validates :password,
    presence: true, length: { minimum: 8 }

    private

    def strip_extraneous_spaces
      self.name = self.name&.strip
      self.email = self.email&.strip
    end
end
