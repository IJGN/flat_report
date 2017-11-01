class MesController < ApplicationController
  before_action :set_me, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @me.update(me_params)
        format.html { redirect_to me_path, notice: 'Me was successfully updated.' }
        format.json { render :show, status: :ok, location: @me }
      else
        format.html { render :edit }
        format.json { render json: @me.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_me
    @me = current_user
  end

  def me_params
    params.require(:user).permit(:username, :first_name, :last_name, :email)
  end
end
