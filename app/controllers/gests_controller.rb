class GestsController < ApplicationController
  def index
  end

  def new
    @gest = Gest.new
  end

  def create
    # binding.pry
    @gest = Gest.new(gest_params)
    change_num
    if @gest.valid?
      @gest.save
      gest_tags_save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def gest_params
    params.require(:gest).permit(
      :name1_kana, :name2_kana, :name3_kana, :memo, :company_kana, :company_kanji,
      :phone_number, :remark, :arr_date, :dep_date, :night, :adult, :child, :baby, :number_of_room, :sex_id, :rank_id, :room_type_id, :plan_id, :area_id
    ).merge(user_id: current_user.id)
  end

  def gest_tags_save
    params.require(:gest_data_assign)[:code].each do |code|
      @tag = Tag.where(code: code).ids[0]
      GestTag.create(gest_id: @gest.id, tag_id: @tag)
    end
  end

  def change_num
    sex = Sex.where(code: @gest.sex_id)
    @gest.sex_id = sex.ids[0]

    rank = Rank.where(code: @gest.rank_id)
    @gest.rank_id = rank.ids[0]

    room_type = RoomType.where(code: @gest.room_type_id)
    @gest.room_type_id = room_type.ids[0]

    plan = Plan.where(code: @gest.plan_id)
    @gest.plan_id = plan.ids[0]

    area = Area.where(code: @gest.area_id)
    @gest.area_id = area.ids[0]
  end

end
