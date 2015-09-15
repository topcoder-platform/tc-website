/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 *
 * Version 1.1(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
 * Updated to use reset code instead of secret question for recovery password
 *
 * Version 1.2 (BugR 10042) change log:
 * Gather and pass utm_source, utm_medium and utm_campaign value to backend action to persist.
 *
 * Version: 1.2
 * Author: leo_lol, KeSyren
 *
 **/

$(document).ready(function() {

    $('#loginForm_handle, #loginForm_password').keypress(function(e) {
        if (!isEnterKeyPressed(e)) {
            return true;
        }
        doLogin();
        return false;
    });
    
    function isEnterKeyPressed(e) {
        if (window.event) {
            return (window.event.keyCode == 13);
        }
        if (e) return (e.which == 13);
        return false;
    }
    
	//fix UI
	$(".loginForm_msg").css("width", $(".loginForm").css("width"));
	$(".reg_validation").css("width", $("#content .rightSide").css("width"));
	
	//Empty the captcha field.
	clearItem($("#txtCaptcha"));
	
	/* Header submenus */
	$("#header nav.top li:not('.last')").hover(function(){
    	$(this).addClass("expand");
    },function(){
    	$(this).removeClass("expand");
    }); 
    
    /* Header submenus */
	$("#header nav ul.sec > li").hover(function(){
    	$(this).find("ul.submenu").removeClass("hide");
    },function(){
    	$(this).find("ul.submenu").addClass("hide");
    }); 

	/* customers carousel */
    $("#footer .customers .carousel").bxSlider({
        controls:false,
        auto:true
    });
    
    $("#tryAnotherCode").click(function(){
    	$("#captcha_span").load("getCaptchaCode.action");
    	$("#txtCaptcha").val("");
    	return false;
    });
    
    /* Privacy Policy */
    $("#privacyPolicyBtn").click(function(){
    	loadModal("privacyPolicyModal");
    	var $modal = $("#privacyPolicyModal");
    	$modal.css("overflow-y", "scroll");
    	$modal.css("top", "10px");
    	$modal.css("height", ($(window).height() - 20) + "px");
    });
    
	/* password recovery */
	$("#passworRecoveryBtn").click(function(){
		$("#passwordRecoveryModal .section input").val("");
		$("#passwordForgotModal input").val("");
		$("#passwordRecoveryModal .password_recovery_msg").text("");
		loadModal("passwordRecoveryModal");
	});
	
	$("#passwordRecoveryModal input").each(function(){
		$(this).focusin(function(){
			$(this).css("background-color", "WHITE");
		});
	});

    var reSendBtnDelay;
	$("#passwordRecoveryModal .submit").click(function(){
		var userQuery = $.trim($("#passwordRecoveryModal .section input#handle").val());

		if(userQuery == '') {
			$("#passwordRecoveryModal .section input#handle").css("background-color", "#CC9999");
			return false;
		}

		$.post("ajax/findUser.action", {"userQuery":userQuery}, function(data){
			if("OK" == data.msg) {
                
				$("#passwordForgotModal .password_recovery_msg").text("");
                $("#passwordForgotModal table.emailTypeRadioTable").remove();
                var cloneTable = $("table.emailTypeRadioTable").clone();
                if(data.emailStatus == 1) {
                    $($(cloneTable).find("tr")[1]).remove();
                } else if (data.emailStatus == 2) {
                    $($(cloneTable).find("tr")[0]).remove();
                }
                $($(cloneTable).find("input")[0]).attr("checked", "checked");
                $(cloneTable).insertAfter("#passwordForgotModal .section .columnLeft");
                $("#passwordForgotModal table.emailTypeRadioTable").show();
                
                //get the resend button delay time from server.
                reSendBtnDelay = data.reSendBtnDelay;
				loadModal("passwordForgotModal");
			} else {
				$("#passwordRecoveryModal .password_recovery_msg").text(data.msg);
			}
		});
	});

    $("#passwordRecoveryModal .section input#handle").focus(function(){
        $("#passwordRecoveryModal .password_recovery_msg").text("");
    });

    $("#passwordResetModal .section input").focus(function(){
        $(this).css("background-color", "white");
        $("#passwordResetModal .password_recovery_msg").text("");
    });

	$("#passwordForgotModal .submit").click(function(){
        var elem = $("#passwordResetModal .label2 span");
        elem.text(reSendBtnDelay);
        forgotPassword("passwordForgotModal");
	});


    $("#passwordResetModal .submit").click(function(){
        var code = $("#passwordResetModal input[name='tk']").val();
        var pwd = $("#passwordResetModal input[name='pwd']").val();
        var pwdc = $("#passwordResetModal input[name='pwdc']").val();
        var valid = true;
        //validate code
        if(code.length != 6) {
            $("#passwordResetModal input[name='tk']").css("background-color", "#CC9999");
            $("#passwordResetModal .password_recovery_msg").text("The code should be 6 characters");
            return;
        }

        // validate new password
        if(pwd.length == 0) {
            $("#passwordResetModal input[name='pwd']").css("background-color", "#CC9999");
            $("#passwordResetModal .password_recovery_msg").text("New password is required");
            return;
        }

        // validate confirm password
        if(pwdc.length == 0) {
            $("#passwordResetModal input[name='pwdc']").css("background-color", "#CC9999");
            $("#passwordResetModal .password_recovery_msg").text("Confirm password is required");
            return;
        }

        if(pwd != pwdc) {
            $("#passwordResetModal input[name='pwdc']").css("background-color", "#CC9999");
            $("#passwordResetModal .password_recovery_msg").text("Password and confirm password should be exactly same");
            return;
        }

        $.post("ajax/resetPassword.action", {"resetToken": code, "password": pwd, "confirmPassword": pwdc }, function(data){
            if("OK" == data.msg) {
                loadModal("passwordResetSuccessModal");
            } else {
                $("#passwordResetModal .password_recovery_msg").text(data.msg);
            }
        });
    });
	
	$(".rightSide .form .row input").blur(function(){
		var $id = $(this).attr("id"); 
		if($id == 'txtEmail') {
			validateEmail($(this));
		} else if($id == 'txtCPassword') {
			validatePassword($("#txtCPassword"), $("#txtPassword"));
		} else {
			validateItem($(this));
		}
	});
	
	$(".rightSide .form .row select").change(function(){
		validateSelect($(this));
	});
	
	/* registration */
	$(".register").click(function(){
		validateItem($("#txtFName"));
		validateItem($("#txtLName"));
		validateItem($("#txtHandle"));
		validateSelect($("#selCountry"));
		validateEmail($("#txtEmail"));
		validateItem($("#txtPassword"));
		validatePassword($("#txtCPassword"), $("#txtPassword"));
		validateCaptcha($("#txtCaptcha"));
		
		if($(".rightSide .form .row").filter(".error").length == 0) {
			var firstName = $("#txtFName").val();
			var lastName = $("#txtLName").val();
			var handle = $("#txtHandle").val();
			var country = $("#selCountry").val();
			var email = $("#txtEmail").val();
			var password = $("#txtPassword").val();
			var confirmPassword = $("#txtCPassword").val();
			var captcha = $("#txtCaptcha").val();
                        var utm_source = $("#utm_source").val();
                        var utm_medium = $("#utm_medium").val();
                        var utm_campaign = $("#utm_campaign").val();

			
			$.post("ajax/register.action", 
			   {"user.firstName":firstName, "user.lastName":lastName,
				"user.handle":handle, "user.country":country, "user.email":email, "user.password":password,
				"user.confirmPassword":confirmPassword, "user.verificationCode":captcha, "user.utm_source":utm_source,
                                "user.utm_medium":utm_medium, "user.utm_campaign":utm_campaign
				}, 
			   
				function(data){
					if(data.messages.length == 0) {
                        window.location.href = 'registration_successful.jsp?email=' + email;
					} else {
						var msg = "";
						var len = data.messages.length;
						for(var i = 0; i<len; i++) {
							msg = msg + data.messages[i] + "; ";
						}
						msg = msg.substring(0, msg.length -2);
						$("#registrationModal .section p").text(msg);
                        loadModal("registrationModal");
					}
			});
			
		}
	});


    //The resend button should be delayed for certain amount of time before
    //it is enabled to avoid malicious flooding attack.
    function forgotPassword(id) {
        var usePrimaryEmail = ($("#passwordForgotModal input:checked").val() === "true");
		$.post("ajax/forgotPassword.action", {"usePrimaryEmail":usePrimaryEmail}, function(data){
			if("OK" == data.msg) {
                if(id == "passwordForgotModal" ) {
                    $("#passwordResetModal .password_recovery_msg").text("");
                    $("#passwordResetModal .expireTime").text(data.expireTime/60);

                    $("#passwordResetModal .receiveEmail").text((usePrimaryEmail ? "primary" : "secondary"));
                    $("#passwordResetModal input").val("");
                    loadModal("passwordResetModal");
                }
			} else {
				$("#" + id + " .password_recovery_msg").text(data.msg);
			}
		});
    }
		
	function validateItem( item)
	{
		if(item.length != 0){
			item.parent().removeClass("error accepted");
		
			if(item.val().length==0) {
				item.parent().addClass("error");
			}else {
				item.parent().addClass("accepted");			
			}
		}
	}
	
	function validateEmail( item) { 
		item.parent().removeClass("error accepted");	
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!re.test( item.val())) {
			item.parent().addClass("error");
		}else {
			item.parent().addClass("accepted");
		}
	}
	
	function validatePassword( item, origItem)
	{
		if(item.length != 0 && origItem.length !=0){
			item.parent().removeClass("error accepted");
			if(item.val().length==0||item.val()!=origItem.val())item.parent().addClass("error");
			else item.parent().addClass("accepted");
		}
	}
	function validateCaptcha( item) { 
		item.parent().removeClass("error accepted");
		if($.trim(item.val()) == "")item.parent().addClass("error");
		else item.parent().addClass("accepted");
	}
	function validateSelect( item) { 
		item.parent().removeClass("error accepted");
		if(item.val() == "")item.parent().addClass("error");
		else item.parent().addClass("accepted");
	}
	
	/* clear registration form */
	$(".clear").click(function(){
		clearItem($("#txtFName"));
		clearItem($("#txtLName"));
		clearItem($("#txtHandle"));
		clearSelect($("#selCountry"));
		clearItem($("#txtEmail"));
		clearItem($("#txtPassword"));
		clearItem($("#txtCPassword"));
		clearItem($("#txtCaptcha"));
		recountPasswordStrength();
	});
	
	function clearItem( item)
	{
		item.val("");
		item.parent().removeClass("error accepted");
	}
	function clearSelect( item)
	{
		item.find('option').eq(0).attr('selected', 'selected');
		item.addClass('pls');
		item.parent().removeClass("error accepted");
	}
	
	/* input default handlers */
	$("input.default").focusin(function(){
		
		$(this).css("background-color", "white");
		
		if($(this).prop("defaultValue") == $(this).val())
		{
			$(this).val("");
		}
		if($(this).hasClass("password"))
		{
			$(this).prop('type', 'password');
		}
		$(this).css("color","#333");
	});
	
	$("input.default").focusout(function(){
		if($(this).val() == "")
		{
			if($(this).is(':password'))
			{
				$(this).prop('type', 'text');
			}
			$(this).val($(this).prop("defaultValue"));
			$(this).css("color","#666");
		}
		
	});
	
	
	/* count strength of the password */
	$('#txtPassword').keyup(function() {
	   recountPasswordStrength();
	});
	
	/**
	 * Calculate the password strength.
	 */
	function checkStrength(password){
		//initial strength
	    var strength = 0;
	    //if the password length is less than 8, return -1 to reject the password.
	    if (password.length < 8) { 
	    	return -1;
		}
	    //length is ok, lets continue.
	    
	    //if the password is ending with a number, return -2.
	    if(password.match(/\d$/)) {
	    	return -2;
	    }
	    //not ending with a number, Let's continue.
		
		//if password contains lower case characters, increase strength value
		if (password.match(/[a-z]+/))  strength += 1;
		
		//if it has capital case characters, increase strength value
		if (password.match(/([A-Z]+)/))  strength += 1;
		
		//If it has numbers, increase strength value.
		if(password.match(/\d+/)) {
			strength += 1;
		}
		
		//if it has one special character, increase strength value
	    if (password.match(/([!,%,&,@,#,$,^,*,?,_,~,\(,\),\[,\],\{,\},\|,\\,\/,\,,\.,<,>,\-,\,,\',\",:,;,`])/))  strength += 1;
		
		//now we have calculated strength value, we can return messages
	    return strength;
	}
	
	function recountPasswordStrength()
	{
		var $li = $("#txtPassword").parent();
		$li.removeClass("error");
		
		var pwd=$("#txtPassword").val();
		
		$(".passwordStrength").removeClass("weak medium");
		var pwdStrength = checkStrength(pwd);
		
		if(-1 == pwdStrength) {
			//Less than 8 characters
			$li.addClass("error");
		}
		
		if(-2 == pwdStrength) {
			//Ending with a number.
			$li.addClass("error");
		}
		
		if(pwdStrength<3) {
			$(".passwordStrength").html("Weak");
			$(".passwordStrength").addClass("weak");
			$li.addClass("error");
		} else if(pwdStrength == 3) {
			$(".passwordStrength").html("Fair");
			$(".passwordStrength").addClass("medium");
		} else { 
			$(".passwordStrength").html("Good");
		}
	}

	// switching account information in my account
	$("ul.account").on("click","li:not('.on') a", function(){
		$(".btnDiscard:visible").click();
	
		$("ul.account li").removeClass("on");
		$(this).parents("li").addClass("on");
		
		var name = $(this).prop("name");
		
		$(".rightSide.information").addClass("hide");
		$(".rightSide.information#" + name).removeClass("hide");
	});

	// switching editable value to form element
	$(".information a.btnEdit").click(function(){
		$(this).parents(".information").find(".btns").show();
		$(this).hide();
		
		$(this).parents(".information").find(".form").addClass("edit");
		
		$(this).parents(".information").find(".editable.text").each(function(){
			var value = $(this).text();
			$(this).html('<input type="text" class="text" value="'+ value +'"/>');
		});
		
		$(this).parents(".information").find(".editable.passwd").each(function(){
			var value = $(this).text();
			$(this).html('<input type="password" class="text" value=""/>');
		});
		
		$(this).parents(".information").find(".editable.select").each(function(){
			$(this).find("span").hide();
			$(this).find("select").show();
			var val = $(this).find("span").text();
			$(this).find("select option").filter(function() {
			    return $(this).text() == val;
			}).attr('selected', true);
		});
		
		$(this).parents(".information").find(".editable.file").each(function(){
			$(this).find("span").hide();
			$(this).find("input.file").show();
		});
		
		$(this).parents(".information").find(".editable.textarea").each(function(){
			$(this).find("span").hide();
			$(this).find("textarea").show();
		});
		
		$(this).parents(".information").find(".editable.date").each(function(){
			$(this).find("span").hide();
			$(this).find("input.date-pick").show();
			$(this).find("a.dp-choose-date").removeClass("hide");
		});
		
	});
	
	// switching editable value to form element
	$(".information a.btnDiscard").click(function(){
		$(this).parents(".information").find(".btns").hide();
		$(this).parents(".information").find(".btnEdit").show();
		
		$(this).parents(".information").find(".form").removeClass("edit");
		
		$(this).parents(".information").find(".editable.text").each(function(){
			var value = $(this).find("input.text").prop("defaultValue");
			$(this).html("<span>"+value+"</span>");
		});
		
		$(this).parents(".information").find(".editable.passwd").each(function(){
			var value = $(this).find("input.text").prop("defaultValue");
			value = value.replace(/./g,'*');
			$(this).html("<span>"+value+"</span>");
		});
		
		$(this).parents(".information").find(".editable.select").each(function(){
			$(this).find("span").show();
			$(this).find("select").hide();
		});
		
		$(this).parents(".information").find(".editable.file").each(function(){
			$(this).find("span").show();
			$(this).find("input.file").hide();
		});
		
		$(this).parents(".information").find(".editable.textarea").each(function(){
			$(this).find("span").show();
			$(this).find("textarea").hide();
		});
		
		$(this).parents(".information").find(".editable.date").each(function(){
			$(this).find("span").show();
			$(this).find("input.date-pick").hide();
			$(this).find("a.dp-choose-date").addClass("hide");
		});
	});
	
	// switching form element to new value
	$(".information a.btnSave").click(function(){
		$(this).parents(".information").find(".btns").hide();
		$(this).parents(".information").find(".btnEdit").show();
		
		$(this).parents(".information").find(".form").removeClass("edit");
		
		$(this).parents(".information").find(".editable.text").each(function(){
			var value = $(this).find("input.text").val();
			$(this).html("<span>"+value+"</span>");
		});
		
		$(this).parents(".information").find(".editable.passwd").each(function(){
			var value = $(this).find("input.text").val();
			value = value.replace(/./g,'*');
			$(this).html("<span>"+value+"</span>");
		});
		
		$(this).parents(".information").find(".editable.select").each(function(){
			$(this).find("span").text($(this).find("select option:selected").map(function(){ return this.text; }).get().join(", "));
			$(this).find("span").show();
			$(this).find("select").hide();
		});
		
		$(this).parents(".information").find(".editable.file").each(function(){
			$(this).find("span").text($(this).find("input.file").val());
			$(this).find("span").show();
			$(this).find("input.file").hide();
		});
		
		$(this).parents(".information").find(".editable.textarea").each(function(){
			$(this).find("span").text($(this).find("textarea").val());
			$(this).find("span").show();
			$(this).find("textarea").hide();
		});
		
		$(this).parents(".information").find(".editable.date").each(function(){
			$(this).find("span").text($(this).find("input.date-pick").val());
			$(this).find("span").show();
			$(this).find("input.date-pick").hide();
			$(this).find("a.dp-choose-date").addClass("hide");
			
		});
	});
	
	
	/* calculate payments */
	$("#payments th input.checkbox").click(function(){
		if($(this).prop("checked"))
		{
			$("#payments td input.checkbox:not(:disabled)").prop("checked", true);
			$("#payments td input.checkbox:not(:disabled)").change();
		}else
		{
			$("#payments td input.checkbox:not(:disabled)").prop("checked", false);
			$("#payments td input.checkbox:not(:disabled)").change();
		}
	});
	$("#payments td input.checkbox").change(function(){
		var sum = 0.00;
		$("#payments td input.checkbox:not(:disabled)").each(function(){
			if($(this).prop("checked"))
			{
				sum += parseFloat($(this).parents("tr").find(".payment").text().replace("$",""));
			}
		});
		$(".payMe span.sum").text("$"+sum.toFixed(2));
		if(sum > 0)
		{
			$(".payMe a").removeClass("disabled");
		}else
		{
			$(".payMe a").addClass("disabled");
		}
	});
	
	/* payment method switching buttons */
	$(".method a.grayBtn").click(function(){
		$(this).parents(".rightSide").find("a.grayBtn").removeClass("on");
		$(this).addClass("on");
	});
	
	/* privacy switching buttons */
	$(".btnGroup").on("click", "a.switch.off", function(){
		$(this).parents(".btnGroup").find(".switch").removeClass("on").addClass("off");
		$(this).removeClass("off").addClass("on");
	});
	
	/* add member to blacklist 
	*	this is only example function with static member image and random coder text color	
	*/
	$(".btnBlock").click(function(){
		var handle = $(this).parents(".form").find("input#block").val();
		var img = 'i/empty-photo.png';
		
		var arrCoderText = new Array("coderTextOrange","coderTextRed","coderTextYellow","coderTextBlue","coderTextGreen","coderTextGray","coderTextBlack");
		var i = Math.floor((Math.random()*arrCoderText.length)+1);
		
		var memberHtml = "<div class='member'>"+
							"<img src='"+img+"' width='72' height='72' alt='photo' />"+
							"<p class='handle'><a href='javascript:;' class='"+arrCoderText[i]+"'>"+handle+"</a></p>"+
							"<p><a href='javascript:;' class='btnUnblock'>Unblock</a></p>"+
						"</div>";
		
		$("#blacklist .list").append(memberHtml);
	});
	
	/* remove member from blacklist */
	$(".list").on("click", ".btnUnblock", function(){
		$(this).parents(".member").remove();
	});
	
	/* switching forum preferences/settings */
	$("#forumSettings h2 a").click(function(){
		var h2 = $(this).parents("h2");
		$("#forumSettings h2.expand").removeClass("on");
		$("#forumSettings .information").addClass("hide");
		$(h2).addClass("on");
		$(h2).next(".information").removeClass("hide");
	});
	
	$('nav li .subMenus').each(function() {
		var links = $('a', $(this));
		if (links.length <= 7) {
			links.css({
				display: 'block',
				width: 'auto'
			});
			$(this).width(150);
		} else {
			$(this).width(230);
		}
	});
	
	/* initialization date-picker */
    if($('.date-pick').length > 0){
        Date.firstDayOfWeek = 0;
		$(".date-pick").datePicker({startDate:'01/01/2001'});
		$(".information .form dl dd a.dp-choose-date").addClass("hide");        
    }
    
    if ($('.registrationSuccessful').length > 0) {
        $('.titleLine').hide();
    }
});


//load Modal pop-up and dim background
loadModal = function(itemId) {
	closeModal();
	var popup=$("#"+itemId);
    $('#modalBackground').css("display", "block");
	$("#modalBackground").css("z-index",popup.css("z-index")-1);
    popup.css("display", "block");
    positionModal(popup);
    
	popup.find(".btnClose").on("click", function () {
		closeModal();
});
	popup.find(".done").on("click", function () {
		closeModal();
	});
};

//close Modal pop-up and remove it's background
closeModal = function() {
   	$('#modalBackground').css("display", "none");
	$('.modal').css("display", "none");
};

/* Position modal */
function positionModal( itemPopup) {
    var wWidth  = window.innerWidth;
    var wHeight = window.innerHeight;

    if (wWidth==undefined) {
        wWidth  = document.documentElement.clientWidth;
        wHeight = document.documentElement.clientHeight;
    }
    var boxLeft = parseInt((wWidth / 2) - ( itemPopup.width() / 2 ));
    var boxTop  = parseInt((wHeight / 2) - ( itemPopup.height() / 2 ));
	
	itemPopup.css('top', boxTop+"px");
	itemPopup.css('left', boxLeft+"px");
}

/**
 * Handle login form.
 * 
 * @returns {Boolean}
 */
function doLogin() {
	var validationPass = true;
	
	$(".loginForm input.text").each(function(){
		var txt = $.trim($(this).val());
		if(txt == $(this).prop('defaultValue') || txt == '') {
			$(this).css("background-color", "#CC9999");
			validationPass = false;
		}
	});
	
	if(validationPass) {
		var handle = $(".loginForm input.handle").val();
		var password = $(".loginForm input.password").val();
		var rememberMe = $(".loginForm input[name='rememberMe']").attr("checked");
		
		$.post("ajax/login.action", {"handle":handle, "password":password, "rememberMe":rememberMe}, function(data){
			if("OK" == data.message) {
				if(null != data.nextPage) {
					window.location.href = data.nextPage;
				} else {
					window.location.href= 'https://www.topcoder.com';
				}
			} else {
				$(".loginForm_msg").text(data.message);
			}
		});
		
	}
}


/**
 * Validate Reset password and confirm password before submitting form. 
 */
function resetPassword() {
	var password = $.trim($("#reset_password_form input[name='password']").val());
	var confirmPassword = $("#reset_password_form input[name='confirmPassword']").val();
	var $warningDiv = $("#reset_password_warning"); 
	if('' == password) {
		$warningDiv.text("Password required");
		$warningDiv.show();
		return;
	} else if(password != confirmPassword) {
		$warningDiv.text("Password and confirm password mis-match");
		$warningDiv.show();
		return;
	}
	
	$("#reset_password_form").submit();
}