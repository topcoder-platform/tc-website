$(document).ready(function(){
    $.ajaxSetup(
        {cache : false}
	);
	
	if($(document).height() > $('.wrapper').height()){
		$('.wrapper').height($(document).height());
	}
	window.onresize = function(){
		if($(document).height() > $('.wrapper').height()){
			$('.wrapper').height($(document).height());
		}
	}
	
	
/* Modal */
	var PositionModal = function(options){
		
		var wWidth  = window.innerWidth;
		var wHeight = window.innerHeight;
		var bHeight = $("body").height();
	
		if (wWidth==undefined) {
			wWidth  = document.documentElement.clientWidth;
			wHeight = document.documentElement.clientHeight;
		}
		
		var boxLeft = parseInt((wWidth / 2) - ( $("#modal").width() / 2 ));
		var boxTop  = parseInt((wHeight / 2) - ( $("#modal").height() / 2 ));
	
		// position modal
		$("#modal").css({
			'margin': boxTop + 'px auto 0 ' + boxLeft + 'px'
		});
		if($('.registerPage').length >0){
			$("#modal").css('margin-top','120px');
		}
		
		if (bHeight > $("#modalBackground").height()){
			$("#modalBackground").height(bHeight);
		}
	}
		
	var LoadModal = function(itemId,bool) {
		$('body').append('<div id="modalBackground"></div>');
		//$('#modalBackground').show();
		$("#modalBackground").css("opacity", "0.6");
		$(itemId).show();
		PositionModal();
		if ($('#modalTermsConditions').length > 0) {
			$('#modalTermsConditions .modalContainer').jscroll({
				W: '19px',
				BgUrl: 'url(./i/reg/scroll.png)',
				Bg: '-38px 0 repeat-y',
				Bar:{
					Pos: 'bottom',
					Bd:{
						Out: '#D7D7D7',
						Hover: '#D7D7D7'
					},
					Bg:{
						Out: '-20px 0 repeat-y',
						Hover: '-20px 0 repeat-y',
						Focus: '-20px 0 repeat-y'
					}
				},Btn:{
					btn:true,
						uBg:{
							Out: '0 0',
							Hover: '0 0',
							Focus: '0 0'
						},
						dBg:{
							Out: '0 -19px',
							Hover: '0 -19px',
							Focus: '0 -19px'
						}
					},
				Fn:function(){}
			});
		}

	}
	
	var closeModal = function() {
		$('#modalBackground').remove();
		$('.outLay').hide(); 
	}
/* end Modal */

	if($('.registerPage').length>0){
		//LoadModal("#modalTermsConditions");
	}
    $('.termline .terms').click(function(){
        LoadModal("#modalTermsConditions");
        return false;
    });
	
	$('#modalTermsConditions .modalFooter .button').unbind().bind('click',function(){
		closeModal();
	});
	
	$('.cancelModalButton, .uploadModalButton').unbind().bind('click',function(){
		closeModal();
	});
	
	$('.userUploadPhotoBtn').click(function(){
		LoadModal("#modalUploadPhoto");
	});
	
	$('#loginPassword').live('keyup',function(){
		var valPs = $.trim($(this).val());
		$('.barProgress .barControl').css('width',Math.max(($().checkPassword(valPs, {common:[],minchar:7})*4), 0).toString()+'%');
	});

	
	$(':text').keyup(function(){
		$(this).removeClass('error').siblings('.tipError,.tipError2').hide();
		$(this).siblings('.handleOkey,.handleError').hide();
		$('.editErrorNotice').hide();
	});
	$(':password').keyup(function(){
		$(':password').removeClass('error').siblings('.tipError,.compareError,.tipError2').hide();
		$(this).siblings('.handleOkey,.handleError').hide();
		$('.editErrorNotice').hide();
	});
	
	var errors = $("#errors span");
	if (errors.length != 0) {
		closeModal();
	}
	for (i = 0; i < errors.length; i++) {
		if (errors[i].innerHTML.indexOf("handle") != -1) {
			$('#handle').after("<span class=\"tipError2\">" + errors[i].innerHTML + "</span>");
			$('#handle').addClass('error').siblings('.tipError2').show();
		}
		if (errors[i].innerHTML.indexOf("password") != -1) {
			$('#loginPassword').after("<span class=\"tipError2\">" + errors[i].innerHTML + "</span>");
			$('#loginPassword').addClass('error').siblings('.tipError2').show();
		}
		if (errors[i].innerHTML.indexOf("email") != -1) {
			$('#email').after("<span class=\"tipError2\">" + errors[i].innerHTML + "</span>");
			$('#email').addClass('error').siblings('.tipError2').show();
		}
		if (errors[i].innerHTML.indexOf("verification") != -1) {
			$('#captchaWord').addClass('error').siblings('.tipError').show();
		}
	};
	
	errors = $("#recoverErrors span");
	for (i = 0; i < errors.length; i++) {
		if (errors[i].innerHTML.indexOf("andle") != -1) {
			$("#handleNotValidErrorMsg").show();
			$("#TI_handle").addClass("errorInput");
			continue;
		}
		if (errors[i].innerHTML.indexOf("mail") != -1) {
			$("#emailNotValidErrorMsg").show();
			$("#TI_email").addClass("errorInput");	
		}
	};	
	
	errors = $("#loginErrors span");
	for (i = 0; i < errors.length; i++) {
		if (errors[i].innerHTML.indexOf("user") != -1) {
			$('#TI_username').after("<span class=\"errorMessage2\">" + errors[i].innerHTML + "</span>");
			$('#TI_username').addClass('errorInput').siblings('.errorMessage2').show();	
			break;
		}
		if (errors[i].innerHTML.indexOf("assword") != -1) {
			$('#TI_password').after("<span class=\"errorMessage2\">" + errors[i].innerHTML + "</span>");
			$('#TI_password').addClass('errorInput').siblings('.errorMessage2').show();	
		}
	};

    $('#checkAgree').change(function(){
        if($('#checkAgree:checked').length>0){
            $('#registerSubmitButton').removeClass('disabled');
        }else{
            $('#registerSubmitButton').addClass('disabled');
        }
    });
	
	$('#registerSubmitButton').click(function(){
        if($(this).hasClass('disabled')) return;
		$('.tipError2,.tipError,.editErrorNotice').hide();
		$(':text').removeClass('error');
		var checkStauts = true;
		if($.trim($('#firstName').val()).length == 0 ){
			$('#firstName').addClass('error').siblings('.tipError').show();
			checkStauts = false;
		}
		if($.trim($('#lastName').val()).length == 0 ){
			$('#lastName').addClass('error').siblings('.tipError').show();
			checkStauts = false;
		}
		if($.trim($('#handle').val()).length < 2 ){
			$('#handle').addClass('error').siblings('.tipError').show();
			$('#handle').siblings('.signError,.signOkey').hide();
			checkStauts = false;
		}
		if($.trim($('#email').val()).length == 0 || !isEmail($.trim($('#email').val()))){
			$('#email').addClass('error').siblings('.tipError').show();
			checkStauts = false;
		}
		if($.trim($('#loginPassword').val()).length == 0 ){
			$('#loginPassword').addClass('error').siblings('.tipError').show();
			$('#loginPassword').siblings('.compareError').hide();
			checkStauts = false;
		}
		if($.trim($('#confirmPassword').val()).length == 0 ){
			$('#confirmPassword').addClass('error').siblings('.tipError').show();
			checkStauts = false;
		}

		if(!checkStauts){return false};
		
		if($(this).closest('form').hasClass('errorForm')){return false};

		submitForm("formRegister");
	});
	
	$('#firstStepButton').click(function(){
		submitForm("formPreference");
	});
	
	$('.registerPage #confirmPassword').blur(function(){
		if($.trim($('#loginPassword').val()).length != 0 && $.trim($('#confirmPassword').val()).length != 0){
			if($.trim($('#loginPassword').val()) != $.trim($('#confirmPassword').val())){
				$('#loginPassword').addClass('error').siblings('.tipError').hide();
				$('#loginPassword').siblings('.compareError').show();
				$('#confirmPassword').addClass('error').siblings('.tipError').hide();
				$('.barProgress .barControl').css('width','0%');
				$(this).closest('form').addClass('errorForm');
			}else{
				$('#loginPassword').siblings('.compareError').hide();
				$('#confirmPassword').removeClass('error');
				$(this).closest('form').removeClass('errorForm');
			}
		}
	});
	
	$('.resetButton').click(function(){
		$(':text,:password').val("");
		$('.barProgress .barControl').css('width','0%');
	});

/* jqTransform */
	if($(".userPreference").length>0){
		$(".userPreference").jqTransform();
	}
	if($('#formMyProfile').length>0){
		$('#formMyProfile').jqTransform();
		
		$('.documentUploadFile').each(function(){
			var userAgent = navigator.userAgent.toLowerCase(); 
			var version = parseInt((userAgent.match( /.+(?:rv|it|ra|ie|firefox)[\/: ]([\d.]+)/ ) || [])[1]);
			if($.browser.mozilla && version < 4){
				$(this).css({
					height:$(this).siblings('.fileTxt').height(),
					"opacity": "0.01",
					zIndex:'999',
					right:0,
					left:"auto"
				});
			}else{
				$(this).css({
					width:$(this).siblings('.fileTxt').width(),
					height:$(this).siblings('.fileTxt').height(),
					"opacity": "0.01"
				});
			}
		});
		
		
		$('#formMyProfile .userEditList').hide();
	}

/* end jqTransform */	
	if($('.preferencePage').length>0){
		$('.helpTips').hover(
			function(){
				var id = $(this).attr("rel");
				var pos = $(this).offset();
				$('#'+id).show();
				$('#'+id).css({top:pos.top+30,left:pos.left-21})
				
			},
			function(){
				var id = $(this).attr("rel");
				$('#'+id).hide();
			}
		);
	}
	
	if($('.uploadDocumentPage').length>0){
		$('.helpTips').hover(
			function(){
				var id = $(this).attr("rel");
				var pos = $(this).offset();
				$('#'+id).show();
				$('#'+id).css({top:pos.top+30,left:pos.left-179})
				
			},
			function(){
				var id = $(this).attr("rel");
				$('#'+id).hide();
			}
		);
		
		$('.documentUploadFile').each(function(){
			var userAgent = navigator.userAgent.toLowerCase(); 
			var version = parseInt((userAgent.match( /.+(?:rv|it|ra|ie|firefox)[\/: ]([\d.]+)/ ) || [])[1]);
			if($.browser.mozilla && version < 4){
				$(this).css({
					width:$(this).parent().width(),
					height:$(this).parent().height(),
					"opacity": "0.01",
					zIndex:'999',
					left:0,
					right:'auto'
				});
			}else{
				$(this).css({
					width:$(this).siblings('.fileTxt').width(),
					height:$(this).siblings('.fileTxt').height(),
					"opacity": "0.01"
				});
			}
		});
		
		// Click Handler
		$('.browseFileButton, .fileTxt').click(function(){$('.documentUploadFile').click();})
		$('.documentUploadFile').change(function(){
			$('.fileTxt').text($('.documentUploadFile').val());
		});
	}
	
	if($('.myProfilePage').length>0){
		$('.helpTips').hover(
			function(){
				var id = $(this).attr("rel");
				var pos = $(this).offset();
				$('#'+id).show();
				$('#'+id).css({top:pos.top+30,left:pos.left-179})
				
			},
			function(){
				var id = $(this).attr("rel");
				$('#'+id).hide();
			}
		);
		
		// Click Handler
		$('.browseFileButton, .fileTxt').bind('click',function(){$(this).siblings('.documentUploadFile').click();})
		$('.documentUploadFile').bind('change',function(){
			var fileValue = $(this).val();
			if(isSecretUrl(fileValue)){
				fileValue = fileValue.replace(/(C:\\)*fakepath\\/i, '');
				
			}else{
				if(isJPG(fileValue)){
					$('#photoPreview').attr("src",fileValue);
				}
			}
			$(this).siblings('.fileTxt').text(fileValue);
		});
		
	}
	
	$('#sideBar .userOperation .topMenu').click(function(){
		if($(this).parent().hasClass('expand')){
			$(this).siblings('ul').slideUp("normal", function(){
				$(this).parent().removeClass('expand')
			});
		}else{
			$(this).siblings('ul').slideDown("normal", function(){
				$(this).parent().addClass('expand')
			});
		}
	});
	
	
	$('.editButton').click(function(){
		$(this).closest('.profileMainContent')
			.find('.userInformationList').hide()
			.andSelf().closest('.profileMainContent')
			.find('.userEditList').show();
		$('#formMyProfile').trigger('reset');
	});
	
	$('.discardUserContactButton').click(function(){
		$(this).closest('.profileMainContent')
			.find('.userEditList').hide()
			.andSelf().closest('.profileMainContent')
			.find('.userInformationList').show();
	});
	
	$('.storeSSHKeyButton').toggle(
		function () {
			$('#storeSSHKey').show();
		},
		function () {
			$('#storeSSHKey').hide();
		}	
	);
	
	$('.saveUserContactButton').click(function(){
		var checkStauts = true;
		//var hideError = false;
		var arr = [];
		if($('#email').length > 0 ){
			var emailVal = $.trim($('#email').val());
			if(emailVal.length == 0 || !isEmail(emailVal)){
				$('#email').addClass('error');
				checkStauts = false;
				arr.push('email');
			}
		}
		
		if($('#phoneNumber').length > 0 ){
			var phoneNumberVal = $.trim($('#phoneNumber').val());
			if(phoneNumberVal.length == 0 || !isPhoneNumber(phoneNumberVal)){
				$('#phoneNumber').addClass('error');
				checkStauts = false;
				arr.push('phone number');
			}
		}
		
		if($('#loginPassword').length > 0 ){
			if($.trim($('#loginPassword').val()).length == 0 ){
				$('#loginPassword').addClass('error');
				checkStauts = false;
				arr.push('password');
			}
			if($.trim($('#confirmPassword').val()).length == 0 ){
				$('#confirmPassword').addClass('error');
				checkStauts = false;
				arr.push('confirm password');
			}
			if($.trim($('#loginPassword').val()).length != 0 && $.trim($('#confirmPassword').val()).length != 0){
				if($.trim($('#loginPassword').val()) != $.trim($('#confirmPassword').val())){
					$('#loginPassword').addClass('error');
					$('#confirmPassword').addClass('error');
					checkStauts = false;
					arr.push('password');
					arr.push('confirm password');
				}
			}
		}
		
		if(checkStauts){
			$('.discardUserContactButton').trigger('click');
		}else{
			$(this).closest('.userEditList').find('.editErrorNotice').text("Please Fill the required fields [ "+arr.join(' | ')+" ]");
			$(this).closest('.userEditList').find('.editErrorNotice').show();
			arr.length = 0;
			return false;
		}
		
	});
	
	$('.addBlacklistedMemberButton').click(function(){
		var obj = $('#blacklistedMember');
		var objVal = $.trim(obj.val());
		var objArray = [], checkExist = false;
		$(this).siblings('.noticeError').hide();
		
		if(objVal.length == 0) return;
		
		if($.trim(obj.val()).toLowerCase() == 'miaw'){
			obj.addClass('error');
			$(this).siblings('.noticeError').text('there are no member named "miaw"').show();
			return;
		}

		$('.addedMemberList ul li span').each(function(){
			objArray.push($.trim($(this).text()));
		});
		for(var i =0; i< objArray.length;i++){
			if(objArray[i] == objVal){
				obj.addClass('error');
				obj.siblings('.noticeError').text('there exist member named "'+objVal+'"').show();
				checkExist = true;
				return;
			}
		}
		if(!checkExist){
			$('.addedMemberList ul').prepend('<li><span>'+objVal+'</span><a href="javascript:;" class="unblockButton">Unblock</a></li>');
			objArray.length = 0;
			$('#blacklistedMember').val("");
		
		}
	});
	
	$('.unblockButton').live('click',function(){
		$(this).closest('li').remove();
	});
	
	
	$('.savePaymentPreferenceButton').click(function(){
		var paymetActualAmountValue = $('#paymetActualAmount').val();
		if(!isNuberm(paymetActualAmountValue)){
			$('#paymetActualAmount').addClass('error');
			$('#paymetActualAmount').siblings('.tipError').show();
			return false;
		}
	});

	$('#tryAnotherCode').click(function() {
		$('#captcha').load('loadCaptchaAction.action');
		$('#captchaWord').val('');
		return false;
	});
	$('#captchaWord').val('');
	
	$('#login').click(function() {
		loginSubmit();
	});
	
	$('#submitRecover').click(function() {
		recoverSubmit();
	});
	
	$('#TI_username').focus(function() {
		$("#usernameErrorMsg").hide();
		$('#TI_username').removeClass('errorInput').siblings('.errorMessage2').hide();	
	});
	
	$('#TI_password').focus(function() {
		$("#passwordErrorMsg").hide();
		$('#TI_password').removeClass('errorInput').siblings('.errorMessage2').hide();	
	});
	
	$('#TI_handle').focus(function() {
		$("#TI_handle").removeClass("errorInput");
		$("#handleErrorMsg").hide();
		$("#handleNotValidErrorMsg").hide();
	});
	
	$('#TI_email').focus(function() {
		$("#TI_email").removeClass("errorInput");
		$("#emailErrorMsg").hide();
		$("#emailNotValidErrorMsg").hide();
	});	
		
});



function isEmail(str){
	var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	return reg.test(str);
}

function isNuberm(str){
	var reg = /^[1-9]\d*$/;
	return reg.test(str);
}

function isPhoneNumber(str){
	var reg = /^[\(\)\+\s*0-9]+$/;
	return reg.test(str);
}

function isJPG(str){
	var reg = /(\.jpg)$/;
	return reg.test(str);
}
function isSecretUrl(str){
	var reg = /(c:\\)*fakepath/;
	return reg.test(str);
}


function loginSubmit() {
	var username = $("#TI_username").val();
	var password = $("#TI_password").val();
	var isValid = true;
	
	$("#usernameErrorMsg").hide();
	$("#TI_username").removeClass("errorInput");
	$("#passwordErrorMsg").hide();
	$("#TI_password").removeClass("errorInput");		
		
	if(username=="") {
		$("#usernameErrorMsg").show();
		$("#TI_username").addClass("errorInput");
		isValid = false;
	}
	
	if(password=="") {
		$("#passwordErrorMsg").show();
		$("#TI_password").addClass("errorInput");
		isValid = false;
	}
	
	if (isValid) {
		submitForm("loginForm");
	}
}

function recoverSubmit() {
	var isValid = true;
	var handle = $("#TI_handle").val();
	var email = $("#TI_email").val();
	
	$("#handleErrorMsg").hide();
	$("#TI_handle").removeClass("errorInput");	
	
	$("#emailErrorMsg").hide();
	$("#TI_email").removeClass("errorInput");
	
	$("#handleNotValidErrorMsg").hide();
	$("#TI_handle").removeClass("errorInput");		
	
	$("#emailNotValidErrorMsg").hide();
	$("#TI_email").removeClass("errorInput");		
	
	if(handle=="" && email=="") {
		$("#handleErrorMsg").show();
		$("#TI_handle").addClass("errorInput");
		$("#emailErrorMsg").show();
		$("#TI_email").addClass("errorInput");		
		isValid = false;
	}

	if(handle!="" && email!="") {
		$("#handleErrorMsg").show();
		$("#TI_handle").addClass("errorInput");
		$("#emailErrorMsg").show();
		$("#TI_email").addClass("errorInput");		
		isValid = false;
	}
	
	if (isValid) {
		submitForm("recoverPasswordForm");
	}
}

function submitForm(formName)
{
	setTimeout(function(){ document.forms[formName].submit() }, 100);
}

function validateEmail(email)
{
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	return email.match(re)
}
