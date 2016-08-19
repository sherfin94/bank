class Payment < ApplicationRecord
  belongs_to :loan, optional: true
end
