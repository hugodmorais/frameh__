class ContactsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      flash[:success] = "Contact was successfully created!"
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact was successfully updated!"
      redirect_to contact_path(@contact)
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    
    flash[:danger] = "Contact was successefully destroy"
    redirect_to contacts_path
  end

  private

    def set_contact
      @contact = current_user.contacts.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone)
    end
end
