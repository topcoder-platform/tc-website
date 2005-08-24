<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Member Card</title>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:include page="../script.jsp" />
<% ResultSetContainer referralList = (ResultSetContainer)request.getAttribute("referralList");%>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="referrals"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td class="cardCell" width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="referrals"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

        <p>
        The following is a list of members who have listed you as a reference when they registered to become a TopCoder member. Should they earn any money as a competitor, the referring member (you) will receive a referral commission equal to 10% of any amounts earned or won by the referred member during the 12 months following registration!  To find out more about the TopCoder Referral Program, click <A href="/?t=support&c=referral">here</a>.
        </p>

        <br/>
        <table width="300" border="0" cellpadding="5" cellspacing="0" align=center>
            <tr>
                <td class="header">
                    Handle
                </td>
                <td class="header" align=right>
                    Member Since
                </td>
            </tr>
            <% if (referralList.isEmpty()) { %>
              <tr>
                <td class="formHandleOdd" colspan="2">You have no referrals.</td>
              </tr>
            <% } %>
            <rsc:iterator list="<%=referralList%>" id="info">
            <tr>
                <td class="formHandleOdd">
                    <a href="/tc?module=MemberProfile&cr=<rsc:item row="<%=info%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=info.getIntItem("rating")%>'/>"><rsc:item row="<%=info%>" name="handle"/></a>
                </td>
                <td class="formHandleOdd" align="right">
                    <rsc:item row="<%=info%>" name="member_since" format="MM.dd.yyyy"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
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
