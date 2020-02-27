module UserWidgetPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
      t.add :description
      t.add :kind
      t.add :user, template: :base
      t.add :created_at
      t.add :updated_at
    end

  end



end

