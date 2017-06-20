class Document < ActiveRecord::Base
  scope :with_error, -> { where(status: :error) }
  scope :with_success, -> { where(status: :success) }
end
