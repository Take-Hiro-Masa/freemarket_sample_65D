class SignupController < ApplicationController
  def index
    @user = User.new
  end

  def step2
    @user = User.new
  end

  def step3
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_yyyy_id] = user_params[:birth_yyyy_id]
    session[:birth_mm_id] = user_params[:birth_mm_id]
    session[:birth_dd_id] = user_params[:birth_dd_id]
    @user = User.new
  end

  def step4
    session[:phone_tel] = user_params[:phone_tel]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_yyyy_id: session[:birth_yyyy_id],
      birth_mm_id: session[:birth_mm_id],
      birth_dd_id: session[:birth_dd_id],
      phone_tel: session[:phone_tel],
      postal_code: user_params[:postal_code],
      prefecture_id: user_params[:prefecture_id],
      city: user_params[:city],
      block: user_params[:block],
      building: user_params[:building],
      building_tel: user_params[:building_tel],
      )
  end

  def create
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    session[:building_tel] = user_params[:building_tel]
    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    family_name: session[:family_name],
    first_name: session[:first_name],
    family_name_kana: session[:family_name_kana],
    first_name_kana: session[:first_name_kana],
    birth_yyyy_id: session[:birth_yyyy_id],
    birth_mm_id: session[:birth_mm_id],
    birth_dd_id: session[:birth_dd_id],
    phone_tel: session[:phone_tel],
    postal_code: user_params[:postal_code],
    prefecture_id: user_params[:prefecture_id],
    city: user_params[:city],
    block: user_params[:block],
    building: user_params[:building],
    building_tel: user_params[:building_tel],
    )
    

    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id])
      redirect_to new_card_path
    else
      render 'step2'
    end
  end

  def step5
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:block] = user_params[:block]
    session[:building] = user_params[:building]
    session[:building_tel] = user_params[:building_tel]
    @user = User.new
  end

  def step6
    sign_in User.find(session[:id]) unless user_signed_in?
  end

private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birth_yyyy_id,
      :birth_mm_id,
      :birth_dd_id,
      :phone_tel,
      :postal_code,
      :prefecture_id,
      :city,
      :block,
      :building,
      :building_tel
    )
  end

end
