Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications,
                     :authorized_applications
  end

  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1, path: 'v1'  do
      devise_for :users, controllers: {
          registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]

      resources :widgets do
        collection do
          get :visible
        end
      end
    end
  end

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
