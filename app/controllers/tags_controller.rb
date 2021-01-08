class TagsController < ApplicationController
  before_action :search_tag, only: [:index, :search]
  before_action :tag_find, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all
    render template: 'tags/search'
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.valid?
      @tag.save 
      redirect_to new_tag_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @tag.update(tag_params)
      redirect_to tag_path(@tag.id)
    else
      render :show
    end
  end

  def destroy
    if @tag.destroy
      render template: 'success'
    else
      render :show
    end
  end

  def search
    @tags = @q.result
  end

  private

  def tag_params
    params.require(:tag).permit(:code, :name)
  end

  def tag_find
    @tag = Tag.find(params[:id])
  end

  def search_tag
    @q = Tag.ransack(params[:q])
  end
end
