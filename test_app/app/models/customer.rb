class Customer < ApplicationRecord
  def full_name
    "Capitão #{name}"
  end
end
