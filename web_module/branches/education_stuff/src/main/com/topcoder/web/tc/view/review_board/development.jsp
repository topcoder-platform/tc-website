<%@  page language="java"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:useBean id="memberList" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<html>

<head>

<title>Development Review Board at TopCoder</title>

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
                <jsp:param name="level2" value="development"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
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
                <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong> Development Review Board</strong></font></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="bodyText"><img src="/i/clear.gif" width="240" height="1" border="0"><br>
<!-- Comment out until Dev info is available            <p align="right" >
               <a href="/?t=features&amp;c=#" class="bodyText"><strong>Go to Development Review Board</strong></a>
            </p> -->
                        <p>TopCoder Software utilizes past component development winners and accomplished TopCoder competitors to staff the Development Review Board.
                        These reviewers verify that each development submission meets the required functionality, coding style, adheres to the component design
                        and contains a suitable test suite.  Furthermore, to certify the component belongs in the TopCoder catalog, the development review board
                        adds a suite of test cases including stress, accuracy and failure tests to the component.</p>

                        <p>The following members have agreed to participate on the TopCoder Development Review Board:</p>
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
                        <a href="/stat?c=member_profile&amp;cr=<rsc:item row="<%=resultRow%>" name="user_id"/>"><img src="<rsc:item row="<%=resultRow%>" name="image_path" ifNull="/i/m/nophoto.jpg"/>" alt="<rsc:item row="<%=resultRow%>" name="handle"/>" width="126" height="140" border="0"  class="myStatsPhoto"/></a>
                        <br/>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=<rsc:item row="<%=resultRow%>" name="user_id"/>"><strong><rsc:item row="<%=resultRow%>" name="handle"/></strong></a>
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


            <p align="middle" ><A href="mailto:service@topcodersoftware.com" class="bodyText">Have a question about the TopCoder Development Review Board?</strong></a></p>

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
