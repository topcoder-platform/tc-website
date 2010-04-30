<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents new/edit contest page for Studio administrators
  -
  - Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) changes:
  - The following fields were added:
  -     - Radio buttons to select contest format "single-round" or "multi-round"
  -     - Round One Specifics
  -     - Round Two Specifics
  -     - Milestone's number of prizes and amount
  -     - Milestone date
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.admin.ViewContest" %>
<%@ page import="com.topcoder.web.studio.model.ContestProperty" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.CONTEST_OVERVIEW_TEXT%>" var="overviewText"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.PRIZE_DESCRIPTION%>" var="prizeDesc"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.OTHER_FILE_TYPES%>" var="otherFileTypes"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.FULL_DESCRIPTION%>" var="fullDescription"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.SUBMISSION_FILE_FORMAT%>" var="submissionFileFormat"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.SIZE_REQUIREMENTS%>" var="sizeRequirements"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.FONT_REQUIREMENTS%>" var="fontRequirements"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.COLOR_REQUIREMENTS%>" var="colorRequirements"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.CONTENT_REQUIREMENTS%>" var="contentRequirements"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.OTHER_REQUIREMENTS%>" var="otherRequirements"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.ELIGIBILITY%>" var="eligibility"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.WINNER_SELECTION%>" var="winnerSelection"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.DIGITAL_RUN_POINTS%>" var="digitalRunPoints"/>
<c:set value="<%=Constants.CONTEST_FORMAT%>" var="CONTEST_FORMAT"/>
<c:set value="<%=Constants.MILESTONE_DATE%>" var="MILESTONE_DATE"/>
<c:set value="<%=Constants.CONTEST_ROUND_ONE_SPECIFICS%>" var="CONTEST_ROUND_ONE_SPECIFICS"/>
<c:set value="<%=Constants.CONTEST_ROUND_TWO_SPECIFICS%>" var="CONTEST_ROUND_TWO_SPECIFICS"/>
<c:set value="<%=Constants.MILESTONE_PRIZE_AMOUNT%>" var="MILESTONE_PRIZE_AMOUNT"/>
<c:set value="<%=Constants.NUMBER_MILESTONE_PRIZES%>" var="NUMBER_MILESTONE_PRIZES"/>
<c:set value="<%=ViewContest.NUMBER_MILESTONE_PRIZES_OPTIONS%>" var="NUMBER_MILESTONE_PRIZES_OPTIONS"/>
<c:set value="<%=ViewContest.SINGLE_ROUND%>" var="SINGLE_ROUND"/>
<c:set value="<%=ViewContest.MULTI_ROUND%>" var="MULTI_ROUND"/>
<c:set value="<%=Constants.JS_DATE_FORMAT%>" var="JS_DATE_FORMAT"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Edit Contests</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages();
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <%-- Turn off in Admin
    <script type="text/javascript" language="javascript">

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


    });
    </script>
    --%>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css" />
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <script language="javascript" type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script language="javascript" type="text/javascript" src="/js/jquery.textarearesizer.compressed-1.0.4.js"></script>

    <script type="text/javascript">
        //<![CDATA[[
            /* jQuery textarea resizer plugin usage */
            $(document).ready(function() {
                    $('textarea.resizable:not(.processed)').TextAreaResizer();
            });
        //]]>
    </script>
    <script language="javascript" type="text/javascript">
        //<![CDATA[[
        var defaults = new Array();
        defaults['${overviewText}'] ="[Copy Project Overview info from Spec into this area.]\n\n" +
                "<p><b>Entries must be your original work, and must not infringe on the copyright or licenses of others. " +
                                     "Stock art, clip art, templates and other design elements from other sources are " +
                                     " prohibited unless specifically permitted here in the Contest Details.</b></p>"
        defaults['${prizeDesc}'] ="The payment will be distributed in one full installment once the final version of the " +
                    "winning submission has been downloaded by the client. If final fixes were required and not completed" +
                    " on time, the member's payment may be reduced. " +
                    "Any and all applicable taxes on prizes are the sole responsibility of the prizewinner(s)." ;
        defaults['${winnerSelection}'] = "Submissions go through an initial screening process during the submission phase. " +
                                         "Passing submissions are then presented to the client. Winners are selected by the " +
                                         "client and are chosen solely at the Client's discretion." +
                                         " If a winning member has not met all of the requirements listed on the Contest Details page," +
                                         " the winner may be contacted with a clear list of final fixes. If the member does" +
                                         " not complete the final fixes within 72 hours, their payment may be reduced." ;
        defaults['${eligibility}'] = "You must be a TopCoder Studio member, at least 18 years of age, meeting all of the " +
                                     " membership requirements. In addition, you must fit into one of the following categories. " +
                                   " If you reside in the United States, you must be either: " +
                                " <ul><li>A US Citizen</li> " +
                                " <li>A Lawful Permanent Resident of the US</li> " +
                                " <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li></ul> " +
                                " If you do not reside in the United States: " +
                                " <ul><li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li></ul>";
        function setDefault(fieldName) {
            $("#"+fieldName).val(defaults[fieldName]);
        }
        /*
        go through and find all the spans that are on top of the text areas for the default text link.  If
        we have default text, then put the link in there, if we don't, then don't.
         */
        var spanPrefix = "defaultSpan_";
            $(document).ready(function() {
                $("span").filter(function() {
                    return this.id && this.id.indexOf(spanPrefix) == 0;
                }).each(function() {
                   var currId = this.id.substring(spanPrefix.length);
                   if (defaults[currId]) {
                      $(this).html(" (<a href=\"javascript:setDefault('" + currId + "')\">use default</a>)");
                   }
                })
            });
        //]]>
    </script>
    <script type="text/javascript" xml:space="preserve">
        //<![CDATA[[
        var contestTypeImageFlag = new Array();
        var contestTypeFileFlag = new Array();
        contestTypeImageFlag[0] = '';
        contestTypeFileFlag[0] = '';
        <c:forEach items="${contestTypes}" var="type" varStatus="index">
            contestTypeImageFlag[${index.index + 1}] = '${type.previewImageRequired ? 'true' : 'false'}';
            contestTypeFileFlag[${index.index + 1}] = '${type.previewFileRequired ? 'true' : 'false'}';
        </c:forEach>
        function chooseType() {
            var formName = "document.editForm";
            var selectedType = getSelectedOption(formName, "<%=Constants.CONTEST_TYPE%>");
            setSelectedOption(formName, '<%=Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_IMAGE%>', contestTypeImageFlag[selectedType.index]);
            setSelectedOption(formName, '<%=Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_FILE%>', contestTypeFileFlag[selectedType.index]);
        }
        function updateDocument(docId) {
            var formName = "document.removeDocForm";
            putValue(formName, '<%=Constants.MODULE_KEY%>', 'UpdateDocument');
            putValue(formName, '<%=Constants.DOCUMENT_ID%>', '' + docId);
        }
        //]]>
    </script>
    <style type="text/css">
            div.grippie {
                    background:#EEEEEE url(/i/layout/grippie.png) no-repeat scroll center 2px;
                    border-color:#DDDDDD;
                    border-style:solid;
                    border-width:0pt 1px 1px;
                    cursor:s-resize;
                    height:9px;
                    overflow:hidden;
            }
            .resizable-textarea textarea {
                    display:block;
                    margin-bottom:0pt;
                    width:95%;
                    height: 20%;
            }
    </style>


    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp"/>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">back to
    Contests</a></div>


<c:if test="${contest.id>0}">
    <div class="breadcrumb">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">Contests</a>
        &gt;
        ${contest.name}
        <c:if test="${not empty contest.submissions}">
            &gt;
            <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}">submissions</a>
        </c:if>
    </div>
</c:if>


<h1>Edit Contest Details</h1>


<form action="${sessionInfo.servletPath}" method="post" name="editForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditContest"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<%-- Since TopCoder Studio Modifications v2 Assembly (Req# 5.13) - displaying the username for the creator
     of the contest --%>
<p>Created by ${contestCreatorHandle}</p>

<p>
    * = required <br/>
    ** = only required if multi-round is selected
</p>

<fieldset>
<legend>General Information</legend>
<table cellpadding="0" cellspacing="0" class="input">
<tbody>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_NAME%>">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Contest:</div>
    </td>
    <td class="value" width="100%">
        <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
    </td>
</tr>
<%-- Since TopCoder Studio Modifications Assembly v2 (Req# 5.1.1) - the client name is added --%>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_PROPERTY + ContestProperty.CLIENT%>">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Client:</div>
    </td>
    <td class="value" width="100%">
        <tc-webtag:textInput name="<%=Constants.CONTEST_PROPERTY + ContestProperty.CLIENT%>"/>
        <div><strong>WARNING:</strong> Please be aware that anything you enter in this field will be visible to the public, as part of the Contest Details.</div>
    </td>
</tr>

<%-- Since Digital Run v2.0 - digital run points are added --%>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_PROPERTY + ContestProperty.DIGITAL_RUN_POINTS%>">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Digital Run points:</div>
    </td>
    <td class="value" width="100%">
        <tc-webtag:textInput name="<%=Constants.CONTEST_PROPERTY + ContestProperty.DIGITAL_RUN_POINTS%>"/>
    </td>
</tr>

<%-- Since TopCoder Studio Modifications Assembly v2 (Req# 5.4) - the contest types are added --%>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_TYPE%>">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Contest Type:</div>
    </td>
    <td class="value" width="100%">
        <tc-webtag:objectSelect name="<%=Constants.CONTEST_TYPE%>" list="${contestTypes}" valueField="id"
                                onChange="chooseType()" textField="description"/>
<%--
        <input name="NAME" value="Other" type="text" />
--%>
    </td>
</tr>

<%-- Since TopCoder Studio Modifications Assembly v2 (Req# 5.5) - the contest channels are added --%>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_CHANNEL%>">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Contest Channel:</div>
    </td>
    <td class="value" width="100%">
        <tc-webtag:objectSelect name="<%=Constants.CONTEST_CHANNEL%>" list="${contestChannels}" valueField="id"
                                textField="description" useTopValue="false"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${CONTEST_FORMAT}">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Contest Format:</div>
    </td>
    <td class="value" width="100%">
        <tc-webtag:radioButton name="${CONTEST_FORMAT}" value="${SINGLE_ROUND}"/> Single-Round<br/>
        <tc-webtag:radioButton name="${CONTEST_FORMAT}" value="${MULTI_ROUND}"/> Multi-Round
    </td>
</tr>

<%-- Since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5) - the intended medium types are added --%>
<c:set var="mediumTypePrefix" value="<%=Constants.MEDIUM%>"/>
<c:set var="mediumTypes" value="${requestScope['mediums']}"/>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.MEDIUM%>">
            <span class="bigRed">${err}<br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Medium: (Check all that apply)</div>
    </td>
    <td class="value" width="100%">
        <c:forEach items="${mediumTypes}" var="medium">
            <div><tc-webtag:chkBox name="${mediumTypePrefix}${medium.id}"/> ${medium.description}</div>
        </c:forEach>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_STATUS_ID%>"> <span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Status:</div>
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="<%=Constants.CONTEST_STATUS_ID%>" list="${contestStatuses}" valueField="id"
                                textField="description"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME%>"><span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Contest Start (Eastern Time):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/>
        <button id="trigger<%=Constants.START_TIME%>">Set</button>
    </td>
</tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${MILESTONE_DATE}"><span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>** Milestone Date (Eastern Time):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="${MILESTONE_DATE}" id="${MILESTONE_DATE}"/>
        <button id="trigger${MILESTONE_DATE}">Set</button>
    </td>
</tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME%>"><span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Contest End (Eastern Time):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/>
        <button id="trigger<%=Constants.END_TIME%>">Set</button>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.WINNER_ANNOUNCEMENT_TIME%>"><span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Winner(s) Announced (Eastern Time):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.WINNER_ANNOUNCEMENT_TIME%>" id="<%=Constants.WINNER_ANNOUNCEMENT_TIME%>"/>
        <button id="trigger<%=Constants.WINNER_ANNOUNCEMENT_TIME%>">Set</button>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.FORUM_ID%>"><span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Forum:</div>
    </td>
    <td class="value">
        <tc-webtag:rscSelect name="<%=Constants.FORUM_ID%>" list="${forums}" fieldText="name"
                             fieldValue="forum_id" selectedValue="${contest.forumId}"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EVENT_ID%>"><span class="bigRed">${err}</span>
            <br /></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Event:</div>
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="<%=Constants.EVENT_ID%>" list="${events}" valueField="id" textField="description"/>
    </td>
</tr>

<c:set value="<%=Constants.PROJECT_ID_KEY%>" var="projectId"/>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${projectId}"><span class="bigRed">${err}</span>
            <br /></tc-webtag:errorIterator>
    </td>
</tr>

<tr>
    <td class="field">
        <div>Project:</div>
    </td>
    <td class="value">
        <tc-webtag:rscSelect name="${projectId}" list="${projects}" fieldText="project_name"
                             fieldValue="project_id"/>
    </td>
</tr>
</tbody>
</table>
</fieldset>


<fieldset>
<legend>Automatic Screening & Admin Functions </legend>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.VIEWABLE_SUBMISSIONS%>" var="viewSubmissions"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${viewSubmissions}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Are submissions viewable?:</div>
    </td>
    <td class="value">
        <tc-webtag:listSelect name="${viewSubmissions}" useTopValue="false" list="${viewSubmissionAnswers}"/>
    </td>
</tr>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.VIEWABLE_SUBMITTERS%>" var="viewSubmitters"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${viewSubmitters}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Are submitter user names viewable?:</div>
    </td>
    <td class="value">
        <tc-webtag:listSelect name="${viewSubmitters}" useTopValue="false" list="${viewSubmitterAnswers}"/>
    </td>
</tr>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MAX_SUBMISSIONS%>" var="maxSubmissions"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${maxSubmissions}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Max # of submissions<br />(leave empty if there should be no max):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="${maxSubmissions}" size="4"/>
    </td>
</tr>
</tbody>
</table>

</fieldset>

<fieldset>
<legend>Details of Contest</legend>

<table>
<tbody>
<studio_tags:editContestProperty name="${overviewText}" title="* Contest Summary"/>
<studio_tags:editContestProperty name="${CONTEST_ROUND_ONE_SPECIFICS}" title="** Round 1 Specifics"/>
<studio_tags:editContestProperty name="${CONTEST_ROUND_TWO_SPECIFICS}" title="** Round 2 Specifics"/>
<studio_tags:editContestProperty name="${fullDescription}" title="* Full Description"/>
<studio_tags:editContestProperty name="${eligibility}" title="* Eligibility"/>
<studio_tags:editContestProperty name="${winnerSelection}" title="* Notes on Winners Selection"/>
<studio_tags:editContestProperty name="${prizeDesc}" title="* Prize Description"/>
</tbody>
</table>

</fieldset>

<fieldset>
<legend>Specific Contest Details</legend>

<table>
<tbody>
<studio_tags:editContestProperty name="${sizeRequirements}" title="Notes on Size"/>
<studio_tags:editContestProperty name="${fontRequirements}" title="Notes on Fonts"/>
<studio_tags:editContestProperty name="${colorRequirements}" title="Notes on Colors"/>
<studio_tags:editContestProperty name="${contentRequirements}" title="Content Requirements"/>
<studio_tags:editContestProperty name="${otherRequirements}" title="Other Requirements"/>
</tbody>
</table>

</fieldset>

<fieldset>
<legend>Submission File Format</legend>

<table>
<tbody>
<studio_tags:editContestProperty name="${otherFileTypes}" title="Submission file formats (Studio contests never use this field)"/>
<studio_tags:editContestProperty name="${submissionFileFormat}" title="* Notes on Submission File(s)"/>
</tbody>
</table>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>
<%-- Since TopCoder Studio Modifications Assembly v2 (Req# 5.6) - the Require Preview Image flag is added --%>
<c:set value="<%=Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_IMAGE%>" var="reqPreviewImage"/>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${reqPreviewImage}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Require Preview Image?:</div>
    </td>
    <td class="value">
        <tc-webtag:listSelect name="${reqPreviewImage}" useTopValue="true" list="${requirePreviewImageAnswers}"/>
    </td>
</tr>

<%-- Since TopCoder Studio Modifications Assembly v2 (Req# 5.6) - the Require Preview File flag is added --%>
<c:set value="<%=Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_FILE%>" var="reqPreviewFile"/>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${reqPreviewFile}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>* Require Preview File?:</div>
    </td>
    <td class="value">
        <tc-webtag:listSelect name="${reqPreviewFile}" useTopValue="true" list="${requirePreviewFileAnswers}"/>
    </td>
</tr>
</tbody>
</table>

</fieldset>


<fieldset>
<legend>Final File Formats</legend>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>
<c:set value="<%=Constants.FILE_TYPE%>" var="fileType"/>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${fileType}"><span class="bigRed">${err}
            <br /></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Final File(s) Format:</div>
    </td>
    <td class="value">
        <tc-webtag:objectSelect name='${fileType}' size="4" useTopValue="false" multiple="true" list="${fileTypes}"
                                valueField="id" textField="description"/>
    </td>
</tr>
</tbody>
</table>

</fieldset>

<fieldset>
<legend>Add Milestone Prizes</legend>
    <table cellpadding="0" cellspacing="0" class="input">
        <tr>
            <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${MILESTONE_PRIZE_AMOUNT}">${err}
                  <br /></tc-webtag:errorIterator></span>
            </td>
        </tr>
        <tr>
            <td class="field">
                <div>Number of prizes:</div>
            </td>
            <td class="value">
                <tc-webtag:stringSelect name="${NUMBER_MILESTONE_PRIZES}" useTopValue="false"
                    list="${NUMBER_MILESTONE_PRIZES_OPTIONS}"/>
            </td>
        </tr>
        <tr>
            <td class="field">
                <div>Amount:</div>
            </td>
            <td class="value">
                <tc-webtag:textInput name="${MILESTONE_PRIZE_AMOUNT}"/>
            </td>
        </tr>
    </table>
</fieldset>

<%-- Since TopCoder Studio Modifications v2 Assembly (Req.# 5.1.3, 5.1.4)
     - the width and height are replaced with size requirements --%>

<%--
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MIN_HEIGHT%>" var="minHeight"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MAX_HEIGHT%>" var="maxHeight"/>
<tr>
    <td colspan="2">
        <div style="padding: 10px 0px 10px 0px;">
            <strong>Size Requirements:</strong> Leave blank for no requirements. Enter the same value for the min and
            max to require an exact size. If you allow non-image file submissions
            (pdf, txt, html)
            they will not be held to these requirements.
        </div>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${minHeight}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${maxHeight}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Height Requirements (px):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="${minHeight}" size="4"/>
        to
        <tc-webtag:textInput name="${maxHeight}" size="4"/>
    </td>
</tr>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MIN_WIDTH%>" var="minWidth"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MAX_WIDTH%>" var="maxWidth"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${minWidth}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${maxWidth}">${err}
                    <br /></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="field">
        <div>Width Requirements (px):</div>
    </td>
    <td class="value">
        <tc-webtag:textInput name="${minWidth}" size="4"/>
        to
        <tc-webtag:textInput name="${maxWidth}" size="4"/>
    </td>
</tr>
--%>

<script language="javascript" type="text/javascript">
    Calendar.setup(
    {
        inputField  : "<%=Constants.START_TIME%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.START_TIME%>",       // ID of the button
        showsTime   : true,
        singleClick  : false,
        cache       : true
    }
            );
    Calendar.setup(
    {
        inputField  : "<%=Constants.END_TIME%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.END_TIME%>",      // ID of the button
        showsTime    : true,
        singleClick  : false,
        cache       : true
    }
            );
    Calendar.setup(
    {
        inputField  : "<%=Constants.WINNER_ANNOUNCEMENT_TIME%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.WINNER_ANNOUNCEMENT_TIME%>",      // ID of the button
        showsTime    : true,
        singleClick  : false,
        cache       : true
    }
            );
    Calendar.setup(
            {
                inputField  : "${MILESTONE_DATE}",         // ID of the input field
                ifFormat    : "${JS_DATE_FORMAT}",    // the date format
                button      : "trigger${MILESTONE_DATE}",      // ID of the button
                showsTime    : true,
                singleClick  : false,
                cache       : true
            }
            );
</script>

<p>
    <button name="submit" value="submit" type="submit">Save</button>
</p>


</form>


<c:if test="${contest!=null && contest.id>0}">
    <p>
        Click
        <a href="/?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}"
           target="_blank">here</a>
        to see what the contest details page will look like.
    </p>


    <c:set value="<%=Constants.DOCUMENT%>" var="doc"/>
    <c:set value="<%=Constants.DOCUMENT_TYPE_ID%>" var="docType"/>
    <c:set value="<%=Constants.DOC_DESC%>" var="docDesc"/>


<h2>Documentation</h2>

    <form action="${sessionInfo.servletPath}" method="post" name="removeDocForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RemoveDocument"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.DOCUMENT_ID%>"/>

<fieldset>
<legend>Currently Attached</legend>

        <div id="docList">
            <c:forEach items="${contest.documents}" var="document">
                <div class="editConDoc">
                    <a href="/?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                        ${document.originalFileName}
                    </a>
                    <div class="editConDocIndent">
                        <div>
                            <tc-webtag:errorIterator id="err" name="${docType}_${document.id}"><span class="bigRed">${err}</span></tc-webtag:errorIterator>
                        </div>
                        <div>
                            Type: <tc-webtag:objectSelect name="${docType}_${document.id}" list="${docTypes}" valueField="id" textField="description" useTopValue="false"/>
                        </div>
                        <div>
                            <tc-webtag:errorIterator id="err" name="${docType}_${document.id}"><span class="bigRed">${err}</span><br /></tc-webtag:errorIterator>
                        </div>
                        <div>
                            Description: <tc-webtag:textInput name="${docDesc}_${document.id}" maxlength="<%=Constants.MAX_DOCUMENT_DESC_VALUE_LENGTH%>"/>
                        </div>
                        <div>
                        <button onClick="updateDocument(${document.id})">
                            Save changes
                        </button>
                        <button onClick="document.removeDocForm.<%=Constants.DOCUMENT_ID%>.value ='${document.id}'">
                            Remove
                        </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
</fieldset>

    </form>

    <form action="${sessionInfo.servletPath}" method="post" name="addDocumentForm"
          enctype="multipart/form-data">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AddDocument"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
<fieldset>
<legend>Add Document</legend>
        <div class="editConDoc">
            <div>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${docDesc}">${err}</tc-webtag:errorIterator></span>
            </div>
            <div>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${doc}">${err}<br /></tc-webtag:errorIterator></span>
            </div>
            <div>
                File: <input type="file" name="${doc}"/>
            </div>
            <div class="editConDocIndent">
                <div>
                    Type: <tc-webtag:objectSelect name="${docType}" list="${docTypes}" valueField="id" textField="description"/>
                </div>
                <div>
                    Description: <tc-webtag:textInput name="${docDesc}"/>
                </div>
                <div>
                    <button name="submit" value="submit" type="submit">Add</button>
                </div>
            </div>
            <p>
                Only certain file formats are accepted, if there is something you need to upload that doesn't work, ask around to get it added.
            </p>
        </div>
</fieldset>
    </form>



<c:set value="<%=PrizeType.CONTEST%>" var="contestPrize"/>

<h2>Prize(s)</h2>

<form action="${sessionInfo.servletPath}" method="post" name="removePrizeForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RemovePrize"/>
    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.PRIZE_ID%>"/>

<fieldset>
<legend>Current Prizes</legend>
        <c:forEach items="${contest.prizes}" var="prize">
            Type: ${prize.type.description}
            <c:if test="${prize.type.id==contestPrize}">
                Place: ${prize.place}
            </c:if>
            Prize Amount:
            <fmt:formatNumber value="${prize.amount}" type="currency"/>
            <button onClick="document.removePrizeForm.<%=Constants.PRIZE_ID%>.value ='${prize.id}'">
                Remove
            </button>
            <br />
        </c:forEach>
</fieldset>
</form>

<c:set value="<%=Constants.PRIZE_PLACE%>" var="prizePlace"/>
<c:set value="<%=Constants.PRIZE_VALUE%>" var="prizeValue"/>
<c:set value="<%=Constants.PRIZE_TYPE_ID%>" var="prizeType"/>
<form action="${sessionInfo.servletPath}" method="post" name="addPrizeForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AddPrize"/>
    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<fieldset>
<legend>Add Prize</legend>
    <table cellpadding="0" cellspacing="0" class="input">
        <tr>
            <td colspan="2">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizePlace}">${err}
          <br /></tc-webtag:errorIterator></span>
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeValue}">${err}
          <br /></tc-webtag:errorIterator></span>
            </td>
        </tr>
        <tr>
            <td class="field">
                <div>Place #:</div>
            </td>
            <td class="value">
                <tc-webtag:textInput name="${prizePlace}"/>
            </td>
        </tr>
        <tr>
            <td class="field">
                <div>Amount:</div>
            </td>
            <td class="value">
                <tc-webtag:textInput name="${prizeValue}"/>
            </td>
        </tr>

        <tr>
            <td class="field">
                <div>Prize Type:</div>
            </td>
            <td class="value">
                <tc-webtag:objectSelect name='${prizeType}' list="${prizeTypes}" valueField="id" textField="description"/>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="value">
                <button name="submit" value="submit" type="submit">Add</button>
            </td>
        </tr>
    </table>

</fieldset>

</form>

<p>
    * = required <br/>
    ** = only required if multi-round is selected
</p>


    <c:if test="${not empty contest.project}">

        <div class="header">After Contest</div>


        <form action="${sessionInfo.servletPath}" method="post" name="sendToReviewForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SendToReview"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
            <button name="submit" value="submit" type="submit">
                Send Submissions to Online Review
            </button>

        </form>

        <c:if test="${resultsReady}">
            <form action="${sessionInfo.servletPath}" method="post" name="loadromReviewForm">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="LoadFromReview"/>
                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                <button name="submit" value="submit" type="submit">
                    Load Results From Online Review
                </button>

            </form>

        </c:if>
    </c:if>

</c:if>



                        <br clear="all"/>
                    </div>
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
