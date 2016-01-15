class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || 'is not an email address. Try the format of sample@address.com.')
    end
  end
end

class GpaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^\d{1}\.\d{1,2}$/
      record.errors[attribute] << (options[:message] || 'is not a valid GPA. Try these formats: 3.7, or 3.70.')
    end
  end
end

class StudentIdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value

    message = 'is not a valid 700 #. Try these formats: 700-000-0000 or 7000000000'
    if value.include? '-'
      unless value =~ /^\d{3}(-\d{3}){2}$/
        record.errors[attribute] << (options[:message] || message)
      end
    else
      unless value =~ /^\d{9}$/
        record.errors[attribute] << (options[:message] || message)
      end
    end
  end
end

class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value

    message = 'is not a valid phone number. Try these formats: 1816-000-0000, 816-000-0000 or 8160000000'
    if value.include? '-'
      unless value =~ /^\d{3,4}-\d{3}-\d{4}$/
        record.errors[attribute] << (options[:message] || message)
      end
    else
      unless value =~ /^\d{10,30}$/
        record.errors[attribute] << (options[:message] || message)
      end
    end
  end
end

class DepartmentForm < ActiveRecord::Base
  has_attached_file :unofficial_transcript
  validates_attachment_content_type :unofficial_transcript, content_type: ['image/jpeg', 'image/png', 'image/gif','image/tiff', 'application/pdf'] 
  validates_attachment_file_name :unofficial_transcript, matches: [/png\Z/, /jpeg\Z/, /jpg\Z/,/tif\Z/, /pdf\Z/]
  
  validates :unofficial_transcript, presence: true
  
  validates :change_employer, presence: true, inclusion: { in: %w(YES NO),
                                                           message: "%{value} is not a valid YES/NO answer." }

  validates :email_address, presence: true, email: true
  
  validates :ucm_gpa, presence: true, numericality: true, length: { maximum: 4 }, gpa: true
  
  validates :student_name, presence: true, length: { maximum: 60 }

  validates :gender, presence: true, inclusion: { in: %w(MALE FEMALE),
                                                           message: "%{value} is not a valid MALE/FEMALE answer." }

  validates :student_id, presence: true, length: { minimum: 9, maximum: 11 }, student_id: true
  
  validates :student_address, presence: true, length: { maximum: 150 }
  
  validates :phone_number, presence: true, length: { maximum: 30 }, phone_number: true
  
  validates :credit_hours_when_conducted, presence: true, length: { minimum: 1, maximum: 2 }, numericality: true
  
  validates :company_name, presence: true, length: { maximum: 60 }
  
  validates :company_address, presence: true, length: { maximum: 150 }
  
  validates :company_contact, presence: true, length: { maximum: 60 }
  
  validates :company_phone_number, presence: true, length: { maximum: 30 }, phone_number: true
  
  validates :company_everify_number, presence: true, length: { maximum: 11 }
  
  validates :company_duration_from, presence: true
  
  validates :company_duration_to, presence: true
  
  validates :internship_position, presence: true, length: { maximum: 60 }
  
  validates :hourly_salary, presence: true, length: { maximum: 10 }
  
  validates :weekly_hours, presence: true, length: { minimum: 1, maximum: 2}, numericality: true
end
