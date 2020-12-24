class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save if @tag.valid?
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:code, :name)
  end
end
