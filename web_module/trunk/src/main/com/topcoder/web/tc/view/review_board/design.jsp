<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@  page language="java"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer memberList = (ResultSetContainer)request.getAttribute("memberList"); %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>

<head>

<title>Design Review Board at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="design"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="review_boards"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value=""/>
        </jsp:include>

            <table border="0" cellspacing="10" cellpadding="0" width="100%" align="center">
                <tr>
                    <td width="49%"></td>
<%--         <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=competition"  target="_top"><img src="/i/promos/competition_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>--%>
                    <td height="42"><A href="/tc?module=ReviewBoard&ph=112"  target="_top"><img src="/i/promos/design_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
                    <td height="42"><A href="/tc?module=ReviewBoard&ph=113"  target="_top"><img src="/i/promos/development_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
                    <td width="49%"></td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="3" cellspacing="0">
                <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong> Design Review Board</strong></font></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="bodyText"><img src="/i/clear.gif" width="240" height="1" border="0"><br>
<!-- Comment out until Dev info is available            <p align="right" >
               <a href="/?t=features&amp;c=#" class="bodyText"><strong>Go to Development Review Board</strong></a>
            </p> -->
                        <p>Highly rated and experienced TopCoder members fill the ranks of the Architecture Review Board.  These members screen and review all design
                        submissions to ensure the components meet the functional requirements, are documented properly and contain the appropriate sequence, use case
                        and class diagrams.  Additionally, the Architecture Review Board recommends design enhancements and verifies the design is flexible
                        enough to be reused and customized in the future.</p>

                        <p>The following members have agreed to participate on the TopCoder Design Review Board:</p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <% int i=0; %>
                    <rsc:iterator list="<%=memberList%>" id="resultRow">
                      <% if (i<3) { %>
                        <td>
                     <% } else {  %>
                        <tr valign="top">
                     <% } %>
                        <% i++; %>
                        <div align="center">
                        <a href="/tc?module=MemberProfile&amp;cr=<rsc:item row="<%=resultRow%>" name="user_id"/>"><img src="<rsc:item row="<%=resultRow%>" name="image_path" ifNull="/i/m/nophoto.jpg"/>" alt="<rsc:item row="<%=resultRow%>" name="handle"/>" width="126" height="140" border="0"  class="myStatsPhoto"/></a>
                        <br/>
                        <span class="bodyText"><tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="design"/></span>
                        </div>
                     <% if (i<3) { %>
                          </td>
                     <% } else {  %>
                        </td>
                        </tr>
                        <% i=0; %>
                     <% } %>
                    </rsc:iterator>
                </tr>
            </table>



            <p align="middle" ><A href="mailto:service@topcodersoftware.com" class="bodyText">Have a question about the TopCoder Design Review Board?</strong></a></p>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
       <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/>
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
