class UserWidget < ApplicationRecord
  extend Enumerize

  # =======  Association ========
  belongs_to :user

  enumerize :kind, in: { visible: 0, hidden: 1 }, default: :visible, predicates: true, scope: true

  # Scopes
  scope :search, ->(text){
    where("name LIKE :search", { search: "%#{text.downcase}%"})
  }

end
