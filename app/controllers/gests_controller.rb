class GestsController < ApplicationController
  def index
  end

  def new
    @gest = Gest.new
    # binding.pry
  end

  def create
    @gest = Gest.new(gest_params_new)
    change_num
    if @gest.valid?
      @gest.save
      gest_tags_save
      redirect_to gest_path(@gest.id)
    else
      render :new
    end
  end

  def show
    @gest = Gest.find(params[:id])
    @plan = Plan.find(@gest.plan_id)
    change_char

  end

  

  private

  def gest_params_new
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

  def gest_params_edit
    params.require(:gest).permit(
      :name1_kana, :name2_kana, :name3_kana, :memo, :company_kana, :company_kanji,
      :phone_number, :remark, :arr_date, :dep_date, :night, :adult, :child, :baby, :number_of_room, :sex_id, :rank_id, :room_type_id, :plan_id, :area_id
    ).merge(update_user_id: current_user.id)
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

    if @gest.child == nil
      @gest.child = 0
    end

    if @gest.baby == nil
      @gest.baby = 0
    end
  end

  def change_char
    unless @gest.sex_id == nil
      sex = Sex.where(id: @gest.sex_id)
      @gest.sex_id = sex[0].code
    end

    unless @gest.rank_id == nil
      rank = Rank.where(id: @gest.rank_id)
      @gest.rank_id = rank[0].code
    end

    room_type = RoomType.where(id: @gest.room_type_id)
    @gest.room_type_id = room_type[0].code

    plan = Plan.where(id: @gest.plan_id)
    @gest.plan_id = plan[0].code

    unless @gest.area_id == nil
      area = Area.where(id: @gest.area_id)
      @gest.area_id = area[0].code
    end
  end

end
