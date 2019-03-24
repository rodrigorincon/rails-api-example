module PunditAuthorizable
  extend ActiveSupport::Concern
  include Pundit

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index
  end

  private

  def user_not_authorized
    render json: {errors: [I18n.t('authorization.default.unauthorized')]}, status: :forbidden
  end

  def pundit_user 
    # Esse método será utilizado enquanto não houver um responsável por settar a sessão do usuário. 
    {name: "ususario anonimo"}
  end

end