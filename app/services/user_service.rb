class UserService
  def initialize(user)
    @user = user
  end

  def user_profile
    HTTParty.get('www.test.com/profile', query: { user: @user })
  end

  def add_new_user
    resp = HTTParty.get('www.test.com/new', body: { user: @user })
  end
end