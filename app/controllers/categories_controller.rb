class CategoriesController < ApplicationController

  # http_basic_authenticate_with name: Setting.User_Name, password: Setting.Password, except: [:index, :show]
  before_action :logged_in_user, except: [:index, :show]

  # def redirect_to_category_which_url(category)
  #   case @category.category_type
  #   when "post"
  #   redirect_to category_posts_url(category)
  #   when "microblog"
  #   redirect_to category_microblogs_url(category)
  #   when "album"
  #   redirect_to category_albums_url(category)
  # else
  #   ##跳出处理
  # end
  # end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_url(@category)
    else
      render 'new'
    end
  end

  def show
    params[:id] = "#{Category.first.id}" if params[:id] == nil
    @category = Category.find(params[:id])
    @categories = Category.all #例外，只是为了show视图的最上面
    @albums = @category.albums.paginate(page: params[:page], per_page: Setting.Albums_Paginate)
    @posts = @category.posts.paginate(page: params[:page], per_page: Setting.Posts_Paginate)
    @microblogs = @category.microblogs.paginate(page: params[:page], per_page: Setting.Microblogs_Paginate)
  end

  def index
    @categories = Category.all
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def update
    @categories = Category.all
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_url(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_url
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :category_brief, :category_image, :category_type)
  end
end
