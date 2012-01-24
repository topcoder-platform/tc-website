<%--
  - Author: pulky, isv, duxiaoyang
  - Version: 1.4
  - Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents past contests
  -
  - Version 1.1 (Studio Release Assembly - Spec Review Sign up page v1.0) changes: Added "Review Opportunities" tab.
  - Version 1.2 (BUGR-2786) changes: Added "Round 1 End" column.
  - Version 1.3 (Replatforming Studio Release 1 Assembly) change notes: the contests are filtered based on eligibility
  - constraints.
  - Version 1.4 (TopCoder Studio Contest Listings Assembly) change notes: apply new look-and-feel.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.studio.controller.request.SortingHelper" %>
<%@ page import="java.util.ArrayList,java.util.Map,java.util.HashMap" %>
<%@ page import="java.util.Date,java.sql.Timestamp" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");
    String sortCriteria = URLEncoder.encode((String) request.getAttribute(SortingHelper.SORTING_CRITERIA_KEY));
    Map sortDirection = new HashMap();
    SortingHelper.parseSortingParameter((String) request.getAttribute(SortingHelper.SORTING_CRITERIA_KEY), new ArrayList(), sortDirection);
    String sortColumn = (String) request.getAttribute("sortColumn");
    if (sortColumn == null) {
        sortColumn = "";
    }
    String sortOrder = (String) request.getAttribute("sortDirection");
    if (sortOrder == null) {
        sortOrder = "asc";
    }
    String sort = "";
    if (!sortColumn.equals("")) {
        sort += "&sc=" + sortColumn;
    }
    if (!sortOrder.equals("")) {
        sort += "&sd=" + (sortOrder.equals("asc") ? "desc" : "asc");
    }
 %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Past Contests</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.tools.tooltip.min.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.jqtransform.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/date.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.datePicker.js"></script>
    <script src="/js/NewStyleHeaderFooter/contestListingScripts.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    var url = "${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}<%=sort%>&sortCriteria=<%=sortCriteria%>";
    var totalPage = ${totalPage};
    var request = "${query}";
    $(document).ready(function(){
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
        $("#content-new .dataTable .filter .date input:eq(0)").datePicker().val("${startDate}").trigger('change');
        $("#content-new .dataTable .filter .date input:eq(1)").datePicker().val("${endDate}").trigger('change');
    });
    </script>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript">
<!--
    function filterDateChange(){
        var myForm = document.submissionsForm;
     myForm.<%=DataAccessConstants.START_RANK%>.value ="";
        myForm.<%=DataAccessConstants.END_RANK%>.value ="";
     myForm.submit();
    }
     function filterYearChange(value,filterMonth){
        if(value == "All"){
         var i,num,op;
         num = filterMonth.length;
           for(i=0;i<num;i++){
               op= filterMonth.options[i]
               if(op.value=="All") op.selected=true;
           }
        }
    }
    //--></script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="top.jsp">
            <jsp:param name="section" value="contest" />
        </jsp:include>
        <br />
        <div id="content-new" class="pastContests">
            <div class="contentMask">
                <div class="title">
                    <h1>Past Contests</h1>
                    <p class="help">
                        Need help? Learn how to <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get started</a>.
                    </p>
                </div><!-- end of .title -->

                <div class="topLine">
                    <div class="pagination">
                        <div class="<c:if test="${pageSize ne -1}">show</c:if><c:if test="${pageSize eq -1}">showAll</c:if>">
                            <label>View:</label>
                            <select>
                                <option value="10" <c:if test="${pageSize eq 10}">selected="selected"</c:if>>10</option>
                                <option value="20" <c:if test="${pageSize eq 20}">selected="selected"</c:if>>20</option>
                                <option value="30" <c:if test="${pageSize eq 30}">selected="selected"</c:if>>30</option>
                                <option value="50" <c:if test="${pageSize eq 50}">selected="selected"</c:if>>50</option>
                                <option value="-1" <c:if test="${pageSize eq -1}">selected="selected"</c:if>>All</option>
                            </select>
                        </div>
                        <c:if test="${pageSize ne -1}">
                        <ul>
                            <li>
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne 1}">first</c:if><c:if test="${pageNum eq 1}">firstDisable</c:if>"></a>
                            </li>
                            <li>
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne 1}">prev</c:if><c:if test="${pageNum eq 1}">prevDisable</c:if>"></a>
                            </li>
                            <li class="label">
                                <label>Page:</label>
                            </li>
                            <c:forEach begin="${pageNum le 2 ? 1: (pageNum + 2 gt totalPage ? totalPage - 4 : pageNum - 2)}" end="${pageNum + 2 gt totalPage ? totalPage : (pageNum le 2 ? (totalPage lt 5 ? totalPage : 5) : pageNum + 2)}" var="page">
                            <li>
                                <c:if test="${page eq pageNum}">
                                <span>${page}</span>
                                </c:if>
                                <c:if test="${page ne pageNum}">
                                <a href="javascript:;" class="page">${page}</a>
                                </c:if>
                            </li>
                            </c:forEach>
                            <li class="next">
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne totalPage}">next</c:if><c:if test="${pageNum eq totalPage}">nextDisable</c:if>"></a>
                            </li>
                            <li class="last">
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne totalPage}">last</c:if><c:if test="${pageNum eq totalPage}">lastDisable</c:if>"></a>
                            </li>
                        </ul>
                        </c:if>
                    </div><!-- end of .pagination -->

                    <ul class="tabs">
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">
                                <span class="tabMask"><span class="text">Active Contests</span></span>
                            </a>
                        </li>
                        <li  class="active">
                            <a href="${sessionInfo.servletPath}?module=ViewPastContests">
                                <span class="tabMask"><span class="text">Past Contests</span></span>
                            </a>
                        </li>
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">
                                <span class="tabMask"><span class="text">Active Bug Race Competitions</span></span>
                            </a>
                        </li>
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">
                                <span class="tabMask"><span class="text">Review Opportunities</span></span>
                            </a>
                        </li>
                    </ul><!-- end of .tabs -->
                </div><!-- end of .topLine -->

                <div class="dataTable">
                    <div class="filter">
                        <div class="filterHeader">
                            <h5><a href="javascript:;">Filter</a></h5>
                            <div class="right">
                                <label>Contest Title</label>
                                <div class="search">
                                    <input type="text" name="title1" <c:if test="${title1 ne '%'}">value="${title1}"</c:if>/>
                                    <a href="javascript:;"></a>
                                </div>
                            </div>
                        </div>
                        <form id="filterForm" action="${sessionInfo.servletPath}" method="get">
                            <input type="hidden" name="module" value="ViewPastContests" />
                        </form>
                        <div class="filterContent">
                            <ul class="left">
                                <li class="label"><strong>Contest types:</strong></li>
                                <li class="selectAll">
                                    <input type="checkbox" />
                                    <label><strong>All</strong></label>
                                </li>
                                <li>
                                    <input type="checkbox" value="17" <c:if test="${fn:contains(contestType, ',17,')}">checked="checked"</c:if>/>
                                    <label>Web Design</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="18" <c:if test="${fn:contains(contestType, ',18,')}">checked="checked"</c:if>/>
                                    <label>Wireframe</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="32" <c:if test="${fn:contains(contestType, ',32,')}">checked="checked"</c:if>/>
                                    <label>Application Front End</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="30" <c:if test="${fn:contains(contestType, ',30,')}">checked="checked"</c:if>/>
                                    <label>Widget</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="21" <c:if test="${fn:contains(contestType, ',21,')}">checked="checked"</c:if>/>
                                    <label>Print/Presentation</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="16" <c:if test="${fn:contains(contestType, ',16,')}">checked="checked"</c:if>/>
                                    <label>Banner/Icon</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="20" <c:if test="${fn:contains(contestType, ',20,')}">checked="checked"</c:if>/>
                                    <label>Logo Design</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="22" <c:if test="${fn:contains(contestType, ',22,')}">checked="checked"</c:if>/>
                                    <label>Idea Generation</label>
                                </li>
                                <li>
                                    <input type="checkbox" value="34" <c:if test="${fn:contains(contestType, ',34,')}">checked="checked"</c:if>/>
                                    <label>Other</label>
                                </li>
                            </ul>
                            <ul class="middle">
                                <li>
                                    <input type="checkbox" name="startDate" checked="checked"/>
                                    <label>Start date:</label>
                                    <div class="fields date">
                                        <input type="text" readonly="readonly" />
                                        <select>
                                            <option value="01:00" <c:if test="${startDateTime eq '01:00'}">selected="selected"</c:if>>01:00</option>
                                            <option value="03:00" <c:if test="${startDateTime eq '03:00'}">selected="selected"</c:if>>03:00</option>
                                            <option value="07:00" <c:if test="${startDateTime eq '07:00'}">selected="selected"</c:if>>07:00</option>
                                            <option value="10:00" <c:if test="${startDateTime eq '10:00'}">selected="selected"</c:if>>10:00</option>
                                            <option value="13:00" <c:if test="${startDateTime eq '13:00'}">selected="selected"</c:if>>13:00</option>
                                            <option value="16:00" <c:if test="${startDateTime eq '16:00'}">selected="selected"</c:if>>16:00</option>
                                            <option value="19:00" <c:if test="${startDateTime eq '19:00'}">selected="selected"</c:if>>19:00</option>
                                            <option value="22:00" <c:if test="${startDateTime eq '22:00'}">selected="selected"</c:if>>22:00</option>
                                        </select>
                                        <span>ET (GMT-04)</span>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="endDate" checked="checked"/>
                                    <label>End date:</label>
                                    <div class="fields date">
                                        <input type="text" readonly="readonly" />
                                        <select>
                                            <option value="01:00" <c:if test="${endDateTime eq '01:00'}">selected="selected"</c:if>>01:00</option>
                                            <option value="03:00" <c:if test="${endDateTime eq '03:00'}">selected="selected"</c:if>>03:00</option>
                                            <option value="07:00" <c:if test="${endDateTime eq '07:00'}">selected="selected"</c:if>>07:00</option>
                                            <option value="10:00" <c:if test="${endDateTime eq '10:00'}">selected="selected"</c:if>>10:00</option>
                                            <option value="13:00" <c:if test="${endDateTime eq '13:00'}">selected="selected"</c:if>>13:00</option>
                                            <option value="16:00" <c:if test="${endDateTime eq '16:00'}">selected="selected"</c:if>>16:00</option>
                                            <option value="19:00" <c:if test="${endDateTime eq '19:00'}">selected="selected"</c:if>>19:00</option>
                                            <option value="22:00" <c:if test="${endDateTime eq '22:00'}">selected="selected"</c:if>>22:00</option>
                                        </select>
                                        <span>ET (GMT-04)</span>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="minDuration" <c:if test="${minDuration ne '0'}">checked="checked"</c:if>/>
                                    <label>Min duration:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="3" <c:if test="${minDuration eq '3'}">selected="selected"</c:if>>3</option>
                                            <option value="5" <c:if test="${minDuration eq '5'}">selected="selected"</c:if>>5</option>
                                            <option value="6" <c:if test="${minDuration eq '6'}">selected="selected"</c:if>>6</option>
                                            <option value="7" <c:if test="${minDuration eq '7'}">selected="selected"</c:if>>7</option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="maxDuration" <c:if test="${maxDuration ne '1000'}">checked="checked"</c:if>/>
                                    <label>Max duration:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="10" <c:if test="${maxDuration eq '10'}">selected="selected"</c:if>>10</option>
                                            <option value="15" <c:if test="${maxDuration eq '15'}">selected="selected"</c:if>>15</option>
                                            <option value="16" <c:if test="${maxDuration eq '16'}">selected="selected"</c:if>>16</option>
                                            <option value="17" <c:if test="${maxDuration eq '17'}">selected="selected"</c:if>>17</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="wordInTitle">
                                    <input type="checkbox" name="title2" <c:if test="${not empty title2}">checked="checked"</c:if>/>
                                    <label>Word in title:</label>
                                    <div class="fields">
                                        <input type="text" class="text" <c:if test="${not empty title2}">value="${title2}"</c:if>/>
                                    </div>
                                </li>
                                <li class="winnerPlacement">
                                    <input type="checkbox" name="winner" <c:if test="${winner ne '0'}">checked="checked"</c:if>/>
                                    <label>Winner's handle up to a certain placement:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="1" <c:if test="${winner eq '1'}">selected="selected"</c:if>>first place</option>
                                            <option value="2" <c:if test="${winner eq '2'}">selected="selected"</c:if>>top two places</option>
                                            <option value="3" <c:if test="${winner eq '3'}">selected="selected"</c:if>>top three places</option>
                                            <option value="-1" <c:if test="${winner eq '-1'}">selected="selected"</c:if>>any prize placement</option>
                                        </select>
                                    </div>
                                </li>
                            </ul>
                            <ul class="right">
                                <li>
                                    <input type="checkbox" name="firstPrize" <c:if test="${firstPrize ne '-1'}">checked="checked"</c:if>/>
                                    <label>First-place prize amount:</label>
                                    <div class="fields">
                                        <input type="text" class="text" <c:if test="${firstPrize ne '-1'}">value="${firstPrize}"</c:if>/>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="totalPrize" <c:if test="${totalPrize ne '-1'}">checked="checked"</c:if>/>
                                    <label>Total prize purse:</label>
                                    <div class="fields">
                                        <input type="text" class="text" <c:if test="${totalPrize ne '-1'}">value="${totalPrize}"</c:if>/>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="minReg" <c:if test="${minReg ne '0'}">checked="checked"</c:if>/>
                                    <label>Min registrants:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="3" <c:if test="${minReg eq '3'}">selected="selected"</c:if>>3</option>
                                            <option value="4" <c:if test="${minReg eq '4'}">selected="selected"</c:if>>4</option>
                                            <option value="5" <c:if test="${minReg eq '5'}">selected="selected"</c:if>>5</option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="maxReg" <c:if test="${maxReg ne '1000'}">checked="checked"</c:if>/>
                                    <label>Max registrants:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="10" <c:if test="${maxReg eq '10'}">selected="selected"</c:if>>10</option>
                                            <option value="11" <c:if test="${maxReg eq '11'}">selected="selected"</c:if>>11</option>
                                            <option value="12" <c:if test="${maxReg eq '12'}">selected="selected"</c:if>>12</option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="minSub" <c:if test="${minSub ne '0'}">checked="checked"</c:if>/>
                                    <label>Min submissions:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="10" <c:if test="${minSub eq '10'}">selected="selected"</c:if>>10</option>
                                            <option value="11" <c:if test="${minSub eq '11'}">selected="selected"</c:if>>11</option>
                                            <option value="12" <c:if test="${minSub eq '12'}">selected="selected"</c:if>>12</option>
                                        </select>
                                    </div>
                                </li>
                                <li>
                                    <input type="checkbox" name="maxSub" <c:if test="${maxSub ne '1000'}">checked="checked"</c:if>/>
                                    <label>Max submissions:</label>
                                    <div class="fields">
                                        <select>
                                            <option value="10" <c:if test="${maxSub eq '10'}">selected="selected"</c:if>>10</option>
                                            <option value="11" <c:if test="${maxSub eq '11'}">selected="selected"</c:if>>11</option>
                                            <option value="12" <c:if test="${maxSub eq '12'}">selected="selected"</c:if>>12</option>
                                        </select>
                                    </div>
                                </li>
                                <li class="selectAll">
                                    <input type="checkbox"/>
                                    <label>Select all</label>
                                </li>
                            </ul>

                            <div class="actions">
                                <a class="blueBtn1" href="javascript:;">
                                    <span class="buttonMask"><span class="text">View</span></span>
                                </a>
                                <a class="grayBtn" href="javascript:;">
                                    <span class="buttonMask"><span class="text">Reset</span></span>
                                </a>
                            </div>
                        </div>
                    </div><!-- end of .filter -->

                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="30px" />
                            <col width="265px" />
                            <col width="40px" />
                            <col width="78px" />
                            <col width="68px" />
                            <col width="60px" />
                            <col width="60px" />
                            <col width="80px" />
                            <col width="69px" />
                            <col width="54px" /> 
                            <col width="" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="first <%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("name")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("") || sortColumn.equals("" + contests.getColumnIndex("name")) ? "hover" : ""%>" colspan="2">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("name")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Project</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("type_name")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("type_name")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("type_name")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Type</span> </a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("start_time")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("start_time")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("start_time")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Start Date</span> </a>
                                </th> 
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("end_time")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("end_time")) ? "hover" : ""%>">
                                     <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("end_time")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>End Date</span> </a>
                                </th>
                                <th>
                                     <a href="javascript:;"><span>Duration</span></a>
                                </th> 
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("first_place")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("first_place")) ? "hover" : ""%>">
                                     <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("first_place")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>1st place</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("winner_count")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("winner_count")) ? "hover" : ""%>">
                                     <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("winner_count")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Winners</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("registrants")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("registrants")) ? "hover" : ""%>">
                                     <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("registrants")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Registrants</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("show_submissions")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("show_submissions")) ? "hover" : ""%>">
                                     <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("show_submissions")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Public</span></a>
                                </th>
                                <th class="last esTh <%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("eligible_submissions")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("eligible_submissions")) ? "hover" : ""%>">
                                     <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests&${query}&sc=<%=contests.getColumnIndex("eligible_submissions")%>&sd=<%=sortOrder%>&pageSize=${pageSize}&pageNum=${pageNum}&sortCriteria=<%=sortCriteria%>"><span>Eligible<br />Submissions</span></a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="<%=contests.size()==0%>">
                            <tr><td class="space" colspan="11">&nbsp;</td></tr>
                            <tr class="light">
                                <td class="valueC" colspan="11">
                                    <div align="center" style="margin: 40px 0px 40px 0px;">
                                        There are currently no past contests matching the criteria, change the filter and search again.
                                    </div>
                                </td>
                            </tr>
                                </c:when>
                                <c:otherwise>
                            <c:set var="even" value="false" />
                            <rsc:iterator list="<%=contests%>" id="resultRow" begin="${begin}" end="${end}">
                                <c:set var="contestId" value="<%=new Long(resultRow.getLongItem("contest_id"))%>"/>
                            <tr><td colspan="11" class="space">&nbsp;</td></tr>
                            <tr <c:if test="${even}">class="even"</c:if>>
                                <td class="first">
                                    <% if ("3434".equals(resultRow.getStringItem("event_id"))) { %>
                                    <a href="http://community.topcoder.com/tco12/studio"><img src="/i/tournament/tco12/tco12_icon_design.png" alt="Eligible for the TCO12" /><span>Eligible for the TCO12</span></a>
                                    <% } else if ("18".equals(resultRow.getStringItem("contest_type_id")) && "true".equals(resultRow.getStringItem("in_tco")) ) { %>
                                    <a href="http://community.topcoder.com/tco12/win-tco-trips"><img src="/i/tournament/tco12/tco12_icon_wireframe.png" alt="Eligible for the TCO12" /><span>Eligible for the TCO12</span></a>
                                    <% } else { %>
                                    &nbsp;
                                    <% } %>
                                </td>
                                <td class="project">
                                    <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                        <strong><rsc:item name="name" row="<%=resultRow%>"/></strong>
                                    </a>
                                    <br/>
                                    <span class="links">
                                        <c:if test="<%=resultRow.getBooleanItem("show_submissions")%>">
                                        <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">submissions</a>
                                        <% if (resultRow.getBooleanItem("results_available")) { %>
                                        <span>|</span>
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">winners</a>
                                        <% } %>
                                        </c:if>
                                        <c:if test="${resultRow.map['forum_id']!=null}">
                                            <c:if test="<%=resultRow.getBooleanItem("show_submissions")%>">
                                        <span>|</span>
                                            </c:if>
                                        <studio:forumLink forumID="${resultRow.map['forum_id']}" message="discuss"/>
                                        </c:if>
                                    </span>
                                </td>
                                <td> 
                                    <a class="typeIcon tooltip type<rsc:item name="type_id" row="<%=resultRow%>"/>" href="javascript:;">
                                        <span class="tipT">Contest Type</span>
                                        <span class="tipC"><rsc:item name="type_name" row="<%=resultRow%>"/></span>
                                    </a>
                                </td>
                                <td>
                                    <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td>
                                    <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td> 
                                <td>
                                    <studio_tags:countdownClock mode="short" begin="${resultRow.map['start_time']}" end="${resultRow.map['end_time']}"/>
                                </td>
                                <td class="purse">
                                    <rsc:item name="first_place" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                                </td>
                                <% ResultSetContainer winners = (ResultSetContainer) ((Map) request.getAttribute("submissions")).get(Long.valueOf(resultRow.getLongItem("contest_id"))); %>
                                <td class="<c:if test="<%=resultRow.getBooleanItem("results_available") && winners != null && winners.size() > 0%>">winners</c:if>">
                                    <% if (resultRow.getBooleanItem("results_available") && winners != null && winners.size() > 0) {
                                           if (winners != null && winners.size() >= 1) { %>
                                    <a class="place01 tooltip1" href="javascript:;" rel="tooltip<%=winners.get(0).getStringItem("contest_id")%>_1"></a>
                                    <div class="tooltipsBox tooltipsBox2 tooltip<%=winners.get(0).getStringItem("contest_id")%>_1">
                                        <div class="tooltipsH"><h6>1st Place</h6></div>
                                        <div class="tooltipsC">
                                    <%         if (resultRow.getBooleanItem("show_submissions")) { %>
                                            <img src="studio.jpg?module=DownloadSubmission&sbmid=<%=winners.get(0).getStringItem("submission_id")%>&sbt=thumb" alt="" />
                                    <%         } %>
                                            <p><rsc:item name="amount" row="<%=winners.get(0)%>" format="$###,###.00" ifNull="&nbsp;"/></p>
                                            <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=<%=winners.get(0).getStringItem("user_id")%>"><strong><%=winners.get(0).getStringItem("handle_lower")%></strong></a>
                                        </div>
                                        <div class="tooltipsF">
                                    <%         if (resultRow.getBooleanItem("show_submissions")) { %>
                                            <a href="?module=ViewSubmissions&ct=<%=winners.get(0).getStringItem("contest_id")%>&sbmid=<%=winners.get(0).getStringItem("submission_id")%>&pn=1&ps=12">View Details</a>
                                    <%         } %>
                                        </div>
                                    </div>
                                    <%     }
                                           if (winners != null && winners.size() >= 2) { %>
                                    <a class="place02 tooltip1" href="javascript:;" rel="tooltip<%=winners.get(1).getStringItem("contest_id")%>_2"></a>
                                    <div class="tooltipsBox tooltipsBox2 tooltip<%=winners.get(0).getStringItem("contest_id")%>_2">
                                        <div class="tooltipsH"><h6>2nd Place</h6></div>
                                        <div class="tooltipsC">
                                    <%         if (resultRow.getBooleanItem("show_submissions")) { %>
                                            <img src="studio.jpg?module=DownloadSubmission&sbmid=<%=winners.get(1).getStringItem("submission_id")%>&sbt=thumb" alt="" />
                                    <%         } %>
                                            <p><rsc:item name="amount" row="<%=winners.get(1)%>" format="$###,###.00" ifNull="&nbsp;"/></p>
                                            <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=<%=winners.get(1).getStringItem("user_id")%>"><strong><%=winners.get(1).getStringItem("handle_lower")%></strong></a>
                                        </div>
                                        <div class="tooltipsF">
                                    <%         if (resultRow.getBooleanItem("show_submissions")) { %>
                                            <a href="?module=ViewSubmissions&ct=<%=winners.get(1).getStringItem("contest_id")%>&sbmid=<%=winners.get(1).getStringItem("submission_id")%>&pn=1&ps=12">View Details</a>
                                    <%         } %>
                                        </div>
                                    </div>
                                    <%     }
                                           if (winners != null && winners.size() >= 3) { %>
                                    <a class="place03 tooltip1" href="javascript:;" rel="tooltip<%=winners.get(2).getStringItem("contest_id")%>_3"></a>
                                    <div class="tooltipsBox tooltipsBox2 tooltip<%=winners.get(0).getStringItem("contest_id")%>_3">
                                        <div class="tooltipsH"><h6>3rd Place</h6></div>
                                        <div class="tooltipsC">
                                    <%         if (resultRow.getBooleanItem("show_submissions")) { %>
                                            <img src="studio.jpg?module=DownloadSubmission&sbmid=<%=winners.get(2).getStringItem("submission_id")%>&sbt=thumb" alt="" />
                                    <%         } %>
                                            <p><rsc:item name="amount" row="<%=winners.get(2)%>" format="$###,###.00" ifNull="&nbsp;"/></p>
                                            <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=<%=winners.get(2).getStringItem("user_id")%>"><strong><%=winners.get(2).getStringItem("handle_lower")%></strong></a>
                                        </div>
                                        <div class="tooltipsF">
                                    <%         if (resultRow.getBooleanItem("show_submissions")) { %>
                                            <a href="?module=ViewSubmissions&ct=<%=winners.get(2).getStringItem("contest_id")%>&sbmid=<%=winners.get(2).getStringItem("submission_id")%>&pn=1&ps=12">View Details</a>
                                    <%         } %>
                                        </div>
                                    </div>
                                    <%     } %>
                                    <%     if (resultRow.getBooleanItem("show_submissions") && winners != null && winners.size() > 3) { %>
                                    <a class="more" href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">More Winners</a>
                                    <%     }
                                       } else { %>
                                    --
                                    <% } %>
                                </td>
                                <td>
                                    <rsc:item name="registrants" row="<%=resultRow%>"/>
                                </td>
                                <td>
                                    <span class="<%=resultRow.getBooleanItem("show_submissions") ? "publicView" : "privateView"%>"></span>
                                </td>
                                <td class="last esTd">
                                    <a href="javascript:;" class="tooltip <%=resultRow.getBooleanItem("screening_phase") ? "gray" : ""%>">
                                        <rsc:item name="eligible_submissions" row="<%=resultRow%>"/>
                                        <span class="tipT">Submissions</span>
                                        <span class="tipC"><%=resultRow.getBooleanItem("screening_phase") ? "Screening not done yet" : resultRow.getIntItem("passing_submission_count") + " out of " + resultRow.getIntItem("submission_count") + " submissions passed screening"%></span>
                                    </a>     
                                </td>
                            </tr>
                                <c:set var="even" value="${not even}" />
                            </rsc:iterator>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div><!-- end of .dataTable --> 

                <div class="botLine"> 
                    <a href="#content-new" class="toTop">Back to Top</a>
                    <div class="pagination">
                        <div class="<c:if test="${pageSize ne -1}">show</c:if><c:if test="${pageSize eq -1}">showAll</c:if>">
                            <label>View:</label>
                            <select>
                                <option value="10" <c:if test="${pageSize eq 10}">selected="selected"</c:if>>10</option>
                                <option value="20" <c:if test="${pageSize eq 20}">selected="selected"</c:if>>20</option>
                                <option value="30" <c:if test="${pageSize eq 30}">selected="selected"</c:if>>30</option>
                                <option value="50" <c:if test="${pageSize eq 50}">selected="selected"</c:if>>50</option>
                                <option value="-1" <c:if test="${pageSize eq -1}">selected="selected"</c:if>>All</option>
                            </select>
                        </div>
                        <c:if test="${pageSize ne -1}">
                        <ul>
                            <li>
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne 1}">first</c:if><c:if test="${pageNum eq 1}">firstDisable</c:if>"></a>
                            </li>
                            <li>
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne 1}">prev</c:if><c:if test="${pageNum eq 1}">prevDisable</c:if>"></a>
                            </li>
                            <li class="label">
                                <label>Page:</label>
                            </li>
                            <c:forEach begin="${pageNum le 2 ? 1: (pageNum + 2 gt totalPage ? totalPage - 4 : pageNum - 2)}" end="${pageNum + 2 gt totalPage ? totalPage : (pageNum le 2 ? (totalPage lt 5 ? totalPage : 5) : pageNum + 2)}" var="page">
                            <li>
                                <c:if test="${page eq pageNum}">
                                <span>${page}</span>
                                </c:if>
                                <c:if test="${page ne pageNum}">
                                <a href="javascript:;" class="page">${page}</a>
                                </c:if>
                            </li>
                            </c:forEach>
                            <li class="next">
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne totalPage}">next</c:if><c:if test="${pageNum eq totalPage}">nextDisable</c:if>"></a>
                            </li>
                            <li class="last">
                                <a href="javascript:;" class="icon <c:if test="${pageNum ne totalPage}">last</c:if><c:if test="${pageNum eq totalPage}">lastDisable</c:if>"></a>
                            </li>
                        </ul>
                        </c:if>
                    </div><!-- end of .pagination -->
                </div><!-- end of .botLine -->
            </div>

        <jsp:include page="foot.jsp"/>

    <!-- #tooltip1 -->
    <div class="tooltipsBox" id="tooltipsBox1">
        <div class="tooltipsH"><h6></h6></div>
        <div class="tooltipsC"><p></p></div>
        <div class="tooltipsF"></div>   
    </div>
</body>
</html>
