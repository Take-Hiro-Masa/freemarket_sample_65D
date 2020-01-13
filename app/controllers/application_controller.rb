class ApplicationController < ActionController::Base
    before_action :basic_auth
    before_action :configure_permitted_parameters, if: :devise_controller?, only: [:new, :create, :edit, :update]
  
    private
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'teamd' && password == 'mercari'
      end
    end

    protected
    def configure_permitted_parameters
      added_attrs = [ :nickname,
                      :family_name,
                      :first_name,
                      :family_name_kana,
                      :first_name_kana,
                      :birth_yyyy_id,
                      :birth_mm_id,
                      :birth_dd_id,
                      :phone_tel
                    ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
  
