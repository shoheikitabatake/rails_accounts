class CustomFailure < Devise::FailureApp
  protected
  def redirect_url
#      root_path #rootに飛ばす場合
#      root_path+"users/auth/facebook" #自動でfacebook認証させる場合
      root_path+"users/sign_in"
  end
end
