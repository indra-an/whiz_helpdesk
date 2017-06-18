class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :by_keyword, ->(keyword) {
    where(["LOWER(email) LIKE :keyword OR LOWER(first_name) LIKE :keyword OR
                   LOWER(last_name) LIKE :keyword ", { keyword: "%#{keyword.downcase}%" }]) if keyword.present?
  }

   def full_access?
      false
   end

  def role_name
    type.tableize.singularize.titleize
  end

  def is_operator?
    type == "Operator"
  end

  def is_engineer?
    type == "Engineer"
  end
end
