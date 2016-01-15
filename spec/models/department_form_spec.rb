require 'spec_helper'

describe DepartmentForm do
  describe 'validations' do
    describe 'unofficial_transcript' do
      it { should_not accept_values_for(:unofficial_transcript, nil) }
    end

    describe 'change_employer' do
      it { should_not accept_values_for(:change_employer, nil) }
      it { should_not accept_values_for(:change_employer, 'yes') }
      it { should_not accept_values_for(:change_employer, 'No') }

      it { should accept_values_for(:change_employer, 'YES') }
      it { should accept_values_for(:change_employer, 'NO') }
    end

    describe 'ucm_gpa' do
      it { should_not accept_values_for(:ucm_gpa, nil) }
      it { should_not accept_values_for(:ucm_gpa, 'abc23') }
      it { should_not accept_values_for(:ucm_gpa, '4.00.0') }
      it { should_not accept_values_for(:ucm_gpa, '41.00') }

      it { should accept_values_for(:ucm_gpa, '1.30') }
      it { should accept_values_for(:ucm_gpa, '1.3') }
    end

    describe 'email_address' do
      it { should_not accept_values_for(:email_address, nil) }
      it { should_not accept_values_for(:email_address, 'invalid_email') }

      it { should accept_values_for(:email_address, 'test@ucmo.edu') }
    end

    describe 'student_name' do
      it { should_not accept_values_for(:student_name, nil) }
      it { should_not accept_values_for(:student_name, 'H' * 61) }

      it { should accept_values_for(:student_name, 'H' * 60) }
    end

    describe 'gender' do
      it { should_not accept_values_for(:gender, nil) }
      it { should_not accept_values_for(:gender, 'UNKNOWN') }

      it { should accept_values_for(:gender, 'MALE') }
      it { should accept_values_for(:gender, 'FEMALE') }
    end

    describe 'student_id' do
      it { should_not accept_values_for(:student_id, nil) }
      it { should_not accept_values_for(:student_id, '7000000000') }
      it { should_not accept_values_for(:student_id, '700-000-0000') }
      it { should_not accept_values_for(:student_id, '700-0000-000') }
      it { should_not accept_values_for(:student_id, '7000-000-000') }

      it { should accept_values_for(:student_id, '700000000') }
      it { should accept_values_for(:student_id, '700-000-000') }
    end

    describe 'student_address' do
      it { should_not accept_values_for(:student_address, nil) }
      it { should_not accept_values_for(:student_address, '1' * 151) }

      it { should accept_values_for(:student_address, 'Any Address') }
      it { should accept_values_for(:student_address, '1' * 150) }
    end

    describe 'phone_number' do
      it { should_not accept_values_for(:phone_number, nil) }
      it { should_not accept_values_for(:phone_number, 'No characters') }
      it { should_not accept_values_for(:phone_number, '18163-000-0000') }
      it { should_not accept_values_for(:phone_number, '816-0000000') }

      it { should accept_values_for(:phone_number, '1' * 30) }
      it { should accept_values_for(:phone_number, '816-663-2322') }
      it { should accept_values_for(:phone_number, '816-000-0000') }
      it { should accept_values_for(:phone_number, '1816-000-0000') }
    end

    describe 'credit_hours_when_conducted' do
      it { should_not accept_values_for(:credit_hours_when_conducted, nil) }
      it { should_not accept_values_for(:credit_hours_when_conducted, 'No characters') }
      it { should_not accept_values_for(:credit_hours_when_conducted, 100) }

      it { should accept_values_for(:credit_hours_when_conducted, '1') }
      it { should accept_values_for(:credit_hours_when_conducted, '10') }
    end

    describe 'company_name' do
      it { should_not accept_values_for(:company_name, nil) }
      it { should_not accept_values_for(:company_name, 'H' * 61) }

      it { should accept_values_for(:company_name, 'H' * 60) }
    end

    describe 'company_address' do
      it { should_not accept_values_for(:student_address, nil) }
      it { should_not accept_values_for(:student_address, '1' * 151) }

      it { should accept_values_for(:student_address, 'Any Address') }
      it { should accept_values_for(:student_address, '1' * 150) }
    end

    describe 'company_contact' do
      it { should_not accept_values_for(:company_name, nil) }
      it { should_not accept_values_for(:company_name, 'H' * 61) }

      it { should accept_values_for(:company_name, 'H' * 60) }
    end

    describe 'company_phone_number' do
      it { should_not accept_values_for(:company_phone_number, nil) }
      it { should_not accept_values_for(:company_phone_number, 'No characters') }
      it { should_not accept_values_for(:company_phone_number, '18163-000-0000') }
      it { should_not accept_values_for(:company_phone_number, '816-0000000') }

      it { should accept_values_for(:company_phone_number, '1' * 30) }
      it { should accept_values_for(:company_phone_number, '816-000-0000') }
      it { should accept_values_for(:company_phone_number, '1816-000-0000') }
    end

    describe 'company_duration_from' do
      it { should_not accept_values_for(:company_duration_from, nil) }

      it { should accept_values_for(:company_duration_from, '1' * 30) }
    end

    describe 'company_duration_to' do
      it { should_not accept_values_for(:company_duration_to, nil) }

      it { should accept_values_for(:company_duration_to, '1' * 30) }
    end

    describe 'internship_position' do
      it { should_not accept_values_for(:internship_position, nil) }
      it { should_not accept_values_for(:internship_position, 'H' * 61) }

      it { should accept_values_for(:internship_position, 'H' * 60) }
    end

    describe 'hourly_salary' do
      it { should_not accept_values_for(:hourly_salary, nil) }
      it { should_not accept_values_for(:hourly_salary, 'H' * 11) }

      it { should accept_values_for(:hourly_salary, '3' * 10) }
    end

    describe 'weekly_hours' do
      it { should_not accept_values_for(:weekly_hours, nil) }
      it { should_not accept_values_for(:weekly_hours, 111) }

      it { should accept_values_for(:weekly_hours, 1) }
      it { should accept_values_for(:weekly_hours, 11) }
    end
  end
end
