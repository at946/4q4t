class Member < ApplicationRecord

  # Default order
  default_scope -> { order(:created_at) }

  # Associations
  belongs_to :team

  # Callbacks
  before_validation do
    delete_space(self.name)
    format_ans(self.ans_q1)
    format_ans(self.ans_q2)
    format_ans(self.ans_q3)
    format_ans(self.ans_q4)
  end

  before_save do
    delete_space(self.name)
  end

  before_create :set_uid

  # Validations
  validates :name, presence: true
  validates :ans_q1, length: { maximum: 3, too_long: 'is too large' }
  validates :ans_q2, length: { maximum: 3, too_long: 'is too large' }
  validates :ans_q3, length: { maximum: 3, too_long: 'is too large' }
  validates :ans_q4, length: { maximum: 3, too_long: 'is too large' }

  private
    # delete space & nil items
    def format_ans(array)
      array.reject!(&:blank?)
      array.each do |ans|
        delete_space(ans)
      end
    end

    # Create unique id
    def set_uid
      while self.uid.blank? || Member.find_by(uid: self.uid).present? do
        self.uid = SecureRandom.alphanumeric(20)
      end
    end

end
