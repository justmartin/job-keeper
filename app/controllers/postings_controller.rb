class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :create, :edit, :update, :destroy]

  def index
    @postings = Posting.all
  end

  def show
  end

  def new
    @posting = current_user.postings.build
  end

  def edit
  end

  def create
    @posting = current_user.postings.build(posting_params)

    if @posting.save
      redirect_to @posting, notice: 'Posting was successfully created.'
    else
      render :new
    end
  end

  def update
    if @posting.update(posting_params)
      redirect_to @posting, notice: 'Posting was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @posting.destroy

    redirect_to postings_url, notice: 'Posting was successfully destroyed.'
  end

  private
    def set_posting
      @posting = Posting.find(params[:id])
    end

    def correct_user
      @posting = current_user.postings.find_by(id: params[:id])
      redirect_to postings_path, notice: "Not authorized to edit this posting." if @posting.nil? 
    end

    def posting_params
      params.require(:posting).permit(:company, :position, :date)
    end
end
