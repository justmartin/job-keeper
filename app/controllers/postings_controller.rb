class PostingsController < ApplicationController
  before_action :set_posting, only: [:show, :edit, :update, :destroy]

  def index
    @postings = Posting.all
  end

  def show
  end

  def new
    @posting = Posting.new
  end

  def edit
  end

  def create
    @posting = Posting.new(posting_params)

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

    def posting_params
      params.require(:posting).permit(:company, :position, :date)
    end
end