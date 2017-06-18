class Superadmin < User
  def full_access?
    true
  end
end
