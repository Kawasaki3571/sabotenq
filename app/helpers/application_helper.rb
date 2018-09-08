module ApplicationHelper
  def avatar_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large" # facebookの画像があった場合
    else
      # 代替の何かを返す
    end
  end
end
