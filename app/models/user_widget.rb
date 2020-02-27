class UserWidget < ApplicationRecord
  extend Enumerize
  include UserWidgetPresenter

  # =======  Association ========
  belongs_to :user

  enumerize :kind, in: { visible: 0, hidden: 1 }, default: :visible, predicates: true, scope: true

  # Scopes

  scope :list, ->{
    eager_load(:user).where(kind: :visible)
  }

  scope :search, ->(text){
    list.where("user_widgets.name LIKE :search", { search: "%#{text}%"})
  }


end
