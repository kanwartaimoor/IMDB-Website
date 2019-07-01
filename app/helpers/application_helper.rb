module ApplicationHelper
def header(text)
  content_for(:header) { text.to_s }
end

def user_avatar(user, size=40)
	if user.avatar.attached?
		user.avatar.variant(resize: "#{size}x#{size}!")
	else
		gravatar_image_url(user.email, size:size)
	end
end

end
