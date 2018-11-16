class Cat < ApplicationRecord
  belongs_to :breed
  belongs_to :user
end
