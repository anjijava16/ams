var FormValidation = function () {

    var handleValidation1 = function() {
        // for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            var form1 = $('#form_sample_1');
            var error1 = $('.alert-error', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                	cus_name: {
                        minlength: 1,
                        required: true,
                        isChinese: true
                    },
                    tel: {
                    	required: true,
                    	isMobile: true
                    },
                    email: {
                        email: true
                    },
                    id_num: {
                        number: true
                    },
                    phone: {
                    	isPhone: true
                    },
                    birth: {
                    	dateISO: true
                    },
                    bak: {
                    	maxlength: 200
                    },
                    zip_code: {
                    	isZipCode: true
                    },
                    car_plates: {
                    	minlength: 7,
                    	maxlength: 7,
                        required: true
	                },
	                vin: {
                    	minlength: 17,
                    	maxlength: 17
	                },
	                engine_num: {
                    	maxlength: 50
	                },
	                cer_num: {
	                	maxlength: 50
	                },
	                key_num: {
	                	maxlength: 50
	                },
	                year: {
	                	dateISO: true
	                },
	                creat_date: {
	                	dateISO: true
	                },
	                out_fa_date: {
	                	dateISO: true
	                },
	                fir_date: {
	                	dateISO: true
	                },
	                mileages: {
	                	number: true
	                },
	                car_price: {
	                	number: true
	                },
	                bak: {
	                	maxlength: 200
	                }

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    FormValidation.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.help-inline').removeClass('ok'); // display OK icon
                    $(element)
                        .closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.control-group').removeClass('error'); // set error class to the control group
                },

                success: function (label) {
                    label
                        .addClass('valid').addClass('help-inline ok') // mark the current input as valid and display OK icon
                    .closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
                },

                submitHandler: function (form) {
                    success1.show();
                    error1.hide();
                }
            });
    }

    return {
        //main function to initiate the module
        init: function () {

            handleValidation1();

        },

	// wrapper function to scroll to an element
        scrollTo: function (el, offeset) {
            pos = el ? el.offset().top : 0;
            jQuery('html,body').animate({
                    scrollTop: pos + (offeset ? offeset : 0)
                }, 'slow');
        }

    };

}();