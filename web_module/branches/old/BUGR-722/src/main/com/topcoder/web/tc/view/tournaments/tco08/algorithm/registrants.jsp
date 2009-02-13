<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType, com.topcoder.shared.dataAccess.*, 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../../script.jsp" />

    <script type="text/javascript">
  function next() {
    var myForm = document.registrantsForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value= parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.registrantsForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value-=parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

    myForm.submit();
  }
</script>
    
</head>
<body id="page_sub">

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list"));
String eventType = (String) request.getAttribute("et"); %>

<div id="wrapper">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="registrants"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <h2>Registrants</h2>

<form name="registrantsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Registrants"/>
<tc-webtag:hiddenInput name="et" value="<%=eventType%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<div align="center">
<div class="pagingBox">
<%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>
   <br />

<table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
<thead>
    <tr><th colspan="3">Registrants: ${numRegistrants}</th></tr>
    <tr>
        <th nowrap="nowrap">
            <a href="/tco08?module=Registrants&amp;et=<%=eventType%><tc-webtag:sort column="<%=rsc.getColumnIndex("rank")%>"/>">TCO Rank</a>
        </th>
<%-- show after seeds are assigned
        <th>
            <a href="">Seed</a>
        </th>
--%>
        <th width="100%">
            <a href="/tco08?module=Registrants&amp;et=<%=eventType%><tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
            <br /><tc-webtag:textInput name="<%=Constants.HANDLE%>" size="16" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
        </th>
        <th>
            <a href="/tco08?module=Registrants&amp;et=<%=eventType%><tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
        </th>
    </tr>
</thead>
<tbody>
        <%boolean even = false;%>
        <rsc:iterator list='<%=rsc%>' id="resultRow">
            <tr class="<%=(even ? "dark" : "light")%>">
                <td class="valueC">
                    <rsc:item name="rank" row='<%=resultRow%>'/>
                </td>
<%--
                <td class="valueC">
                    1234
                </td>
--%>
                <td class="value">
                    <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm" darkBG="true" />
                </td>
                <td class="valueR">
                    <rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/>
                </td>
            </tr>
            <%even = !even;%>
        </rsc:iterator>
</tbody>
</table>

<div class="pagingBox">
   <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
   | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>

   <br />

   View &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
   &#160;at a time starting with &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
    <button name="nameSubmit" value="submit" type="submit">Go</button>
</div>
</div>

</form>


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>