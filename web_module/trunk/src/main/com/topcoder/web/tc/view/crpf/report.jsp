<%@ page import="com.topcoder.web.tc.controller.legacy.stat.bean.CoderRatingStyleBean,
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

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
}
</SCRIPT>

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
                <jsp:param name="level1" value="events"/>
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
                     <td><img src="/i/events/crpf03/banner_online_rounds_start.gif" alt="Online rounds start November 11" width="510" height="41" vspace="15" border="0"><br/>
                     <A href="/tc?&module=Static&d1=crpf&d2=crpf_overview"><img src="/i/events/crpf03/crpf_banner_2.jpg" width="510" height="135" border="0" vspace="15" alt="TopCoder Charity Challenge benefiting the CPPF"></A></td>
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

        <table width="500" border="0" cellpadding="2" cellspacing="2" align="center">
            <rsc:iterator list="<%=donationTotal%>" id="info">
            <tr class="bodyText">
                <td align="right" nowrap class="bodyText"><h2>Total funds raised to date:</h2>
                </td>
                <td align="left" width="100%" class="bodyText"><h2>
                     $<rsc:item row="<%=info%>" name="amount" format="0.00"/></h2>
                </td>
            </tr>
        </table>
        <table width="500" border="0" cellpadding="0" cellspacing="0" align="center" class="sidebarBox">
             </rsc:iterator>
            <tr class="sidebarTitle">
                <td width="20%" align="left">
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="5"/>"><img src="/i/tournament/crpf03/rank.gif" width="43" height="26" border="0"></a>
                </td>
                <td width="30%" align="left">
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="4"/>"><img src="/i/tournament/crpf03/handle.gif" width="55" height="26" border="0"></a>
                </td>
<!--
                <td width="25%" align="center">
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="2"/>"><img src="/i/tournament/crpf03/rating.gif" width="55" height="26" border="0"></a>
                </td>
-->                
                <td width="50%" align="right">
                    <a href="<%=sessionInfo.getServletPath()+"?"+Constants.MODULE_KEY+"=CRPFReport"%><tc:sort column="1"/>"><img src="/i/tournament/crpf03/total_donation.gif" width="115" height="26" border="0"></a>
                </td>
            </tr>
            <rsc:iterator list="<%=donationInfo%>" id="info">
                <tr>
                    <td class="tourney_subnav" align="left">
                        <rsc:item row="<%=info%>" name="rank" />
                    </td>
                    <td class="tourney_subnav" >
                        <a href="/stat?c=member_profile&cr=<rsc:item row="<%=info%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=info.getIntItem("rating")%>'/>"><rsc:item row="<%=info%>" name="handle"/></a>
                    </td>
<!--                    
                    <td class="tourney_subnav"  align="center">
                        <rsc:item row="<%=info%>" name="rating"/>
                    </td>
-->                    
                    <td class="tourney_subnav" align="right">
                        $<rsc:item row="<%=info%>" name="amount" format="0.00"/>
                    </td>
                </tr>
                
            </rsc:iterator>

        </table>
        <table>
                  <tr>
                     <td class="bodyText">* Please note that online donations will take approximately 24 hours to process and appear on the Top Fundraisers list.  Mailed in donations will appear on the Top Fundraisers list as they are processed.</td>
                  </tr>   

            <tr><td><img src="/i/clear.gif" width="500" height="10" border="0"></td></tr>
        </table>
         </blockquote>
         
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="crfp_right.jsp" />
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