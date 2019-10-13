class Member < ApplicationRecord

  # Associations
  belongs_to :team

  # Rollbacks
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

  # Validations
  validates :name, presence: true
  validates :ans_q1, length: { maximum: 3, too_long: 'is too large' }
  validates :ans_q2, length: { maximum: 3, too_long: 'is too large' }
  validates :ans_q3, length: { maximum: 3, too_long: 'is too large' }
  validates :ans_q4, length: { maximum: 3, too_long: 'is too large' }

  private
    def format_ans(array)
      array.reject!(&:blank?)
      array.each do |ans|
        delete_space(ans)
      end
    end

end
