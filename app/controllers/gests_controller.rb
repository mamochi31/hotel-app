class GestsController < ApplicationController
  def index
  end

  def new
    @gest = Gest.new
  end

  def create
    @gest = Gest.new(gest_params)
    change_num_sex
    if @gest.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def gest_params
    params.require(:gest).permit(
      :name1_kana, :name1_kanji, :name2_kana, :name2_kanji, :name3_kana, :name3_kanji, :memo, :company_kana, :company_kanji,
      :phone_number, :remark, :arr_date, :dep_date, :night, :adult, :child, :baby, :number_of_room, :sex_id
    ).merge(user_id: current_user.id)
  end

  def change_num_sex
    sex = Sex.where(code: @gest.sex_id)
    @gest.sex_id = sex.ids[0]
  end
end
