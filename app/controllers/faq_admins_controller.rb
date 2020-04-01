# frozen_string_literal: true

class FaqAdminsController < AdminController
  def index
    @faqs = Faq.order(:position)
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)

    if @faq.save
      redirect_to faq_admins_path,  flash: { notice: "Faq has been created." }
    else
      flash.now[:alert] = @category.errors.full_messages
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])

    if @faq.update(faq_params)
      redirect_to faq_admins_path,  flash: { notice: "Faq has been updated." }
    else
      flash.now[:alert] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    if @faq.destroy
      flash.now[:notice] = "Faq has been deleted."
    else
      flash.now[:alert] = @category.errors.full_messages
    end

    redirect_to faq_admins_path
  end

  private
    def faq_params
      params.require(:faq).permit(:id, :question_km, :question_en, :answer_km, :answer_en)
    end
end
