class UserController < ActionController::Base
  # This will raise an ActiveModel::ForbiddenAttributes exception because it's using mass assignment
  # without an explicit permit step.
  def create
    User.create(params[:user])
  end

  # This will pass with flying colors as long as there's a person key in the parameters, otherwise
  # it'll raise an ActionController::ParameterMissing exception, which will get caught by
  # ActionController::Base and turned into that 400 Bad Request reply.
  def update
    user = User.find(params[:id])
    user.update_attributes!(person_params)
    redirect_to user
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def user_params
      params.require(:user).permit(:firstName, :lastName)
    end
end
