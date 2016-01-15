class FormController < ApplicationController
  before_filter :must_be_authenticated!, :only => [:index]

  def index
    @forms = DepartmentForm.all
  end
  
  def show
    @form = DepartmentForm.find_by(:id => params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = PdfForm.new(@form)
        send_data pdf.render, filename: 'form.pdf', type: 'application/pdf'
      end
    end
  end

  def new
    @form = DepartmentForm.new
  end

  def create
    @form = DepartmentForm.new(form_params)
    if @form.save
      flash[:success] = "Your form is on file and available for Ms. Taylor."
      redirect_to root_url
    else
      flash[:error] = 'An error has occurred. Please see below'
      flash[:errors] = @form.errors.messages
      render :new
    end
  end

  private
  def form_params
    permitted_attributes = DepartmentForm.attribute_names - ['id']
    permitted_attributes << 'unofficial_transcript'
    params.require(:department_form).permit(permitted_attributes)
  end

  def build_menu_indicator
    @page = 'Form'
    super
  end
end