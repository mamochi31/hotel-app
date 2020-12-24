class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to tags_path
    else
      redirect_to tags_path
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:code, :name)
  end
end