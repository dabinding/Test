$(function() {

    // With validation
    $(".form-validation").formwizard({
        disableUIStyles: true,
        validationEnabled: true,
        disableInputFields: false,
        inDuration: 150,
        outDuration: 150,
        validationOptions: {
            ignore: 'input[type=hidden]',
            errorClass: 'validation-error-label',
            successClass: 'validation-valid-label',
            highlight: function(element, errorClass) {
                $(element).removeClass(errorClass);
            },
            unhighlight: function(element, errorClass) {
                $(element).removeClass(errorClass);
            },
            errorPlacement: function(error, element) {
                if (element.parents('div').hasClass('checkbox') || element.parents('div').hasClass('is-radio')) {
                    error.appendTo( element.parent().parent().parent() );
                }
                else {
                    error.insertAfter(element);
                }
            },
            rules: {
            	'department_form[unofficial_transcript]': {
            		required: true
                },
            	'department_form[change_employer]': {
            		required: true
                },
            	'department_form[gender]': {
            		required: true
                },
            	'department_form[email_address]': {
            		required: true,
                    email: true
                },
	        	'department_form[ucm_gpa]': {
	        		required: true,
	        		minlength: 3,
	        		maxlength: 4
	            },
	        	'department_form[student_name]': {
	        		required: true,
	        		maxlength: 60
	            }
	        	'department_form[student_id]': {
	        		required: true,
	        		minlength: 9,
	        		maxlength: 11
	            },
	        	'department_form[student_address]': {
	        		required: true,
	        		maxlength: 150
	            },
	        	'department_form[phone_number]': {
	        		required: true,
	        		maxlength: 30
	            },
	        	'department_form[credit_hours_when_conducted]': {
	        		required: true,
	        		minlength: 1,
	        		maxlength: 2
	            },
	        	'department_form[company_name]': {
	        		required: true,
	        		maxlength: 60
	            },
	        	'department_form[company_address]': {
	        		required: true,
	        		maxlength: 150
	            },
	        	'department_form[company_contact]': {
	        		required: true,
	        		maxlength: 60
	            },
	        	'department_form[company_phone_number]': {
	        		required: true,
	        		maxlength: 30
	            },
	        	'department_form[company_everify_number]': {
	        		required: true,
	        		maxlength: 11
	            },
	        	'department_form[company_duration_from]': {
	        		required: true
	            },
	        	'department_form[company_duration_to]': {
	        		required: true
	            },
	        	'department_form[internship_position]': {
	        		required: true,
	        		maxlength: 60
	            },
	        	'department_form[hourly_salary]': {
	        		required: true
	            }
	        	'department_form[weekly_hours]': {
	        		required: true
	            }
            }
        }
    });


    // Initialize plugins
    // ------------------------------

    // Styled checkboxes and radios
    $('.styled').uniform({
        radioClass: 'choice'
    });


    // Styled file input
    $('.file-styled').uniform({
        wrapperClass: 'bg-danger',
        fileButtonHtml: '<i class="icon-googleplus5"></i>'
    });


    
});
