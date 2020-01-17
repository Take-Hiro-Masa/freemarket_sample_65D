class MypageController < ApplicationController
  before_action :full_name, only:[:identification]
  before_action :set_birth, only:[:identification]
  def index
  end

  def logout
  end

  def identification
  end

  private


  # ログインユーザーのフルネーム
  def full_name
    @full_name = current_user.family_name + current_user.first_name
  end

  # ログインユーザーの誕生日
  def set_birth
    @birthday = "#{current_user.birth_yyyy.year}年  #{current_user.birth_mm.month}月  #{current_user.birth_dd.day}日"
  end
end
