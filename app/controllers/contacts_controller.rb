class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :create, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def new
    @contact = current_user.contacts.build
  end

  def edit
  end

  def create
    @contact = current_user.contacts.build(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
      
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def correct_user
      @contact = current_user.contacts.find_by(id: params[:id])
      redirect_to contacts_path, notice: "Not authorized to edit this contact." if @contact.nil?
    end

    def contact_params
      params.require(:contact).permit(:name, :company, :position, :phone, :email)
    end
end
