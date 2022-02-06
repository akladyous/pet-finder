Rails.application.routes.draw do
    
    resources :users, only: [:create] do
        collection do
            get :profile, to: "users#show"
            post :login, to: "sessions#create"
            delete :logout, to: "sessions#destroy"
        end
    end
    scope :api do
        
        # resources :pets, only: [:create] do
        #     collection do
        #         get :profile, to: "pets#show"
        #         patch :profile, to: "pets#update"
        #         delete :profile, to: "pets#destroy"
        #     end
        # end
        resources :pets, except: :index do
            collection do
                patch 'image', to: 'pets#upload'
                get 'image', to: 'pets#download'
            end
        end


        # resources :listing_infos, except: [:create] do
        #     collection do
        #         post 'pet/:pet_id', to: "listing_infos#create"
        #     end
        #     resource :listings, except: :destroy
        # end

        resources :listing_infos do
            collection do
                get 'public', to: "listing_infos#public"
                post 'public', to: "listing_infos#new_listing"
            end
        end

        resources :listings, except: [:index, :destroy]
        resources :listing_addresses, except: [:index, :destroy]



        # resources :listing_requests, only: [:create] do 
        # end
        resources :listing_requests


    end

end
