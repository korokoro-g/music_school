module StudentsHelper
  def gravatar_url(student, options = { size: 80 })
  gravatar_id = Digest::MD5::hexdigest(student.email.downcase)
  size = options[:size]
  "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
end
