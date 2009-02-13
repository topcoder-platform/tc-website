<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>

<div align="center">
   <div class="contentOut">
      <jsp:include page="../top.jsp">
          <jsp:param name="section" value="default"/>
      </jsp:include>
      <jsp:include page="../topNav.jsp">
          <jsp:param name="node" value="contests"/>
      </jsp:include>
      <div class="contentIn">
         <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;" />
         <div class="contentSpacer">

<div class="linkBox"><A href="/?module=AdminViewContests">back to Contests</A></div>

<h1>Edit Contest Details</h1>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminEditContest"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<div class="header">Contest Details</div>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>
   <tr>
      <td colspan="2"><span class="bigRed">
      <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_NAME%>">${err}<br></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
      Contest Name:
      </td>
      <td class="value">
      <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
      </td>
   </tr>
   <tr>
      <td colspan="2"><span class="bigRed">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_STATUS_ID%>">${err}<br></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
       Status:
      </td>
      <td class="value">
      <tc-webtag:objectSelect name="<%=Constants.CONTEST_STATUS_ID%>" list="${contestStatuses}" valueField="id" textField="description"/>
      </td>
   </tr>
   <tr>
   <tr>
      <td colspan="2"><span class="bigRed">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME%>">${err}<br></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name" nowrap="nowrap">
      Contest Start (Eastern Time):
      </td>
      <td class="value">
      <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/><button id="trigger<%=Constants.START_TIME%>">Set</button>
      </td>
   </tr>
   <tr>
      <td colspan="2"><span class="bigRed">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME%>">${err}<br></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name" nowrap="nowrap">
      Contest End (Eastern Time):
      </td>
      <td class="value">
      <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/><button id="trigger<%=Constants.END_TIME%>">Set</button>
      </td>
   </tr>
   <tr>
      <td colspan="2"><span class="bigRed">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.FORUM_ID%>">${err}<br></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
      Forum:
      </td>
      <td class="value">
      <tc-webtag:rscSelect name="<%=Constants.FORUM_ID%>" list="<%=(ResultSetContainer)request.getAttribute("forums")%>" fieldText="name" fieldValue="forum_id" selectedValue="${contest.forumId}"/>
      </td>
   </tr>
<%--
   <tr>
      <td colspan="2"><span class="bigRed">
      </td>
   </tr>
   <tr>
      <td class="name">
      </td>
      <td class="value">
      </td>
   </tr>
--%>
</tbody>
</table>

</p>


<script language="javascript" type="text/javascript">
    <!--
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
                -->
</script>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.CONTEST_OVERVIEW_TEXT%>" var="overviewText"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${overviewText}">${err}
                    <br></tc-webtag:errorIterator></span>
    <strong>Contest Overview:</strong> You may include HTML, the content entered here is exactly what will be inserted into the contest
    details page.<br><br>
    <tc-webtag:textArea name="${overviewText}" rows="8" cols="80"/>
</p>


<script language="javascript" type="text/javascript">
    <!--
var defaultOverview= "This is the default overview text.  We need to come up with a real default text.";
var overviewText = getValue("document.editForm", "${overviewText}");
                       if ( overviewText==null || overviewText.length==0) {
                         putValue("document.editForm", "${overviewText}", defaultOverview);
                        }
                -->
</script>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.PRIZE_DESCRIPTION%>" var="prizeDesc"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeDesc}">${err}
                    <br></tc-webtag:errorIterator></span>
    <strong>Prize Description:</strong> You may include HTML, the content entered here is exactly what will be inserted into the contest
    details page.
    <br><br>
   <tc-webtag:textArea name="${prizeDesc}" rows="8" cols="80"/>
</p>

<script language="javascript" type="text/javascript">
    <!--
var defaultPrizeDesc= "TopCoder Studio will compensate the member with the first place submission, as selected "+
"by the client.  The payment will be distributed in one full installment once the final vector-based version of " +
"the winning submission has been received by TopCoder Studio.";
var prizeDesc = getValue("document.editForm", "${prizeDesc}");
                       if ( prizeDesc==null || prizeDesc.length==0) {
                         putValue("document.editForm", "${prizeDesc}", defaultPrizeDesc);
                        }
                -->
</script>

<p>
    <button name="submit" value="submit" type="submit">Save</button>
</p>


</form>


<c:if test="${contest!=null && !contest.new}">
    <p>
        Click
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}" target="_blank">here</a>
        to see what the contest details page will look like.
    </p>


    <br><br>

    <div class="header">Prizes</div>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="removePrizeForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminRemovePrize"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.PRIZE_PLACE%>"/>

        <p>
            <c:forEach items="${contest.prizes}" var="prize">
                Place: ${prize.place} Prize: <fmt:formatNumber value="${prize.amount}" type="currency"/>
                <button onClick="document.removePrizeForm.<%=Constants.PRIZE_PLACE%>.value ='${prize.place}'">
                    Remove</button>
                <br>
            </c:forEach>
        </p>
    </form>

    <c:set value="<%=Constants.PRIZE_PLACE%>" var="prizePlace"/>
    <c:set value="<%=Constants.PRIZE_VALUE%>" var="prizeValue"/>
    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="addPrizeForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminAddPrize"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<table cellpadding="0" cellspacing="0" class="input">
   <tr>
      <td colspan="2"><span class="bigRed">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizePlace}">${err}
      <br></tc-webtag:errorIterator></span>
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeValue}">${err}
      <br></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
      Place #:
      </td>
      <td class="value">
      <tc-webtag:textInput name="${prizePlace}"/>
      </td>
   </tr>
   <tr>
      <td class="name">
      Amount: 
      </td>
      <td class="value">
      <tc-webtag:textInput name="${prizeValue}"/><button name="submit" value="submit" type="submit">Add</button>
      </td>
   </tr>
</table>

    </form>
    <br><br>

    <div class="header">Documentation</div>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="removeDocForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminRemoveDocument"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.DOCUMENT_ID%>"/>

        <p>
            <c:forEach items="${contest.documents}" var="document">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                        ${document.originalFileName}</a>
                <button onClick="document.removeDocForm.<%=Constants.DOCUMENT_ID%>.value ='${document.id}'">
                    Remove</button>
                <br>
            </c:forEach>
        </p>
    </form>


    <c:set value="<%=Constants.DOCUMENT%>" var="doc"/>
    <c:set value="<%=Constants.DOCUMENT_TYPE_ID%>" var="docType"/>
    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="addDocumentForm" enctype="multipart/form-data">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminAddDocument"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

        <p>
    <span class="bigRed"><tc-webtag:errorIterator id="err" name="${doc}">${err}
        <br></tc-webtag:errorIterator></span>
        <span class="bigRed"><tc-webtag:errorIterator id="err" name="${doc}">${err}
            <br></tc-webtag:errorIterator></span>
            <tc-webtag:objectSelect name="${docType}" list="${docTypes}" valueField="id" textField="description"/>
            <input type="file" name="${doc}"> 
            <button name="submit" value="submit" type="submit">Add</button>
            <br><br>
            Only certain file formats are accepted, if there is something you need to upload that doesn't work, ask
            around
            to get it added.
        </p>
    </form>

</c:if>


         </div>
         <img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;" />
      </div>
      <jsp:include page="../foot.jsp"/>
      <img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
   </div>
</div>

</body>
</html>