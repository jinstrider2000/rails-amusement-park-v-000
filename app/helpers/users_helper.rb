module UsersHelper
  def is_admin?(user)
    user.admin
  end
end
