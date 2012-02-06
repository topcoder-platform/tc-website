/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */

//initialize sorters first
jQuery.fn.dataTableExt.oSort['usmoney-asc']  = function(x,y) {
	x = cleanAmount(x);
	y = cleanAmount(y);
    return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};
 
jQuery.fn.dataTableExt.oSort['usmoney-desc'] = function(x,y) {
	x = cleanAmount(x);
	y = cleanAmount(y);
    return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};

$(function () {
    var category = $("#category").html();
    var type = $("#contestType").html();
    // Load the Filters from the cookie only when there are no types given
    // Because these are specific searches
    if (!(isDefined(type) && type.length > 0)) {
    	loadFiltersFromCookie(category);
    }
    var parameter;
    if (category == "ActiveContests") {
        var types = new Array();
        if (type.length > 0) {
            types.push(type);
            // only check types, not the catalog
            var chckboxes = $("input[type='checkbox'][name='" + type + "']");
            if (chckboxes.length > 0) {
            	chckboxes.each(function() {
            		if(!$(this).parent().hasClass('first')) {
                		$(this).attr("checked", true);
                	}
            	});
            }
        }
    } 
    
    if (category == "SearchContests") {
    	$("input[name='contestName']").val($("#contestName").val());
    } 
       
    $("a.applyFilterBtn").live("click", {cat :category, type : type} ,function (event) {
        $(this).attr("disabled", "disabled");
        search(event.data.cat, event.data.type,true);
    });
    
    $("#contestTable_length select").live("change", function(){
    	$.setCookie("page_count",$(this).val(),{expires : 365});
    });
    
    search(category,type,false);
});

function updateTypeLink(type) {
	$("#contestList li ul li").each(function() {
		var text = $("a", $(this)).text();
		if ($(this).hasClass("current") && text != type) {
			$(this).removeClass("current");
			var span = $("a span", $(this));
			$("a", $(this)).html(span.text());
			$("span.arrow", $(this)).remove();
		} else {
			if (text == type) {
				
				$(this).addClass("current");
				$(this).append("<span class='arrow'/>");
			
				$("a", $(this)).html("<span style='font-weight:bold;'>" + text + "</span>");
				
				var btn = $("a.node", $(this).parent().parent());
				if (btn.hasClass("collapsed")) {
					btn.click();
				}
			}
		}
	});
	
}

/**
* Constructs the parameter for AJAX request.
*
* @param category - the category.
* @param name - the contest name.
* @param catalog - the catalog.
* @param types - the array of contest types.
* @param winnerHandle - the winner handle.
* @param minPrize - the lower bound of the contest prize.
* @param maxPrize - the upper bound of the contest prize.
* @param dateFilters - the array containing the array of date interval type, first date and second date of registration/submission/finalization/review date.
* @return the constructed parameter for AJAX request.
*/
function constructParameter(category, name, catalog, types, winnerHandle, minPrize, maxPrize, dateFilters) {
    var columnName;
    var subDate, regDate,finalDate, revDate;
    if (category == "ActiveContests") {
        columnName = "registrationEndDate";
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        finalDate = dateFilters[2];
    } else if (category == "ContestStatus") {
        columnName = "submissionDueDate";
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        finalDate = dateFilters[2];
    } else if (category == "PastContests") {
        columnName = "completionDate";
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        finalDate = dateFilters[2];
    } else if (category == "UpcomingContests") {
        columnName = "registrationStart";
        regDate = dateFilters[0];
        subDate = dateFilters[1];
    } else if (category == "ReviewOpportunities") {
        columnName = "reviewStart";
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        revDate = dateFilters[2];
    } else {
        columnName = "contestStartTime";
    }
    var parameter = "{\"columnName\":\"" + quote(columnName) + "\",\"sortingOrder\":\"DESCENDING\",\"filter\":{";
    var filterParam = "";
    if (isDefined(name)) {
        filterParam += "\"contestName\":\"" + quote(name) + "\",";
    }
    if (isDefined(winnerHandle)) {
        filterParam += "\"winnerHandle\":\"" + quote(winnerHandle) + "\",";
    }
    if (isDefined(catalog)) {
        filterParam += "\"catalogs\":[\"" + quote(catalog) + "\"],";
    }
    if (isDefined(minPrize)) {
        var minPrizeName = category == "ReviewOpportunities" ? "paymentStart" : "prizeLowerBound";
        filterParam += "\"" + minPrizeName + "\":\"" + quote(minPrize) + "\",";
    }
    if (isDefined(maxPrize)) {
        var maxPrizeName = category == "ReviewOpportunities" ? "paymentEnd" : "prizeUpperBound";
        filterParam += "\"" + maxPrizeName + "\":\"" + quote(maxPrize) + "\",";
    }
    filterParam += constructDateFilter("submissionEndDate", subDate);
    filterParam += constructDateFilter("registrationStartDate", regDate);
    filterParam += constructDateFilter("contestFinalizationDate", finalDate);
    filterParam += constructDateFilter("reviewEndDate", revDate);
    filterParam += constructListFilter("types", types);
    if (filterParam.length > 0) {
        filterParam = filterParam.substring(0, filterParam.length - 1);
    }
    parameter += filterParam + "}}";
    return parameter;
}

/**
 * Searches for the contest based on the search filter
 * 
 * @param category - Category
 * @param type - Type of contest
 * @param saveCookie - boolean value to  specify whether to save the filter to a cookie
 */
function search(category,type, saveCookie){
	 var errors = new Array();
     var types = new Array();
     var dateFilters = new Array();
     $(".optionsContainer ul.options li").each(function () {
         var checkbox = $(this).find("input[type='checkbox']");
         if (checkbox.attr("checked")) {
             types.push(checkbox.attr("name"));
         }
     });
     var contestName = $("#contestName").val().length > 0 ? $("#contestName").val().replace(/^\s+/,"") : null;
     if (contestName == null) {
         $("h1.heading").children("span").hide();
     }
     var catalog = $("select[name='catalog']").val() != "Select" ? $("select[name='catalog']").val() : null;
     var winnerHandle = $("input[name='winnerHandle']").length > 0 && $("input[name='winnerHandle']").val().length > 0 ? $("input[name='winnerHandle']").val() : null;
     $(".dateFilter select.dateSelect").each(function () {
         if ($(this).val() != "Select") {
             var filter = new Array();
             filter.push($(this).val());
             if ($(this).val() != "BEFORE_CURRENT_DATE" && $(this).val() != "AFTER_CURRENT_DATE") {
                 var firstDate = $(this).siblings(".dateContainer").find("input[name='firstDate']").val();
                 if (firstDate == "MM/ DD/ YYYY") {
                     errors.push("Please specify the " + $(this).prev().html().replace(" :", "."));
                     return;
                 }
                 filter.push(firstDate);
                 if ($(this).val() == "BETWEEN_DATES") {
                     var secondDate = $(this).siblings(".dateContainer").find("input[name='secondDate']").val();
                     if (secondDate == "MM/ DD/ YYYY") {
                         errors.push("Please specify the end date of the " + $(this).prev().html().replace(" :", "."));
                         return;
                     }
                     if (getShortDateValue(firstDate) > getShortDateValue(secondDate)) {
                         errors.push("The start date of the " + $(this).prev().html().replace(" :", "") + " cannot be later than the end date.");
                         return;
                     }
                     filter.push($(this).siblings(".dateContainer").find("input[name='secondDate']").val());
                 }
             }
             dateFilters.push(filter);
         } else {
             dateFilters.push(null);
         }
     });
     var maxPrize = $("input[name='maxPrize']").val();
     if (isValidNumber(maxPrize)){
    	 maxPrize = parseInt(maxPrize);
    	 if (maxPrize < 0){
    		 errors.push("The upper bound of the prize should be a Non-negative number");
    	 }
     } else {
    	 errors.push("The upper bound of the prize is an invalid number");
     }
     var minPrize = $("input[name='minPrize']").val();
     if (isValidNumber(minPrize)){
    	 minPrize = parseInt(minPrize);
    	 if (minPrize < 0){
    		 errors.push("The lower bound of the prize should be a Non-negative number");
    	 }
     } else {
    	 errors.push("The lower bound of the prize is an invalid number");
     }
     
     if (minPrize > maxPrize) {
         errors.push("The lower bound of the prize cannot be greater than the upper bound.");
     }
     
     if (errors.length == 0) {
     	if (category == "ActiveContests") {
     		// If any of the date filters are not given for active contests, then we have to stick to our understanding of 
     		// Submit date  BEFORE_CURRENT_DATE and 
     		if (!isDefined(dateFilters[0]) && !isDefined(dateFilters[1]) && !isDefined(dateFilters[2])){
     			dateFilters[0] = new Array();
     			dateFilters[0].push("BEFORE_CURRENT_DATE");
     			dateFilters[1] = new Array();
     			dateFilters[1].push("AFTER_CURRENT_DATE");
     		}
     	}
         var parameter = constructParameter(category, contestName, catalog, types, winnerHandle, minPrize.toString(), maxPrize.toString(), dateFilters);
		 var curType = "";
		 if (isDefined(types) && types.length == 1) {
			curType = types[0];
		 }
		 updateTypeLink(curType);
         loadContests(category, parameter);
         if (!(isDefined(type) && type.length > 0) && saveCookie) {
         	loadCookieFromInput(category,contestName,catalog,types,winnerHandle, minPrize.toString(), maxPrize.toString(), dateFilters);
         }
     } else {
         showErrors(errors);
         $(this).attr("disabled", "");
     }
}

/**
* Constructs the list filter.
*
* @param name - the list filter name.
* @param list - the list.
* @param return the constructed list filter.
*/
function constructListFilter(name, list) {
    if (isDefined(list) && list.length > 0) {
        var parameter = "\"" + name + "\":[";
        for (var i = 0; i < list.length; i++) {
            if (i != 0) {
                parameter += ",";
            }
            parameter += "\"" + quote(list[i]) + "\"";
        }
        parameter += "],";
        return parameter;
    }
    return "";
}

/**
* Constructs the date filter.
*
* @param name - the date filter name.
* @param date - the array containing the date interval type, first date and second date of phase.
* @return the constructed date filter, null if dateType is null.
*/
function constructDateFilter(name, date) {
    if (isDefined(date)) {
        var parameter = "\"" + name + "\":{\"intervalType\":\"" + date[0] + "\"";
        if (date[0] != "BEFORE_CURRENT_DATE" && date[0] != "AFTER_CURRENT_DATE") {
            parameter += ",\"firstDate\":\"" + date[1] + "\"";
            if (date[0] == "BETWEEN_DATES") {
                parameter += ",\"secondDate\":\"" + date[2] + "\"";
            }
        }
        parameter += "},";
        return parameter;
    }
    return "";
}

/**
 * Gets the contest detail link.
 * 
 * @param contestId - the contest JSON data.
 * @returns the contest detail link.
 */
function getContestLink(contest) {
	return "http://community.topcoder.com/tc?module=ProjectDetail&pj=" + contest.contestId;
}

/**
 * Gets the review detail link for a specified contest.
 * 
 * @param contestId - the contest JSON data.
 * @returns the review detail link for a specified contest.
 */
function getReviewDetailLink(contest) {
	return "http://community.topcoder.com/tc?module=ReviewProjectDetail&pj=" + contest.contestId + "&pt=" + contest.projectCategoryId;
}

/**
 * Gets the registration detail link for a specified contest.
 * 
 * @param contestId - the contest JSON data.
 * @returns the registration detail link for a specified contest.
 */
function getRegDetailLink(contest) {
	return "http://community.topcoder.com/tc?module=ViewRegistrants&pj=" + contest.contestId;
}

/**
* Loads the contest data through AJAX request.
*
* @param cateogry - the category.
* @param parameter - the parameter.
*/
function loadContests(category, parameter) {
    var url;
    if (category == "ActiveContests") {
        url = "activeContestsManager.action";
    } else if (category == "ContestStatus") {
        url = "contestStatusManager.action";
    } else if (category == "PastContests") {
        url = "pastContestsManager.action";
    } else if (category == "UpcomingContests") {
        url = "upcomingContestsManager.action";
    } else if (category == "ReviewOpportunities") {
        url = "reviewOpportunitiesManager.action";
    } else {
        url = "searchContestsManager.action";
    }
    modalPreloader("#preload");
    var contestName = $("#contestName").val().length > 0 ? $("#contestName").val().replace(/^\s+/,"") : null;
	var data={parameter:parameter};
	$.ajax({
		url:url,
		data:data,
		dataType:'json',
		type:'POST',
		success: function (data) {
			if (data.jsonErrors.length == 0) {
				var pageCountFromCookie = $.getCookie("page_count");
				var pageCount;
				if (isDefined(pageCountFromCookie)){
					pageCount = pageCountFromCookie;
				} else {
					pageCount = 10;
				}
				$("#errors").hide();
				$("#contestTable").hide();
				$("#contestTable tbody").empty();
				if ($(".contestTable").length > 0) {
					$("#contestTable").clone(true).insertAfter("#filterContainer");
					$(".contestTable").remove();
				}
				var aoColumns = [];
				var tbody = $("#contestTable tbody");
				if (category == "ActiveContests") {
					$.each(data.activeContests, function (i, item) {
						tbody.append("<tr><td class='first leftAligned'>" + item.type + "</td><td><a href='" + getContestLink(item) + "'>" + item.contestName + "</a></td><td class='leftAligned datetime'>" + getDateTimeValue(item.registrationEndDate) + "</td><td class='leftAligned datetime'>" + getDateTimeValue(item.submissionEndDate) + "</td><td>$" + item.firstPrize + "</td><td>$" + item.reliabilityBonus + "</td><td>" + item.digitalRunPoints + "</td><td><a href='" + getRegDetailLink(item) + "'>" + item.numberOfRegistrants + "</a></td><td class='last'><a href='" + getRegDetailLink(item) + "'>" + item.numberOfSubmissions + "</a></td></tr>");
					});
					aoColumns = [null,null,null,null,{'sType':'usmoney'},{'sType':'usmoney'},null,null,null];
				} else if (category == "ContestStatus") {
					$.each(data.contestStatuses, function (i, item) {
						tbody.append("<tr><td class='first leftAligned'>" + item.type + "</td><td>" + item.catalog + "</td><td><a href='" + getContestLink(item) + "'>" + item.contestName + "</a></td><td class='leftAligned datetime'>" + getDateTimeValue(item.submissionDueDate) + "</td><td class='leftAligned'>" + getDateValue(item.finalReviewDueDate) + "</td><td class='leftAligned'>" + getValue(item.currentPhase) + "</td><td>" + getValue(item.firstPlaceHandle) + "</td><td class='last'>" + getValue(item.secondPlaceHandle) + "</td></tr>");
					});
					aoColumns = [null,null,null,null,null,null,null,null];
				} else if (category == "PastContests") {
					$.each(data.pastContests, function (i, item) {
						tbody.append("<tr><td class='first leftAligned'>" + item.type + "</td><td>" + item.catalog + "</td><td><a href='" + getContestLink(item) + "'>" + item.contestName + "</a></td><td class='leftAligned'>" + getDateTimeValue(item.completionDate) + "</td><td>" + item.numberOfRegistrants + "</td><td>" + item.numberOfSubmissions + "</td><td>" + item.passedScreeningCount + "<td class='last'>" + getValue(item.winnerProfileLink) + "</td></tr>");
					});
					aoColumns = [null,null,null,null,null,null,null,null];
				} else if (category == "ReviewOpportunities") {
					$.each(data.reviewOpportunities, function (i, item) {
						tbody.append("<tr><td class='first leftAligned'>" + item.type + "</td><td><a href='" + getContestLink(item) + "'>" + item.contestName + "</a></td><td>$" + item.primaryReviewerPayment + "</td><td>$" + item.secondaryReviewerPayment + "</td><td>" + item.submissionsNumber + "</td><td class='leftAligned datetime'>" + getDateTimeValue(item.opensOn) + "</td><td>" + getDateValue(item.reviewStart) + "</td><td>" + getDateValue(item.reviewEnd) + "</td><td>" + item.numberOfReviewPositionsAvailable + "</td><td class='last'><a href='" + getReviewDetailLink(item) + "'>Details</a></td></tr>");
					});
					aoColumns = [null,null,{'sType':'usmoney'},{'sType':'usmoney'},null,null,null,null,null,null];
				} else if (category == "UpcomingContests") {
					$.each(data.upcomingContests, function (i, item) {
						tbody.append("<tr><td class='first leftAligned datetime'>" + getDateTimeValue(item.registerDate) + "</td><td class='leftAligned datetime'>" + getDateTimeValue(item.submitDate) + "</td><td>" + item.duration + "</td><td class='leftAligned'>" + item.type + "</td><td><a href='" + getContestLink(item) + "'>" + item.contestName + "</a></td><td class='leftAligned'>" + getValue(item.technologies) + "</td><td class='leftAligned last'>" + item.status + "</td></tr>");
					});
					aoColumns = [null,null,null,null,null,null,null];
				} else {
					$("span.num").html(data.contests.length);
                    $("strong", $("span.num").parent()).html(getValue(contestName));
					$.each(data.contests, function (i, item) {
						tbody.append("<tr><td class='first'><a href='" + getContestLink(item) + "'>" + item.contestName + "</td><td class='leftAligned'>" + item.type + "</td><td>" + item.catalog + "</td><td>Not Set</td><td class='leftAligned'>" + item.status + "</td><td class='leftAligned'><a href='" + getRegDetailLink(item) + "'>" + item.numberOfRegistrants + "</a></td><td class='last'><a href='" + getContestLink(item) + "'>Details</a></td></tr>");
					});
					$("h1.heading").children("span").show();
					aoColumns = [null,null,null,null,null,null,null];
				}
				$('#contestTable').dataTable({
					"iDisplayLength" : pageCount ,
					"sPaginationType": "full_numbers",
					"aaSorting": [],
					"aoColumns": aoColumns,
					"fnDrawCallback":function(){
						$("th.sorting").css("cursor", "pointer");
						if ($('#contestTable_previous').hasClass('paginate_button_disabled') && 
							$('#contestTable_next').hasClass('paginate_button_disabled')) {
							$('#contestTable_paginate .paginate_active').hide();
						}
						if ($($(".pagingInfo strong")[2]).text() == '0') {
							$('#contestTable_paginate').hide();
							$(".contestTable select").attr("disabled","disabled");
						}
						var emptyCell = $(".contestTable table td.dataTables_empty");
						emptyCell.attr("colspan", parseInt(emptyCell.attr("colspan")) - 1);
						emptyCell.after("<td class='last' style='zoom: 1; overflow: hidden;'></td>");
						emptyCell.addClass('first');
					}
				});
				$("#contestTable").wrap("<div class='tableContainer'></div>");
				$(".tableContainer").append("<div class='tdHover hide'></div>");
				$(".tableContainer").append("<div class='tdHover hide'></div>");
				$(".pagerContainer").prepend($(".pager"));
				$(".pager").after($(".pagingInfo"));
				$("#contestTable").show();
			} else {
				showErrors(data.jsonErrors);
			}
			addresscloseModal("#preload");
			$(".applyFilterBtn").attr("disabled", "");
		},
		error: function () {
			addresscloseModal("#preload");
			$(".applyFilterBtn").attr("disabled", "");
		}
	});
}

/**
* Gets the string value of the object.
*
* @param obj - the object.
* @return the string value.
*/
function getValue(obj) {
    return isDefined(obj) ? obj.toString() : "";
}

/**
* Gets the string representing the datetime value.
*
* @param dateStr - the datetime string.
* @return the string representing the datetime value.
*/
function getDateTimeValue(dateStr) {
    if (isDefined(dateStr)) {
        var dateTimeValues = getDateTimeValues(dateStr);
        return dateTimeValues[1] + "/" + dateTimeValues[2] + "/" + dateTimeValues[0].substring(2, 4) + " " + dateTimeValues[3] + ":" + dateTimeValues[4] + " EDT";
    }
    return "";
}

/**
* Gets the string representing the date value.
*
* @param dateStr - the date string.
* @return the string representing the date value.
*/
function getDateValue(dateStr) {
    if (isDefined(dateStr)) {
        var dateTimeValues = getDateTimeValues(dateStr);
        return dateTimeValues[1] + "/" + dateTimeValues[2] + "/" + dateTimeValues[0].substring(2, 4);
    }
    return "";
}

/**
* Gets the array containing the year, month, day, hours and minutes values of the given string representing a date.
*
* @param dateStr - the string representing a date.
* @return the array containing the year, month, day, hours and minutes values of the given date string.
*/
function getDateTimeValues(dateStr) {
    var year = dateStr.substring(0, 4);
    var month = dateStr.substring(5, 7);
    var day = dateStr.substring(8, 10);
    var hours = dateStr.substring(11, 13);
    var minutes = dateStr.substring(14, 16);
    return new Array(year, month, day, hours, minutes);
}

/**
* Gets the date object represented by the short date string.
*
* @param dateStr - the short date string.
* @return the date object represented by the short date string.
*/
function getShortDateValue(dateStr) {
    var year = dateStr.substring(6, 10);
    var month = dateStr.substring(0, 2);
    var day = dateStr.substring(3, 5);
    return new Date(year, month, day);
}

/**
* Shows the list of error messages.
*
* @param errors - the array of error messages.
*/
function showErrors(errors) {
    $("#errors ul").empty();
    $.each(errors, function (i, error) {
        $("#errors ul").append("<li><span class='red'>* " + error + "</span></li>");
        $("#errors").show();
    });
}

/**
 *  This function is used to load the cookie ( created according to the category  ) with all the search criteria specified.
 *  This cookie value will be used to populate the search criteria back next time when this search functionality is used.
 * 
 * @param category - the category.
 * @param name - the contest name.
 * @param catalog - the catalog.
 * @param types - the array of contest types.
 * @param winnerHandle - the winner handle.
 * @param minPrize - the lower bound of the contest prize.
 * @param maxPrize - the upper bound of the contest prize.
 * @param dateFilters - the array containing the array of date interval type, first date and second date of registration/submission/finalization/review date.
 */

function loadCookieFromInput(category, name, catalog,types, winnerHandle, minPrize, maxPrize, dateFilters) {
    var filterParam = "";
    var regDate, subDate, finalDate, revDate;
    var subDate, regDate,finalDate, revDate;
    if (category == "ActiveContests") {
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        finalDate = dateFilters[2];
    } else if (category == "ContestStatus") {
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        finalDate = dateFilters[2];
    } else if (category == "PastContests") {
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        finalDate = dateFilters[2];
    } else if (category == "UpcomingContests") {
        regDate = dateFilters[0];
        subDate = dateFilters[1];
    } else if (category == "ReviewOpportunities") {
        regDate = dateFilters[0];
        subDate = dateFilters[1];
        revDate = dateFilters[2];
    }
    if (isDefined(name)) {
        filterParam += "\"contestName\":\"" + quote(name) + "\",";
    }
    if (category == "ContestStatus" || category == "PastContests") { 
	    if (isDefined(winnerHandle)) {
	        filterParam += "\"winnerHandle\":\"" + quote(winnerHandle) + "\",";
	    }
    }
    if (isDefined(catalog)) {
        filterParam += "\"catalogs\":[\"" + quote(catalog) + "\"],";
    }
    if (isDefined(minPrize)) {
        var minPrizeName = category == "ReviewOpportunities" ? "paymentStart" : "prizeLowerBound";
        filterParam += "\"" + minPrizeName + "\":\"" + quote(minPrize) + "\",";
    }
    if (isDefined(maxPrize)) {
        var maxPrizeName = category == "ReviewOpportunities" ? "paymentEnd" : "prizeUpperBound";
        filterParam += "\"" + maxPrizeName + "\":\"" + quote(maxPrize) + "\",";
    }
    filterParam += constructDateFilter("submissionEndDate", subDate);
    filterParam += constructDateFilter("registrationStartDate", regDate);
    filterParam += constructDateFilter("contestFinalizationDate", finalDate);
    filterParam += constructDateFilter("reviewEndDate", revDate);
    filterParam += constructListFilter("types", types);
    
    if (filterParam.length > 0) {
        filterParam = "{" + filterParam.substring(0, filterParam.length - 1) + "}";
    }
    $.setCookie(category,filterParam,{expires : 365});
}

/**
 * Load the Filters from the Cookies ( according to their respective category)
 * 
 * @param category
 */
function loadFiltersFromCookie(category){
	var jsonCookieFilter = $.getCookie(category);
	if (isDefined(jsonCookieFilter)){
		
		//Get the contestName from the cookie
		if (isDefined(jsonCookieFilter.contestName)){
			$("#contestName").val(jsonCookieFilter.contestName);
		}
		if (isDefined(jsonCookieFilter.winnerHandle)){
			$("input[name='winnerHandle']").val(jsonCookieFilter.winnerHandle);
		}
		//Get the catalog from the cookie
		if (isDefined(jsonCookieFilter.catalogs)){
			$("select[name='catalog']").val(jsonCookieFilter.catalogs[0]);
		}
		//Get the Prize from the cookie
		var minPrizeName = category == "ReviewOpportunities" ? "paymentStart" : "prizeLowerBound";
		var maxPrizeName = category == "ReviewOpportunities" ? "paymentEnd" : "prizeUpperBound";
		if (isDefined(jsonCookieFilter[minPrizeName])	){
			$("input[name='maxPrize']").val(jsonCookieFilter[maxPrizeName]);
			$("input[name='minPrize']").val(jsonCookieFilter[minPrizeName]);
			$("#slider").slider({ values: [jsonCookieFilter[minPrizeName], jsonCookieFilter[maxPrizeName]] });
		}	
		
		$(".dateFilter select.dateSelect").each(function (index,element) {
			switch (index) {
			case 0:
				setDate($(this),jsonCookieFilter.registrationStartDate);
				break;
			case 1:
				setDate($(this),jsonCookieFilter.submissionEndDate);
				break;
			case 2:
				if (category == "ReviewOpportunities"){
					setDate($(this),jsonCookieFilter.reviewEndDate);
				} else {
					setDate($(this),jsonCookieFilter.contestFinalizationDate);
				}
				break;
			}
		});		
	}
}

/**
 * This function will take the DateSelect object of the Search Filter and add FirstDate and Second Date values from the Array given;
 * 
 * @param obj  Date Filter Selection 
 * @param date Array containing the Date Filter and 
 */
function setDate( obj ,date){
	if (isDefined(date)){
		if (isDefined(date.intervalType)) {
			obj.val(date.intervalType);
			obj.triggerHandler("change");
		}
		if (isDefined(date.firstDate)) {
			obj.siblings(".dateContainer").find("input[name='firstDate']").val(date.firstDate);
		}
		if (isDefined(date.secondDate)) {
			obj.siblings(".dateContainer").find("input[name='secondDate']").val(date.secondDate);
		}
	}
}

/**
 * This function checks whether the input number is a valid number
 *  
 * @param n - The number to be verified
 * @returns {Boolean}
 */
function isValidNumber(n) {
	var n2 = n;
    n = parseInt(n);
    return (n!='NaN' && ( n2 == n || n2 == n + '+' ));
}

 /**
  * Cleans amount.
  * @param amt Amount to be cleaned.
  * @return clean amount.
  */
function cleanAmount(amt) {
	var charsToRemove = ["$",","];
	for (var i=0;i<charsToRemove.length;i++) {
		while (amt.indexOf(charsToRemove[i],0) != -1) {
			amt = amt.replace(charsToRemove[i],'');
		}
	}
	return parseFloat(amt);
}