<%@ page import="com.topcoder.web.stat.bean.CoderRatingStyleBean,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="donationInfo" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<jsp:useBean id="donationTotal" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Donation Info</title>
<jsp:include page="../script.jsp" />
</head>
<body>
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="tournaments"/>
                <jsp:param name="level2" value="charity"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
               <jsp:include page="../body_top.jsp" >
                  <jsp:param name="image" value="events"/>
                  <jsp:param name="image1" value="white"/>
                  <jsp:param name="title" value="TopCoder Charity Challenge"/>
               </jsp:include>

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td><img src="/i/tournament/crpf03/crpf_banner.gif" width="601" height="152" border="0"  vspace="15"/></td>
                  </tr>
               </table>

<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="fundraisers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>



               <blockquote>

        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr class="bodyText">
                <td align="center">
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="5" />">Rank</a>
                </td>
                <td>
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="4"/>">Handle</a>
                </td>
                <td>
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="2"/>">Rating</a>
                </td>
                <td align="center">
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="1"/>">Total Donation</a>
                </td>
            </tr>
            <rsc:iterator list="<%=donationInfo%>" id="info">
                <tr>
                    <td class="tourney_subnav" align="center">
                        <rsc:item row="<%=info%>" name="rank" />
                    </td>
                    <td class="tourney_subnav" >
                        <a href="/stat?c=member_profile&cr=<rsc:item row="<%=info%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=info.getIntItem("rating")%>'/>"><rsc:item row="<%=info%>" name="handle"/></a>
                    </td>
                    <td class="tourney_subnav" >
                        <rsc:item row="<%=info%>" name="rating"/>
                    </td>
                    <td class="tourney_subnav" align="center">
                        $<rsc:item row="<%=info%>" name="amount" format="0.00"/>
                    </td>
                </tr>
            </rsc:iterator>

            <rsc:iterator list="<%=donationTotal%>" id="info">
            <tr>
                <td colspan="3">
                  Total:
                </td>
                <td>
                    $<rsc:item row="<%=info%>" name="amount" format="0.00"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
         </blockquote>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="crpf"/>
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