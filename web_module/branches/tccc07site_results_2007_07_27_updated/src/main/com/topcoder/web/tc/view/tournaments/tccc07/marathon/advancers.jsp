<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType, com.topcoder.shared.dataAccess.*, 
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.StringUtils,
                 java.util.Map,
                 com.topcoder.web.common.tag.HandleTag" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />

    <script type="text/javascript">
  function next() {
    var myForm = document.advancersForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value= parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.advancersForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value-=parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

    myForm.submit();
  }
  function resetSort() {
    var myForm = document.advancersForm;
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='';
    myForm.submit();
  }
  function changeView(full) {
    var myForm = document.advancersForm;
    myForm.<%="full"%>.value=full;
    myForm.submit();
  }
</script>
</head>
<body>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="overview"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Advancers</span></h1>

<form name="advancersForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCCC07MarathonAdvancers"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
<tc-webtag:hiddenInput name="<%="full"%>"/>

                <div align="center">
                <a href="Javascript:resetSort()">Reset sorting</a>

                <c:choose>
                    <c:when test="${full}">
                        | <a href="Javascript:changeView(${!full})">Pages</a>
                        | Full view
                    </c:when>
                    <c:otherwise>
                        | Page view
                        | <a href="Javascript:changeView(${!full})">Full view</a>
                    </c:otherwise>
                </c:choose>

                <br />
                    <c:if test="${!full}">
                        <div class="pagingBox">
                            <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                            | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                        </div>
                    </c:if>
                </div>
                <br /><br />
            <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
            <thead>
                <tr><td class="title" colspan="8">Marathon Match Advancers</td></tr>
                <tr>
                    <td class="headerC">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("seed")%>"/>">Seed</a>
                    </td>
                    <td class="header" nowrap="nowrap">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("handle_sort")%>"/>">Handle</a>
                        <br /><tc-webtag:textInput name="<%=Constants.HANDLE%>" size="16" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
                    </td>
                    <td class="headerR">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round1_sort")%>"/>">Round 1</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round2_sort")%>"/>">Round 2</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round3_sort")%>"/>">Round 3</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("round4_sort")%>"/>">Round 4</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="/tc?module=TCCC07MarathonAdvancers<tc-webtag:sort includeParams='true' column="<%=rsc.getColumnIndex("finals_sort")%>"/>">Final</a>
                        <br /><a href="">details</a>
                    </td>
                </tr>
            </thead>
            <tbody>
<%-- formatting this crappy to save space in the download to the client --%>
                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=even?"dark":"light"%>">
<td class="valueC"><rsc:item name="seed" row="<%=resultRow%>"/></td>
<td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="<%=HandleTag.MARATHON_MATCH%>"/></td>
<td class="valueR"><rsc:item name="rating" row="<%=resultRow%>"/></td>
<% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round1" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round1" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round2" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round2" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round3" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round3" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round4")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round4" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round4" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="final" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="final" row="<%=resultRow%>"/></span></td>
<% } %>
</tr>
<%even=!even;%>
</rsc:iterator>
            </tbody>
            </table>
                <br />
                    <c:if test="${!full}">
                        <div align="center">
                            <div class="pagingBox">
                               <%=(rsc.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                               | <%=(rsc.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                            
                               <br>
                            
                               View &#160;
                               <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                               &#160;at a time starting with &#160;
                               <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                                <button name="nameSubmit" value="submit" type="submit">Go</button>
                            </div>
                        </div>
                    </c:if>
</form>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>