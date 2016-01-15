class PdfForm < Prawn::Document
  def initialize(form)
    super()
    @form = form
    text_content
  end

  def text_content
    move_down 5
    text 'Internship Form', style: :bold, size: 25
  
    bounding_box([0,cursor], width: bounds.width, height: bounds.height) do
      fill_color  "DCDCDC"
      fill_rectangle [0, cursor], bounds.right, bounds.top
      fill_color  "000000"
      transparent(0.5) { stroke_bounds }
      
      move_down 10

      form_fields = {}
      f = @form
      DepartmentForm.attribute_names.each do |attr|
        form_fields.merge!({attr => f.send(attr).to_s})
      end
      
      form(self, form_fields)
    end
  end

  def form(pdf, fields)
    pdf.float do      
      pdf.bounding_box([5, pdf.cursor], width: 250, height: 700) do
        fields.keys.each do |label|
          pdf.pad(5) { pdf.text label }
        end
      end
    end
  
    pdf.bounding_box([260, pdf.cursor], width: 250, height: 700) do
      pdf.stroke_color "000000"
      fields.values.each do |value|
        pdf.fill_color  "ffffff"
        pdf.fill_and_stroke_rectangle([5, pdf.cursor], 240, 18) 
        fill_color  "000000"
        pdf.text_box value, at: [10, pdf.cursor - 5]
        pdf.move_down 24
      end
    end      
  end
end