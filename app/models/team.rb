class Team < ApplicationRecord

  # Default order
  default_scope -> { order(:created_at) }

  # Accosication
  has_many :members, dependent: :destroy

  # Callbacks
  before_validation do
    delete_space(self.name)
  end

  before_create :set_uid

  # Validations
  validates :name, presence: true

  private
    # Create unique id
    def set_uid
      while self.uid.blank? || Team.find_by(uid: self.uid).present? do
        self.uid = SecureRandom.alphanumeric(20)
      end
    end
end
