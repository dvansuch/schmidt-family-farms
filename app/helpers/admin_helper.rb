module AdminHelper
  def self.fullname
    "#{first_name} #{last_name}".html_safe
  end
end
