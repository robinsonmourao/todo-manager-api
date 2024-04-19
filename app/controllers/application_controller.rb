class ApplicationController < ActionController::Base
  include LoggerHelper

  helper_method :current_user

  SESSION_EXPIRATION_TIME = 30.minutes

  private

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_task
    @task ||= Task.find_by(id: params[:id])
  end

  def current_session
    @session ||= Session.find_by(id: params[:id])
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
    expiration = db_session.created_at + SESSION_EXPIRATION_TIME
    db_session[:expires_at] = expiration
    session_created_at = db_session.expires_at
    db_session.save
  end

  def check_previous_sessions(user)
    if user
      db_session = Session.find_by(user_id: user.id, active: 1)
      return unless db_session

      db_session[:active] = 0
      db_session.save

      check_expired_sessions
    end
  end

  def check_expired_sessions
    active_sessions = Session.where(active: 1)

    return unless active_sessions.any?

    active_sessions.each do |temp_session|
      unless temp_session.expires_at > Time.now

        session[:user_id] = nil
        temp_session[:active] = 0
        temp_session.save

        redirect_to root_path, notice: 'Sua sessão expirou! Faça login novamente para ter acesso a tarefas.'
      end
    end
  end
end
