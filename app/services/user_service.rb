class UserService
  def initialize(email)
    @email = email
  end

  def user_profile
    HTTParty.get('https://demo.com/profile', query: { user: @email }, headers: { 'Content-Type': 'application/json' })
    # return
    # { status: 200, parsed_resp: { name: 'willy', age: 18 } }
  end

  def add_new_user
    HTTParty.post('https://demo.com/new_user', body: { user: @user }, headers: { 'Content-Type': 'application/json' })
    # return
    # { status: 'ok' }
  end
end