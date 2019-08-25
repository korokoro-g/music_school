module TeachersHelper
  def gravatar_url(teacher, options = { size: 80 })
  gravatar_id = Digest::MD5::hexdigest(teacher.email.downcase)
  size = options[:size]
  "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
end
