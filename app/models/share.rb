class Share < ApplicationRecord
  belongs_to :profile, dependent: :destroy
  belongs_to :post, dependent: :destroy
end
