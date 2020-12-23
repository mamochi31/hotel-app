class GestsController < ApplicationController
  before_action :gest_params, only: [:create, :update]
  before_action :gest_find, only: [:show, :update, :destroy]
  before_action :plan_find, only: [:show, :update]

  def index
  end

  def new
    @gest = Gest.new
  end

  def create
    change_num
    @gest = Gest.new(gest_params_new)
    if @gest.valid?
      @gest.save
      gest_tags_save
      redirect_to gest_path(@gest.id)
    else
      render :new
    end
  end

  def show
    change_char
    tags_create
  end

  def edit
  end

  def update
    change_num
    if @gest.update(gest_params_edit)
      gest_tags_update
      redirect_to gest_path(@gest.id)
    else
      render :show
    end
  end

  def destroy
    @gest.destroy
    redirect_to root_path
  end

  private

  def gest_find
    @gest = Gest.find(params[:id])
  end

  def plan_find
    @plan = Plan.find(@gest.plan_id)
  end

  def gest_params
    gest_params = params.require(:gest)
  end
  
  def gest_params_permit
    gest_params_permit = gest_params.permit(
      :name1_kana, :name2_kana, :name3_kana, :memo, :company_kana, :company_kanji,
      :phone_number, :remark, :arr_date, :dep_date, :night, :adult, :child, :baby, :number_of_room, :sex_id, :rank_id, :room_type_id, :plan_id, :area_id
    )
  end

  def gest_params_new
    gest_params_permit.merge(user_id: current_user.id)
  end

  def gest_params_edit
    gest_params_permit.merge(update_user_id: current_user.id)
  end

  def gest_tag_params_code
    gest_tag_params_code = params.require(:gest_tag)[:code]
  end

  def gest_tags_save
    gest_tag_params_code.each do |code|
      tag = Tag.where(code: code).ids[0]
      GestTag.create(gest_id: @gest.id, tag_id: tag)
    end
  end

  def gest_tags_update
    @gest_tags = @gest.gest_tags
    @tags = []
    gest_tag_params_code.each do |code|
      @tags << Tag.where(code: code).ids[0]
    end
    count = 0
    @tags.each do |tag|
      if @gest_tags[count] != nil && tag != nil
        @gest_tags[count].update(gest_id: @gest.id, tag_id: tag)
      elsif @gest_tags[count] != nil && tag == nil
        @gest_tags[count].destroy
      else
        @gest_tags.create(gest_id: @gest.id, tag_id: tag)
      end
      count += 1
    end
  end

  def change_zero(column)
    if gest_params[column] == ""
      gest_params[column] = 0
    end
  end

  def change_num
    sex = Sex.where(code: gest_params[:sex_id])
    gest_params[:sex_id] = sex.ids[0]

    rank = Rank.where(code: gest_params[:rank_id])
    gest_params[:rank_id] = rank.ids[0]

    room_type = RoomType.where(code: gest_params[:room_type_id])
    gest_params[:room_type_id] = room_type.ids[0]

    plan = Plan.where(code: gest_params[:plan_id])
    gest_params[:plan_id] = plan.ids[0]

    area = Area.where(code: gest_params[:area_id])
    gest_params[:area_id] = area.ids[0]

    change_zero(:child)
    change_zero(:baby)
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

  def tags_create
    gest_tags = @gest.tags.ids
    @tags = [] 
    gest_tags.each do |gest_tag|
      tag = Tag.where(id: gest_tag)
      @tags << tag[0].code
    end
  end
end