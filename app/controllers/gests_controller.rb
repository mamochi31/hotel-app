class GestsController < ApplicationController
  def index
  end

  def new
    @gest = Gest.new
  end

  def create
    binding.pry
    @gest = Gest.new(gest_params)
    change_num
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
      :phone_number, :remark, :arr_date, :dep_date, :night, :adult, :child, :baby, :number_of_room, :sex_id, :rank_id
    ).merge(user_id: current_user.id)
  end

  def change_num
    sex = Sex.where(code: @gest.sex_id)
    @gest.sex_id = sex.ids[0]

    rank = Rank.where(code: @gest.rank_id)
    @gest.rank_id = rank.ids[0]
  end
end
