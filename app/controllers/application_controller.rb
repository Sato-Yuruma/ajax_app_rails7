class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      puts "入力ユーザー名: #{username.inspect}"
      puts "環境変数ユーザー名: #{ENV['BASIC_AUTH_USER'].inspect}"
      puts "入力パスワード: #{password.inspect}"
      puts "環境変数パスワード: #{ENV['BASIC_AUTH_PASSWORD'].inspect}"

      username == ENV["BASIC_AUTH_USER"] &&
        password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end