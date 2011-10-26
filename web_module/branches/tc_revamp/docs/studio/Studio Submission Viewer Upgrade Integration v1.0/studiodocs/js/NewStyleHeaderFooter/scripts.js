/**
 * Author: TCSDEVELOPER
 * Version: 1.1
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 * 
 * Description: Misc Javascript code for studio website.
 *
 * Version 1.1 (Studio Submission Viewer Upgrade Integration v1.0) Change notes:
 *    - Added functions for handling new submission viewer.
 *
 */ 
jQuery(document).ready(function() {

    var ua = navigator.userAgent;

    function closeLoginForm(text) {
        setTimeout('$("#login_link").text("' + text + '");$("#login_link").css("background-image","url(i/NewStyleHeaderFooter/blue_small_arrow.png)");$("#login_link").css("color","#888");', 1000);

        $("#loginform").animate({ height: "0px" }, 1000);

        setTimeout('$("#ready_engage").css("display","block");', 500);
        setTimeout('$("#loginform form").hide();', 500);

        /*
        this line is a hack for ie6.
        when the loginform is closed, it appears again on ie6, that's why I added this line to verify if the browser is ie6 and hide it when the closing animation is done.
        */
        if (ua.indexOf('MSIE 6') != -1) setTimeout('$("#loginform").css("display","none");', 1014);
    }


    $("#login_link").click(function() {
        //if the login form is hidden and 'Login' clicked
        var txt = $("#login_link").text();
        if (txt == "Login") {



            setTimeout('$("#login_link").text("Close Login");$("#login_link").css("background-image","url(i/NewStyleHeaderFooter/blue_small_arrow_down.png)");', 1000);
            $("#loginform").animate({ height: "90px" }, 1000);

            setTimeout('$("#ready_engage").css("display","none");', 500);
            $("#login_link").css("color", "#359cd3");
            $("#loginform form").show();


        }
        //if the login form is shown and 'Close Login' clicked
        else if (txt == "Close Login") {
            closeLoginForm('Login');
        }
    });

    //clicking on "Login" button
    $("#right .button").click(function() {

        $("#loginform form").submit()
    });

    $("#logout_link").click(function() {
        //Do nothing...  Keeping here in case ajax is added in the future.	
    });

    /*'View Full Size' Link*/
    $(".viewFullSize").click(function() {
        // Get data
        var parentObj = $($($(this).parent().get(0)).parent().get(0));
        var subId = $(".subId", parentObj).text();

        // get image source
        var previewImgBase = $(".prevImg", parentObj.parent()).children("img").attr("src");

        // set download link
        $("#downloadLink").attr("href", "?module=DownloadSubmission&sbmid=" + subId);

        $('#contentSubmissions').hide();
        $('#contentImgFullSize').show();

        $("#contentImgFullSize .control").hide()
        $("#contentImgFullSize .noControl").show()

        // Scroll to top
        $("html").animate({ scrollTop: 0 }, "slow");

        var previewImg = $("#contentImgFullSize .previewImg");
        var img = $("img", previewImg);

        // Add loading background
        previewImg.addClass("loading");
        // Hide the image
        img.hide();

        // Set submission id
        $("#contentImgFullSize .subId").text(subId);

        // NOTE:
        //     Set timeout to show the loading spinner
        setTimeout(function() {
            img.load(function() {
                previewImg.removeClass("loading");
                $(this).fadeIn("slow");

            }).attr("src", previewImgBase).attr("alt", subId);
        }, 1000);

        return false;
    });
    $(".viewFullSizeMulti").click(function() {
        // Get data
        var parentObj = ($($($($(this).parent().get(0)).parent().get(0))).parent('.previewImg').length == 1)
                        ? $($($($($(this).parent().get(0)).parent().get(0))).parent().get(0)) 
                        : $($($(this).parent().get(0)).parent().get(0));
        var controlObj = parentObj.siblings(".control");
        var subId = $(".subId", parentObj.parent()).text();
        var curItem = parseInt($(".curItem", controlObj).text());
        var totalCount = parseInt($(".totalCount", controlObj).text());

        // get image source
        var previewImgBase = $(".prevImg" + curItem, parentObj.parent()).children("img").attr("src");

        // set download link
        $("#downloadLink").attr("href", "?module=DownloadSubmission&sbmid=" + subId);

        $('#contentSubmissions').hide();
        $('#contentImgFullSize').show();

        $("#contentImgFullSize .noControl").hide()
        $("#contentImgFullSize .control").show()

        // Scroll to top
        $("html").animate({ scrollTop: 0 }, "slow");

        var previewImg = $("#contentImgFullSize .previewImg");
        var img = $("img", previewImg);

        // Add loading background
        previewImg.addClass("loading");
        // Hide the image
        img.hide();


        // Set current item text
        $("#contentImgFullSize .curItem").text(curItem);
        // Set total count
        $("#contentImgFullSize .totalCount").text(totalCount);
        // Set submission id
        $("#contentImgFullSize .subId").text(subId);

        // NOTE:
        //     Set timeout to show the loading spinner
        setTimeout(function() {
            img.load(function() {
                previewImg.removeClass("loading");
                $(this).fadeIn("slow");

            }).attr("src", previewImgBase).attr("alt", subId);
        }, 1000);

        return false;
    });
    /*'Back To Submissions' Link*/
    $("#backToSubmissions").click(function() {
        $('#contentImgFullSize').hide();
        $('#contentSubmissions').show();

        return false;
    });

    /*The Next Preview Image Button*/
    $("#contentSubmissions .control .btnNext").click(function() {
        var parentObj = $($(this).parent().get(0));
        var previewImg = parentObj.siblings(".previewImg");
        var img = $("img", previewImg);
        var curItem = parseInt($(".curItem", parentObj).text());
        var totalCount = parseInt($(".totalCount", parentObj).text());

        // Increase curItem mod totalCount
        curItem = (curItem == totalCount) ? 1 : (curItem + 1);

        $("ul", previewImg).animate({ marginLeft: -223*(curItem-1) }, 'slow');
        $(".curItem", parentObj).text(curItem);
        return false;
    });
    /*The Previous Preview Image Button*/
    $("#contentSubmissions .control .btnPrevious").click(function() {
        var parentObj = $($(this).parent().get(0));
        var previewImg = parentObj.siblings(".previewImg");
        var img = $("img", previewImg);
        var curItem = parseInt($(".curItem", parentObj).text());
        var totalCount = parseInt($(".totalCount", parentObj).text());

        // Decrease curItem mod totalCount
        curItem = (curItem == 1) ? totalCount : (curItem - 1);

        $("ul", previewImg).animate({ marginLeft: -223 * (curItem - 1) }, 'slow');
        $(".curItem", parentObj).text(curItem);
        return false;
    });
    /*The Next Preview Image Button*/
    $("#contentImgFullSize .control .btnNext").click(function() {
        var parentObj = $($(this).parent().get(0));
        var previewImg = parentObj.siblings(".previewImg");
        var img = $("img", previewImg);
        var curItem = parseInt($(".curItem", parentObj).text());
        var totalCount = parseInt($(".totalCount", parentObj).text());
        var subId = parseInt($(".subId", parentObj.parent()).text());

        var baseElementObj = $("#sub"+subId);


        // Increase curItem mod totalCount
        curItem = (curItem == totalCount) ? 1 : (curItem + 1);

        // get image source
        var previewImgBase = $(".prevImg" + curItem, baseElementObj).children("img").attr("src");

        // NOTE:
        //     Set timeout to show the loading spinner
        setTimeout(function() {
            img.load(function() {
                previewImg.removeClass("loading");
                $(this).fadeIn();

                // Set current item text
                $(".curItem", parentObj).text(curItem);
            }).attr("src", previewImgBase);
        }, 0);

        return false;
    });
    /*The Previous Preview Image Button*/
    $("#contentImgFullSize .control .btnPrevious").click(function() {
        var parentObj = $($(this).parent().get(0));
        var previewImg = parentObj.siblings(".previewImg");
        var img = $("img", previewImg);
        var curItem = parseInt($(".curItem", parentObj).text());
        var totalCount = parseInt($(".totalCount", parentObj).text());
        var subId = parseInt($(".subId", parentObj.parent()).text());

        var baseElementObj = $("#sub"+subId);

        // Decrease curItem mod totalCount
        curItem = (curItem == 1) ? totalCount : (curItem - 1);

        // get image source
        var previewImgBase = $(".prevImg" + curItem, baseElementObj).children("img").attr("src");

        // NOTE:
        //     Set timeout to show the loading spinner
        setTimeout(function() {
            img.load(function() {
                previewImg.removeClass("loading");
                $(this).fadeIn();

                // Set current item text
                $(".curItem", parentObj).text(curItem);
            }).attr("src", previewImgBase);
        }, 0);

        return false;
    });
});