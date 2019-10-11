class Team < ApplicationRecord

  before_save do
    delete_space(self.name)
  end

  before_create :set_uid

  validates :name, presence: true

  private
    def set_uid
      while self.uid.blank? || Team.find_by(uid: self.uid).present? do
        self.uid = SecureRandom.alphanumeric(20)
      end
    end

    def delete_space(string)
      string.gsub!(/(^[[:space:]]+)|([[:space:]]+$)/, '')
    end
end
