/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.

 */
/**
*	Scripts
**/

$.ajaxTransport("+*", function( options, originalOptions, jqXHR ) {
	//var hostname = window.location.hostname;
	if ( originalOptions.url.indexOf('http') == -1 ){
		return;
	}
    if(jQuery.browser.msie && window.XDomainRequest) {
        var xdr;        
        return {
            send: function( headers, completeCallback ) {
                // Use Microsoft XDR
                xdr = new XDomainRequest();
                xdr.open("get", options.url);
                xdr.onload = function() {
                    if(this.contentType.match(/\/xml/)){
                        var dom = new ActiveXObject("Microsoft.XMLDOM");
                        dom.async = false;
                        dom.loadXML(this.responseText);
                        completeCallback(200, "success", [dom]);
                    }else{
                        completeCallback(200, "success", [this.responseText]);
                    }
                };
                xdr.ontimeout = function(){
                    completeCallback(408, "error", ["The request timed out."]);
                };
                xdr.onerror = function(){
                    completeCallback(404, "error", ["The requested resource could not be found."]);
                };
                xdr.send();
          },
          abort: function() {
              if(xdr)xdr.abort();
          }
        };
    }
});
$.ajaxSetup({
	cache: false,
	error:function(x,e){
		if(x.status==0){
		alert('You are offline!!\n Please Check Your Network.');
		}else if(x.status==404){
		alert('Requested URL not found.');
		}else if(x.status==500){
		alert('Internel Server Error.');
		}else if(e=='parsererror'){
		alert('Error.\nParsing JSON Request failed.');
		}else if(e=='timeout'){
		alert('Request Time out.');
		}else {
		alert('Unknow Error.\n'+x.responseText);
		}
	}
});

var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
gap,
indent,
meta = {    // table of character substitutions
    '\b': '\\b',
    '\t': '\\t',
    '\n': '\\n',
    '\f': '\\f',
    '\r': '\\r',
    '"' : '\\"',
    '\\': '\\\\'
},
rep;

function quote(string) {
	//If the string contains no control characters, no quote characters, and no
	//backslash characters, then we can safely slap some quotes around it.
	//Otherwise we must also replace the offending characters with safe escape
	//sequences.

	escapable.lastIndex = 0;
	return escapable.test(string) ?
	    string.replace(escapable, function (a) {
	        var c = meta[a];
	        return typeof c === 'string' ? c :
	            '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
	    }) : string;
}

$(document).ready(function () {
	$(".optionsContainer .columns").css("margin-right", "20px");
    $(".submitBtn").live("click", function () {
        $(this).closest("form").submit();
    });

    $(".searchBtn").live("click", function (){
    	var searchSelect = $("#searchSelect").val();
    	$("#contestName").val($.trim($("#contestName").val()));
    	if (searchSelect == "SearchContest") {
    		$(this).closest("form").submit();
    	} else {
    		self.location.href = $("#searchMemberLink").text()+$("#contestName").val();
    	}    	
    });
    
    $(".advSearchLink").live("click", function (){
    	var searchSelect = $("#searchSelect").val();
    	$("#contestName").val($.trim($("#contestName").val()));
    	if (searchSelect == "SearchContest") {
    		$(this).closest("form").submit();
    	} else {
    		self.location.href = $("#advancedSearchMemberLink").text();
    	}
    	
    });
    
    // input hint
    $("input.hint").focus(function () {
        var hint = $(this);
        var val = "Keyword";
        if ($(this).hasClass("hint")) {
            $(this).val("");
            $(this).removeClass("hint");            
        }
    });
    $("input.hint").blur(function() {
    	var hint = $(this);
        var val = "Keyword";
        if (hint.val() == "" || hint.val() == val) {
            hint.addClass("hint");
            hint.val(val);
        }
    });
    $("input.hint").each(function() {
    	var hint = $(this);
    	if ($.trim(hint.val()) == "") {
    		hint.val("Keyword");
    	}
    	if ($.trim(hint.val()) != "Keyword") {
    		hint.removeClass("hint");
    	}
    });
  
    // page setting pull down
    $(".user li.pageSetting").click(function (e) {
        if ($(e.target).parents("a").attr("class") == "hoverBtn") {
            var $me = $(this);
            if (!$me.hasClass("hover")) {
                $me.prev().css("background", "none");
                $me.addClass("hover");
                $me.children(".subNav").removeClass("hide");
            }
        }
    });

    // close page setting
    //Click on UPDATE on Page Settings
    $(".user li.pageSetting .redBtn").click(function () {
        $(".user li.pageSetting").css("background", "url(i/name-divider.png) right 1px no-repeat");
        $(".user li.pageSetting").removeClass("hover");
        $(".user li.pageSetting").children(".subNav").addClass("hide");
        setPageSettingsCookie($("#userId").html());
    })
    
    //Click on CANCEL
    $(".user li.pageSetting .greyBtn").click(function () {
        $(".user li.pageSetting").css("background", "url(i/name-divider.png) right 1px no-repeat");
        $(".user li.pageSetting").removeClass("hover");
        $(".user li.pageSetting").children(".subNav").addClass("hide");
    })

    // top nav pull down
    $("#topNav>ul>li").hover(
		function () {
		    var $me = $(this);
		    if ($me.find(".subNav").length != 0) {
		        $me.children("a").addClass("firstLevel");
		        $me.children("a").css("text-shadow", "#333333 0 -1px 0");
		        $me.children(".subNav").removeClass("hide");
		        if ($.browser.msie && $.browser.version == 6) {
		            $("#topNav .subNav .content ul li a span.over").width($("#topNav .subNav .content ul li a").width());
		        }
		    }
		},
		function () {
		    var $me = $(this);
		    $me.children("a").removeClass("firstLevel");
		    $me.children(".subNav").addClass("hide");
		}
	);

    // topTen hint
    $(".topTen a.hint").click(function () {
        switch ($(".topTenSelect").val()) {
            case "topTenAlgo":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedCoders');
                break;
            case "topTenAlgoSchools":
                openWin('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topSchools', 'schoolrankinfo', 500, 500);
                break;
            case "topTenAlgoCountries":
                openWin('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topCountries', 'countryrankinfo', 500, 500);
                break;
            case "topTenDes":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedDesigners');
                break;
            case "topTenDev":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedDevelopers');
                break;
            case "topTenMM":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedMMCoders');
                break;
            case "topTenConceptualization":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedConceptors');
                break;
            case "topTenSpecification":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedSpecificators');
                break;
            case "topArchitecture":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedArchitects');
                break;
            case "topAssembly":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedAssemblers');
                break;
            case "topTestSuites":
                infoWindow('http://www.topcoder.com/tc?module=Static&d1=statistics&d2=info&d3=topRatedTesters');
                break;
            default:
                break;
        }
    });

    // contest list
    $("#contestList li .node").click(function () {
        if ($(this).hasClass("expanded")) {
            $(this).removeClass("expanded");
            $(this).addClass("collapsed");
            $(this).siblings("ul").addClass("hide");
        }
        else {
            $(this).removeClass("collapsed");
            $(this).addClass("expanded");
            $(this).siblings("ul").removeClass("hide");
        }
    });

    // filter
    $("#filterContainer .content .struct li .optionsContainer .optionBtn").click(function () {
        if ($(this).hasClass("collapsed")) {
            $(this).html("Hide options");
            $(this).removeClass("collapsed");
            $(this).addClass("expanded");
            $("#filterContainer .content .struct").addClass("full");
            $("#filterContainer .content .struct .more").removeClass("hide");
            $("#filterContainer .content>.rightSide>.inner").addClass("expanded");
            $(".dateSelect").each(function(index,element){
            	$(element).trigger("change");
            });
            $(".optionsContainer .columns").css("margin-right","0px");
			$("#filterContainer li.buttons").css("text-align","right");
        }
        else {
            $(this).html("Show more options");
            $(this).removeClass("expanded");
            $(this).addClass("collapsed");
            $("#filterContainer .content .struct").removeClass("full");
            $("#filterContainer .content .struct .more").addClass("hide");
            $("#filterContainer .content>.rightSide>.inner").removeClass("expanded");
            $("#errors ul").empty();
            $("#errors").hide();
            $(".optionsContainer .columns").css("margin-right","20px");
			$("#filterContainer li.buttons").css("text-align","left");
        }
    });

    $(".optionsContainer li.first input[type='checkbox']").click(function () {
        if ($(this).attr("checked")) {
            $(this).parent().siblings().children("input[type='checkbox']").attr("checked", true);
        }
        else {
            $(this).parent().siblings().children("input[type='checkbox']").attr("checked", false);
        }
    });

    $(".optionsContainer li.more input[type='checkbox']").click(function () {
        if ($(this).attr("checked")) {
            if (!$(this).parent().hasClass("sub")) {
                $(this).parent().nextAll().each(function () {
                    if ($(this).hasClass("sub")) {
                        $(this).children().attr("checked", true);
                    }
                    else {
                        return false;
                    }
                });
            }
            else {
                var allSubChecked = true;
                $(this).parent().prevAll().each(function () {
                    if (!$(this).hasClass("sub")) {
                        return false;
                    }
                    else if (!$(this).children().attr("checked")) {
                        allSubChecked = false;
                    }
                });
                $(this).parent().nextAll().each(function () {
                    if (!$(this).hasClass("sub")) {
                        return false;
                    }
                    else if (!$(this).children().attr("checked")) {
                        allSubChecked = false;
                    }
                });
                if (allSubChecked) {
                    $(this).parent().prevAll().each(function () {
                        if (!$(this).hasClass("sub")) {
                            $(this).children().attr("checked", true);
                            return false;
                        }
                    });
                }
            }
            var allChecked = true;
            $(this).parent().siblings(".more").children("input[type='checkbox']").each(function () {
                if (!$(this).attr("checked")) {
                    allChecked = false;
                }
            })
            if (allChecked) {
                $(this).parent().siblings(".first").children("input[type='checkbox']").attr("checked", true);
            }
        }
        else {
            $(this).parent().siblings(".first").children("input[type='checkbox']").attr("checked", false);
            if (!$(this).parent().hasClass("sub")) {
                $(this).parent().nextAll().each(function () {
                    if ($(this).hasClass("sub")) {
                        $(this).children().attr("checked", false);
                    }
                    else {
                        return false;
                    }
                });
            }
            else {
                $(this).parent().prevAll().each(function () {
                    if (!$(this).hasClass("sub")) {
                        $(this).children().attr("checked", false);
                        return false;
                    }
                });
            }
        }
    });
    
    // Only Numeric to minPrize and maxPriza inputs
    $("input[name=minPrize]").keyup(function () { 
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });
    $("input[name=maxPrize]").keyup(function () { 
        this.value = this.value.replace(/[^0-9\.]/g,'');
    });
    
    // Block # in contest name (this cause Internal Server Error
    $("input[name=contestName]").keyup(function () { 
        this.value = this.value.replace('#','');
    });

    // clear filter
    $("#filterContainer .greyBtn").click(function () {
    	$("input[name=contestName]").val('');
        $(".optionsContainer input[type='checkbox']").attr("checked", false);
        $("select.dateSelect").val("Select");
        $("select.dateSelect").trigger("change");
        $("#filterContainer select.select").val("Select");
        $("#filterContainer select.select").trigger("change");
        $("#filterContainer .datepicker").val("MM/ DD/ YYYY");
        $(".priceFilter input:eq(0)").val("0");
        $(".priceFilter input:eq(1)").val("6000+");
        $("#slider").slider({ values: [0, 6000] });
        $("#errors ul").empty();
    });

    if ($(".datepicker").length > 0) {
        $(".datepicker").datepicker({
            showOn: "button",
            buttonImage: "../i/tc/calendar-icon.png",
            buttonImageOnly: true
        });
        $(".dp-choose-date").click(function () {
            $(this).prev().trigger("focus");
        });
    }

    $(".dateSelect").live("change", function () {
        switch ($(this).val()) {
            case "BEFORE":
            case "AFTER":
            case "ON":
                $(this).next().css("display", "block");
                $(this).next().children(".between").addClass("hide");
                break;
            case "BETWEEN_DATES":
                $(this).next().css("display", "block");
                $(this).next().children(".between").removeClass("hide");
                break;
            default:
                $(this).next().css("display", "none");
                $(this).next().children(".between").addClass("hide");
                break;
        }
    });

    // td hover
    $("#contestTable tbody tr:nth-child(even)").addClass("even");
    $("#contestTable tbody tr").live("hover",
		function () {
		    $("#contestTable tbody tr.hover").removeClass("hover");
		    $(this).addClass("hover");
		    $(".contestTable .tableContainer .tdHover:eq(0)").css("top", ($(this).offset().top - $(".contestTable .tableContainer").offset().top) + "px");
		    $(".contestTable .tableContainer .tdHover:eq(1)").css("top", ($(this).offset().top - $(".contestTable .tableContainer").offset().top) + $(this).height() - 2 + "px");
		    $(".contestTable .tableContainer .tdHover").removeClass("hide");
		}
		,
		function () { }
	);
    $("#contestTable tbody tr").live("mouseleave",
		function () {
		    $("#contestTable tbody tr.hover").removeClass("hover");
		    $(".contestTable .tableContainer .tdHover").addClass("hide");
		},
		function () { }
	)
    $(".tableContainer").live("hover",
		function () { },
		function () {
		    $("#contestTable tbody tr.hover").removeClass("hover");
		    $(".contestTable .tableContainer .tdHover").addClass("hide");
		}
	)

    // slider
    if ($("#slider").length > 0) {
        $("#slider").slider({
            range: true,
            min: 0,
            max: 6000,
            values: [0, 6000],
            slide: function (event, ui) {
                var value0 = ui.values[0];
                var value1 = ui.values[1];
                $(".priceFilter input:eq(0)").val(value0 == 6000 ? "6000+" : value0);
                $(".priceFilter input:eq(1)").val(value1 == 6000 ? "6000+" : value1);
            }
        });
        var value0 = $("#slider").slider("values", 0);
        var value1 = $("#slider").slider("values", 1);
        $(".priceFilter input:eq(0)").val(value0 == 6000 ? "6000+" : value0);
        $(".priceFilter input:eq(1)").val(value1 == 6000 ? "6000+" : value1);
        $("#slider").removeClass("ui-corner-all");
        $(".ui-slider-handle").removeClass("ui-corner-all");
        $(".ui-slider-handle").removeClass("ui-state-default");

        $(".priceFilter input").change(function () {
            var value0 = parseInt($(".priceFilter input:eq(0)").val());
            var value1 = parseInt($(".priceFilter input:eq(1)").val());
            if (value0 > value1) {
                value0 = value1;
            }
            if (value1 < value0) {
                value1 = value0;
            }
            $("#slider").slider({ values: [value0 == "6000+" ? 6000 : value0, value1 == "6000+" ? 6000 : value1] });
        });
    }

    $("#topNav li a.current,#topNav .subNav .content ul li a span").css("text-shadow", "#333333 0 -1px 0");

    // browser fixes
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/chrome\/([\d.]+)/) != null) {
        $("#filterContainer .content .struct li .moreOptions .dateFilter p img").css("top", "2px");
    }
    if (ua.match(/version\/([\d.]+).*safari/) != null) {
        $("#filterContainer .content .struct li .moreOptions .dateFilter p img").css("top", "2px");
    }

    if ($.browser.msie && $.browser.version == 6) {
        DD_belatedPNG.fix("#header,.logo,#topNav li a.current .arrow,.search .icon,.bulletLink,#name .subNav .head,#name .subNav .head .inner,#name .subNav .content,#name .subNav .content .rightSideCustom,#name .subNav .content .innerSide,#name .subNav .foot,#name .subNav .foot .rightSide,#name .subNav .foot .inner,.over,#contestList li.current .arrow,.ui-slider-handle");
        $("#contestList li, .contestTable .tableContainer, .tools .content li, #newsContainer .content").css("zoom", "1");
        $("#topNav .subNav .content ul li").hover(
			function () {
			    $(this).find(".over").css("display", "block");
			}
			,
			function () {
			    $(this).find(".over").css("display", "none");
			}
		);
    }
    if ($.browser.msie && $.browser.version == 7) {
        $("#contestList li.current a span,#contestList li ul").css("zoom", "1");
    }
    /*
    if ($("#userId").html() != "-1") {
    	($("#userId").html());
    }*/
    
    applyPageSettingsFromCookie($("#userId").html());
});

/**
* Determines if the object is defined.
*
* @param obj - the object.
* @return the flag indicating if the object is defined.
*/
function isDefined(obj) {
    return typeof (obj) != "undefined" && obj != null;
}

function mycarousel_initCallback(carousel) {
    $("#newsHeadLineCarouselNav a").bind("click", function () {
        carousel.scroll($.jcarousel.intval($(this).text()));
        $(this).parents("ul").find(".active").removeClass("active");
        $(this).parent().addClass("active");
        return false;
    });
};

function mycarousel_itemVisibleOutCallback(carousel, item, idx, state) {
    $("#newsHeadLineCarouselNav").find(".active").removeClass("active");
    $("#newsHeadLineCarouselNav li").eq(idx % $("#newsHeadLineCarouselNav li").length - 1).addClass("active");
}

function openWin(url, name, w, h) {
    var left = Math.round((screen.availWidth - w) / 2);
    var top = Math.round((screen.availHeight - h) / 2);
    win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=yes,menubar=no"
            + ",width=" + w + ",height=" + h
            + ",left=" + left + ",top=" + top);
    win.location.href = url;
    win.focus();
}

function infoWindow(url) {
    var width = 300
    var height = 250
    var left = (screen.availWidth - width) / 2;
    var top = (screen.availHeight - height) / 2;
    OpenWin = this.open(url, "Info",
            "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes"
            + ",width=" + width + ",height=" + height
            + ",left=" + left + ",top=" + top);
}

// preloader 
function modalPreloader(dom, topMargin) {
    $('#new-modal').append('<div id="preloaderModal"><div class="spinnerRunTips">Loading...</div></div>');
    addressLoadModal('#preloaderModal');
    if (topMargin) $('#preloaderModal').css({ 'margin-top': topMargin });
}

/** modal **/
addressPositionModal = function () {
    var wWidth = window.innerWidth;
    var wHeight = window.innerHeight;

    if (wWidth == undefined) {
        wWidth = document.documentElement.clientWidth;
        wHeight = document.documentElement.clientHeight;
    }

    var boxLeft = parseInt((wWidth / 2) - ($("#new-modal").width() / 2));
    var boxTop = parseInt((wHeight / 2) - ($("#new-modal").height() / 2));

    // position modal
    $("#new-modal").css({
        'margin': boxTop + 'px auto 0 ' + boxLeft + 'px'
    });

    $("#modalBackground").css("opacity", "0.6");

    if ($("body").height() > $("#modalBackground").height()) {
        $("#modalBackground").css("height", $("body").height() + "px");
    }
}

addressLoadModal = function (itemId) {
    $('#modalBackground').show();
    $(itemId).show();
    addressPositionModal();
}
addresscloseModal = function () {
    $('#modalBackground').hide();
    $('.popup').hide();
    $('#preloaderModal').remove();
}


/**
 * This function will update/create a cookie containing the user settings
 * 
 * @param userId - UserId of the user who has logged in 
 */
function setPageSettingsCookie(userId){
	var settings;
	settings = "\"activeContests\":" + $("#activeContests").attr("checked") + ",";
	settings += "\"topcoderNetworks\":" + $("#topcoderNetworks").attr("checked") + ",";
	settings += "\"memberRating\":" + $("#memberRating").attr("checked") + ",";
	settings += "\"memberOfMonth\":" + $("#memberOfMonth").attr("checked") + ",";
	settings += "\"topDevelopers\":" + $("#topDevelopers").attr("checked") + ","; 
	settings += "\"noOftopcoderNews\":" + $("#noOftopcoderNews").val();
	settings = "{" + settings+ "}";
	$.setCookie(userId+"_settings",settings);
	applyPageSettingsFromCookie(userId);
}

/**
 * This function will apply the Page Settings from the cookie pertaining to the logged in  user. 
 * This will cause some panels to be hidden
 * 
 * @param userId - UserId of the user who has logged in 
 */
function applyPageSettingsFromCookie(userId){
	var settings = $.getCookie(userId+"_settings");
	if (isDefined(settings)){
		$(".pageSetting #activeContests").attr("checked",settings.activeContests);
		$(".pageSetting #topcoderNetworks").attr("checked",settings.topcoderNetworks);
		$(".pageSetting #memberRating").attr("checked",settings.memberRating);
		$(".pageSetting #memberOfMonth").attr("checked",settings.memberOfMonth);
		$(".pageSetting #topDevelopers").attr("checked",settings.topDevelopers);
		$(".pageSetting #noOftopcoderNews").val(settings.noOftopcoderNews);
		$(".pageSetting #noOftopcoderNews option[value='" + settings.noOftopcoderNews + "']").attr('selected', 'selected');
		$(".infoBox").each(function(){
			if (isDefined(settings.activeContests)){
				if ($(this).hasClass("activeContests")){
					togglePanels($(this),$(".pageSetting #activeContests"));
				}
			}
			if (isDefined(settings.topcoderNetworks)){
				if ($(this).hasClass("networks")){
					togglePanels($(this),$(".pageSetting #topcoderNetworks"));
				}
			}
			if (isDefined(settings.memberRating)){
				if ($(this).hasClass("myProfile")){
					togglePanels($(this),$(".pageSetting #memberRating"));
				}
			}
			if (isDefined(settings.memberOfMonth)){
				if ($(this).hasClass("manOfM")){
					togglePanels($(this),$(".pageSetting #memberOfMonth"));
				}
			}
			if (isDefined(settings.topDevelopers)){
				if ($(this).hasClass("topTen")){
					togglePanels($(this),$(".pageSetting #topDevelopers"));
				}
			}
		});
		hideTopCoderNews($("#noOftopcoderNews").val());
	} else {
		hideTopCoderNews($("#noOftopcoderNews").val());
	}
	
	
}

/**
 * This functions hides the topcoder news that are above the limit specified 
 * 
 * @param noOfTopCoderNews - No of TopCoder News that should be visible
 */
function hideTopCoderNews(noOfTopCoderNews){
	var tree_li = $("#newsContainer .content ul #item");
	var max_listCount = parseInt(noOfTopCoderNews);
	tree_li.each(function(n,item){
		$(item).show();
	});
	tree_li.each(function(n,item){
		if(n > (max_listCount -1 )) {
			$(item).hide();
		}
	});
}
/**
 * This function toggles the panels. It will hide the panel if it is currently visible and 
 * will show the panel if it is currently hidden
 * 
 * @param infoBox - Object Representing the  
 * @param setting
 */
function togglePanels(infoBox, setting) {
	if (setting.attr("checked")){
		infoBox.show();
	} else {
		infoBox.hide();
	}
}

jQuery.support.cors = true;

/**
 * Populates the News Banner by doing an AJAX call to the specified URI
 * @param sender
 * @param uri
 */
function getNewsBanner(sender, uri) {
	$.ajax({
        url: uri,
        crossDomain : true,
        dataType : 'xml',
        success: function(data) {
        	var $xml = $(data);
        	var items = new Array();
            $xml.find("item").each(function() {
            	var $this = $(this);
                var description = $($this.find('description').next().text());
                description.find('br').remove();
                description.find('br').remove();
                description.find('br').remove();
                items.push(description);
            });
            for( var i = 0; i < items.length ; i++) {
            	$('.topBanner').append(items[i]);
            }
        },
        error: function(xhr, textStatus, errorThrown){
        	alert('Error Loading News Banner : Text Status - '+ textStatus + ' Error Thrown - '+ errorThrown);
        }
    });
}

/***
 * Populates the HeadLinesFeed by doing an AJAX call to the specified URI
 * @param sender
 * @param uri
 */
function getHeadLinesFeed(sender, uri) {
	$.ajax({
        url: uri,
        crossDomain : true,
        dataType : "XML",
        success: function(data) {
        	var $xml = $(data);
        	var items = new Array();
            $xml.find("item").each(function() {
            	var $this = $(this);
                var item = {
                        title: $this.find('title').text(),
                        link: $this.find('link').text(),
                        description : $this.find('description').text(),
                        content: $this.find('description').next().text(),
                        pubDate: $this.find('pubDate').text(),
                        author: $this.find('author').text()
                };
                items.push(item);
            });
            var $newsHeadLineCarousel = $('<ul class="headline"></ul>');
            for( var i = 0; i < items.length && i < 5; i++) {
            	var $newsHeadLineCarouselLi = $('<li></li>');
            	$newsHeadLineCarouselLi.append($('<h1><a href="'+items[i].link +'">'+items[i].title +'</a></h1>'));
            	var content = $(items[i].content);
            	var img = content.find('img');
            	$newsHeadLineCarouselLi.append(img);
            	content.remove('img');
            	if ( img.length == 0 ) {
            		$newsHeadLineCarouselLi.append(items[i].description);
            	} else {
            		$newsHeadLineCarouselLi.append('<p>'+ items[i].description+ '</p>');
            	}
            	
            	$newsHeadLineCarousel.append($newsHeadLineCarouselLi);
            }
            $("#newsHeadLineCarousel").append($newsHeadLineCarousel);
            var newsHeadLineCarouselNav = '<ul class="inline">';
            for(var i = 0; i < items.length && i < 5; i++) {
            	newsHeadLineCarouselNav += '<li><a href="#">'+(i+1)+'</a></li>';
            }
            $("#newsHeadLineCarouselNav").append(newsHeadLineCarouselNav);
            // home page news headline
            if ($("#newsHeadLineCarousel").length > 0) {
                $("#newsHeadLineCarousel").jcarousel({
                    scroll: 1,
                    auto: 5,
                    wrap: "circular",
                    initCallback: mycarousel_initCallback,
                    itemVisibleInCallback: {
                        onBeforeAnimation: mycarousel_itemVisibleOutCallback
                    },
                    // This tells jCarousel NOT to autobuild prev/next buttons
                    buttonNextHTML: null,
                    buttonPrevHTML: null
                });
            }
        },
        error: function(xhr, textStatus, errorThrown){
        	alert('Error Loading Headlines : Text Status - '+ textStatus + ' Error Thrown - '+ errorThrown);
        }
    });
}

/**
 * Gets the profile page for a user.
 * 
 * @param handle the handle of the user
 * @returns {String} the profile page of the user.
 */
function getHandleProfileLink(handle) {
	return "http://community.topcoder.com/tc?module=SimpleSearch&ha=" + handle;
}

/**
 * Populates the TopCoderNews by doing an AJAX call to the specified URI
 * 
 * @param sender
 * @param uri
 */
function getTopCoderNews(sender,uri){
	$.ajax({
        url: uri,
        crossDomain : true,
        dataType : "xml",
        timeout : 20000,
        success: function(data) {
        	var $xml = $(data);
        	var items = new Array();
            $xml.find("item").each(function(n, item){
            	if ( n > 5 ) {
            		return;
            	}
            	var $this = $(this);
                var item = {
                        title: $this.find('title').text(),
                        link: $this.find('link').text(),
                        description: $this.find('description').next().text(),
                        pubDate: $this.find('pubDate').text(),
                        author: $this.find('pubDate').next().text(),
                        guid: $this.find('guid').text(),
                        discusslink: $this.find('discusslink').text(),
                        details : $this.find('details').text()
                };
                items.push(item);
            	
            });
            var $ul = $('<ul></ul>');
            for( var i = 0; i < items.length && i < 5; i++) {
            	var $item = $('<li id="item"></li>');
                var $h2 =$('<h2><a href="' + items[i].link +'" title="' + items[i].title+ '">' + items[i].title + '</a></h2>');
                var $entry = $('<div class="entry"><p> ' + items[i].description +'</p></div>');
                var $meta = $(' <div class="meta"><p class="byline">Posted on ' + items[i].pubDate + ' by <strong><a class="coderTextOrange" href="' + getHandleProfileLink(items[i].author) + '">' + items[i].author + '</a></strong></p></div>');
                var $links = $('<p class="links"><a href="' + items[i].guid + '" title="Permanent Link to' +items[i].title + '" class="redlink">Permalink</a></p>');
                if (items[i].discusslink != "") {
                	var $discussLink = $('<b> | </b><a href="' + items[i].discusslink + '" class="redlink">Discuss This</a>');
                	$links.append($discussLink);
                }
				if (items[i].details != "") {
					var $discussLink = $('<b> | </b><a href="' + items[i].details + '" class="redlink">Details</a>');
                	$links.append($discussLink);
				}
				var $clear = $('<div class="clear"></div>');
				$meta.append($links);
				$meta.append($clear);
				$item.append($h2);
				$item.append($entry);
				$item.append($meta);
				$ul.append($item);
            }
            sender.append($ul);
        },
        error: function(xhr, textStatus, errorThrown){
        	alert('Error Loading News : Text Status - '+ textStatus + ' Error Thrown - '+ errorThrown);
        },
        complete :  function(xhr,textStatus){
        	applyPageSettingsFromCookie($("#userId").html());
        }
        
    });
}

/**
 * This function shows the current active TopTen details and hides the others
 * @param topTenID
 */
function swapTopTen(topTenID){
    $('#topTenAlgo').hide();
    $('#topTenAlgoSchools').hide();
    $('#topTenAlgoCountries').hide();
    $('#topTenDes').hide();
    $('#topTenDev').hide();
    $('#topTenMM').hide();
    $('#topTenConceptualization').hide();
    $('#topTenSpecification').hide();
    $('#topArchitecture').hide();
    $('#topAssembly').hide();
    $('#topTestSuites').hide();
    $('#'+topTenID).show();
}