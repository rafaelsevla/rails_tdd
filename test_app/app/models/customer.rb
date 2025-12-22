class Customer < ApplicationRecord
  def full_name
    "Mr. #{name}"
  end
end
