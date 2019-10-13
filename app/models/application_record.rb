class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
    def delete_space(string)
      string.gsub!(/(^[[:space:]]+)|([[:space:]]+$)/, '')
    end
end
