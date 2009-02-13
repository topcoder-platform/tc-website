<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>
          
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>TopCoder Statistics</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

        <jsp:include page="../script.jsp" />
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
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
            }
            function previous() {
            var myForm = document.srmDivisionWinsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
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


        <%
        ResultSetContainer list = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("srm_division_wins");
        %>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="../includes/global_left.jsp">
                        <jsp:param name="level1" value="statistics"/>
                        <jsp:param name="level2" value="quick_stats"/>
                    </jsp:include>                                    
                </td>
                <!-- Left Column Ends -->

                <!-- Center Column Begins -->
                <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="SRM Division Winners"/>
                </jsp:include>

                <form name="srmDivisionWinsForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SrmDivisionWins"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

                <div class="pagingBox">
                    <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                </div>

                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                    <tr>
                        <TD><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true" excludeParams="sr" />" class="statLink">Contest</a></td>
                        <TD><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" excludeParams="sr" />" class="statLink">Division I winner</td>
                        <TD><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true" excludeParams="sr" />" class="statLink">Wins</td>
                        <TD><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true" excludeParams="sr" />" class="statLink">Division II winner</td>
                        <TD><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true" excludeParams="sr" />" class="statLink">Wins</td>
                    </tr>
                    <rsc:iterator list="<%=list%>" id="resultRow">
                        <TR>
                            <%
                            Number n1 = (Number)resultRow.getItem("winner1").getResultData();
                            Number n2 = (Number)resultRow.getItem("winner2").getResultData();
                            long winner1 = (n1 == null ? -1 : n1.longValue()),
                                    winner2 = (n2 == null ? -1 : n2.longValue());
                            %>
                            <td><rsc:item name="name" row="<%=resultRow%>"/></td>
                            <% if (winner1 == -1) { %>
                                <td>N/A</td><td></td>
                            <% } else { %>
                                <td><tc-webtag:handle coderId='<%= winner1 %>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                <td><rsc:item name="wins1" row="<%=resultRow%>"/></td>
                            <% } %>

                            <% if (winner2 == -1) { %>
                                <td>N/A</td><td></td>
                            <% } else { %>
                                <td><tc-webtag:handle coderId='<%= winner2 %>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                <td><rsc:item name="wins2" row="<%=resultRow%>"/></td>
                            <% } %>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                        </TR>
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

                <!-- Right Column -->
                <td width="170">
                    <jsp:include page="../public_right.jsp">
                        <jsp:param name="level1" value="privatelabel"/>
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