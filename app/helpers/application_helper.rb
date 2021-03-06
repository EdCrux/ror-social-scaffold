module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def logged_in_buttons
    if current_user
      link_to('Sign out', destroy_user_session_path, method: :delete)
    else
      link_to 'Sign in', user_session_path
    end
  end

  def display_notices
    return unless notice.present?

    content_tag(:div, class: 'notice') do
      content_tag(:p, notice)
    end
  end

  def display_alerts
    return unless alert.present?

    content_tag(:div, class: 'alert') do
      content_tag(:p, alert)
    end
  end

  def invitation_action_links(user)
    if current_user == user
      content_tag(:span, 'Your profile')
    elsif current_user.friend?(user)
      content_tag(:span, 'Is your friend')
    elsif current_user.friend_requests?(user)
      link_to('Accept invitation', friendship_path(user), method: :patch) +
        content_tag(:span, ' | ') +
        link_to('Reject invitation', friendship_path(user), method: :delete)
    elsif current_user.pending_friends?(user)
      content_tag(:span, 'You already sent an invitation')
    else
      link_to 'Send friendship invitation', friendships_path(friend_id: user.id), method: :post
    end
  end
end
