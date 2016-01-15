class CreateDepartmentForms < ActiveRecord::Migration
  def change
    create_table :department_forms do |t|
      # identify form controls
      t.string :change_employer

      t.string :student_name
      t.string :gender

      t.string :student_id
      t.string :ucm_gpa
      
      t.string :student_address
      
      t.string :phone_number
      t.string :email_address
      
      t.integer :credit_hours_when_conducted, :limit => 4

      t.string :company_name
      
      t.string :company_address

      t.string :company_contact
      
      t.string :company_phone_number
      t.string :company_everify_number
      
      t.string :company_duration_from
      t.string   :company_duration_to
      
      t.string :internship_position
      
      t.text :job_responsibility
      
      t.string :hourly_salary
      
      t.string :weekly_hours

      t.timestamps null: false
    end
  end
end
