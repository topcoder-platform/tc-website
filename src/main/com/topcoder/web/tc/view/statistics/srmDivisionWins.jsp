<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>

<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% ResultSetContainer list = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("srm_division_wins");%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <script type="text/javascript">
        function submitEnter(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
        document.srmDivisionWinsForm.submit();
        return false;
        } else return true;
        }
        function next() {
        var myForm = document.srmDivisionWinsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        myForm.submit();
        }
        function previous() {
        var myForm = document.srmDivisionWinsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

        myForm.submit();
        }
    </script>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_match_winners"/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
                <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Winners"/>
</jsp:include>

    <form name="srmDivisionWinsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SrmDivisionWins"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

        <div class="pagingBox">
                    <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
            | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
        </div>

         * the number of wins the competitor had as a result of that match
               <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                     <tr><td class="title" colspan="5">Algorithm Match Winners</td></tr>
                     <tr>
                        <TD class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true" excludeParams="sr" />">Match</a></td>
                        <TD class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" excludeParams="sr" />">Division I winner</a></td>
                        <TD class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true" excludeParams="sr" />">Wins</a>*</td>
                        <TD class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true" excludeParams="sr" />">Division II winner</a></td>
                        <TD class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true" excludeParams="sr" />">Wins</a>*</td>
                    </tr>
   <% boolean even = false; %>

                    <rsc:iterator list="<%=list%>" id="resultRow">
                        <tr class="<%=even?"dark":"light"%>">
                            <%
                            Number n1 = (Number)resultRow.getItem("winner1").getResultData();
                            Number n2 = (Number)resultRow.getItem("winner2").getResultData();
                            long winner1 = (n1 == null ? -1 : n1.longValue()),
                                    winner2 = (n2 == null ? -1 : n2.longValue());
                            %>
                            <td class="value">
                                <a href="/stat?c=round_overview&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>"><rsc:item name="name" row="<%=resultRow%>"/></a>
                            </td>
                            <% if (winner1 == -1) { %>
                                <td class="value">N/A</td><td></td>
                            <% } else { %>
                                <td class="value"><tc-webtag:handle coderId='<%= winner1 %>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                <td class="valueC"><rsc:item name="wins1" row="<%=resultRow%>"/></td>
                            <% } %>

                            <% if (winner2 == -1) { %>
                                <td class="value">N/A</td><td></td>
                            <% } else { %>
                                <td class="value"><tc-webtag:handle coderId='<%= winner2 %>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                <td class="valueC"><rsc:item name="wins2" row="<%=resultRow%>"/></td>
                            <% } %>
                        </tr>
                        <% even = !even;%>
                    </rsc:iterator>

   </table>
        <div class="pagingBox">
                        <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
            | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>

            <br>

            View &#160;
            <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
            &#160;at a time starting with &#160;
            <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
            <a href="javascript:document.srmDivisionWinsForm.submit();" class="bcLink">&#160;[ submit ]</a>
        </div>

        </form>


        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
