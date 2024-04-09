class ApplicationController < ActionController::Base
  include LoggerHelper

  helper_method :current_user, :current_session

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def store_session(user)
    associate_currentuser_to_session(user)

    db_session = Session.new
    db_session.active = true
    db_session[:user_id] = user.id
    db_session[:token] = "#{user.id} #{user.username} #{user.email} #{user.password_digest}"
    db_session.save

    store_session_remaning_time(db_session)
  end

  def associate_currentuser_to_session(user)
    session[:user_id] = user.id
  end

  def store_session_remaning_time(db_session)
    expiration = db_session.created_at + 1.minutes
    db_session[:expires_at] = expiration
    db_session.save
  end
end
