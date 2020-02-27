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

      resources :users do
        resources :widgets, only: [:index], controller: 'users/widgets' do
          collection do
            get :me
          end
        end
      end

      resources :widgets do
        collection do
          get :visible
        end
      end
    end
  end

end
