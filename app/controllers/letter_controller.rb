class LetterController < ApplicationController
  # On your controller.
  respond_to :docx
  
  def show
    # get DepartmentForm
    @form = DepartmentForm.find(params[:id])

    respond_to do |format|
      format.docx do
        render docx: 'letter', filename: 'letter.docx'
      end
    end
  end
end
