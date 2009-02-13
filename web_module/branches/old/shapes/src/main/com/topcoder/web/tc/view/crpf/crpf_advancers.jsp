<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/tc.tld" prefix="tc" %>
<html>
<head>
<title>TopCoder Charity Challenge</title>
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
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_photos"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                  </tr>
               </table>

<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="advancers"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>



               <blockquote>
               <h2>Advancers</h2>
<!-- Online Rounds begins -->

            <p align="right">Round 1&#160;|&#160;<a href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_final">Finals</a></p>
            <table align="center" border="0" cellpadding="2" cellspacing="2" class="sidebarBox" width=400>
    		<% String sLink = "/stat?c=member_profile&cr=";%>
                <tr>
                    <td class="crpfTitle" width="100%" colspan="2" bgcolor="#4E9DD5">Round 1</td>
               </tr>
                <tr>
                    <td class="crpfAdvancersSort" width="25%" align="left" nowrap="nowrap">Handle</td>
                    <td class="crpfAdvancersSort" width="50%" align="right" nowrap="nowrap">Points</td>
               </tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 269788%>' bg='W' cid='269788' /></td><td class="sidebarText" align="right">1550.73</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 152342%>' bg='W' cid='152342' /></td><td class="sidebarText" align="right">1533.18</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 296145%>' bg='W' cid='296145' /></td><td class="sidebarText" align="right">1522.72</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 113178%>' bg='W' cid='113178' /></td><td class="sidebarText" align="right">1498.53</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7475981%>' bg='W' cid='7475981' /></td><td class="sidebarText" align="right">1481.80</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 279471%>' bg='W' cid='279471' /></td><td class="sidebarText" align="right">1437.78</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 270505%>' bg='W' cid='270505' /></td><td class="sidebarText" align="right">1416.93</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7428266%>' bg='W' cid='7428266' /></td><td class="sidebarText" align="right">1412.89</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7358573%>' bg='W' cid='7358573' /></td><td class="sidebarText" align="right">1404.89</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 251832%>' bg='W' cid='251832' /></td><td class="sidebarText" align="right">1404.07</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 155275%>' bg='W' cid='155275' /></td><td class="sidebarText" align="right">1323.66</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 2059666%>' bg='W' cid='2059666' /></td><td class="sidebarText" align="right">1293.01</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 260987%>' bg='W' cid='260987' /></td><td class="sidebarText" align="right">1214.14</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 293387%>' bg='W' cid='293387' /></td><td class="sidebarText" align="right">1196.68</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 152614%>' bg='W' cid='152614' /></td></td><td class="sidebarText" align="right">1185.74</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 299177%>' bg='W' cid='299177' /></td><td class="sidebarText" align="right">1172.24</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 306980%>' bg='W' cid='306980' /></td><td class="sidebarText" align="right">1155.66</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 297500%>' bg='W' cid='297500' /></td><td class="sidebarText" align="right">1149.49</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 264869%>' bg='W' cid='264869' /></td><td class="sidebarText" align="right">1144.70</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 283388%>' bg='W' cid='283388' /></td><td class="sidebarText" align="right">1127.21</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 293390%>' bg='W' cid='293390' /></td><td class="sidebarText" align="right">1083.53</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 154754%>' bg='W' cid='154754' /></td><td class="sidebarText" align="right">1075.14</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 129381%>' bg='W' cid='129381' /></td><td class="sidebarText" align="right">1014.15</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 2059354%>' bg='W' cid='2059354' /></td><td class="sidebarText" align="right">911.47</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7517126%>' bg='W' cid='7517126' /></td><td class="sidebarText" align="right">824.08</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 288584%>' bg='W' cid='288584' /></td><td class="sidebarText" align="right">636.49</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 268851%>' bg='W' cid='268851' /></td><td class="sidebarText" align="right">603.10</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 283374%>' bg='W' cid='283374' /></td><td class="sidebarText" align="right">583.81</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 297823%>' bg='W' cid='297823' /></td><td class="sidebarText" align="right">576.32</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 268212%>' bg='W' cid='268212' /></td><td class="sidebarText" align="right">573.59</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 287266%>' bg='W' cid='287266' /></td><td class="sidebarText" align="right">555.35</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 159594%>' bg='W' cid='159594' /></td><td class="sidebarText" align="right">548.31</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 151144%>' bg='W' cid='151144' /></td><td class="sidebarText" align="right">547.83</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 266764%>' bg='W' cid='266764' /></td><td class="sidebarText" align="right">531.01</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 153505%>' bg='W' cid='153505' /></td><td class="sidebarText" align="right">527.44</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 273112%>' bg='W' cid='273112' /></td><td class="sidebarText" align="right">521.24</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 263396%>' bg='W' cid='263396' /></td><td class="sidebarText" align="right">517.70</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 293874%>' bg='W' cid='293874' /></td><td class="sidebarText" align="right">511.10</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 301376%>' bg='W' cid='301376' /></td><td class="sidebarText" align="right">489.09</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7434314%>' bg='W' cid='7434314' /></td><td class="sidebarText" align="right">473.36</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 306872%>' bg='W' cid='306872' /></td><td class="sidebarText" align="right">465.08</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7440483%>' bg='W' cid='7440483' /></td><td class="sidebarText" align="right">441.24</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7213681%>' bg='W' cid='7213681' /></td><td class="sidebarText" align="right">344.33</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 269678%>' bg='W' cid='269678' /></td><td class="sidebarText" align="right">247.59</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 105922%>' bg='W' cid='105922' /></td><td class="sidebarText" align="right">245.37</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 105922%>' bg='W' cid='268720' /></td><td class="sidebarText" align="right">243.28</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 282718%>' bg='W' cid='282718' /></td><td class="sidebarText" align="right">242.40</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7446406%>' bg='W' cid='7446406' /></td><td class="sidebarText" align="right">241.61</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7305703%>' bg='W' cid='7305703' /></td><td class="sidebarText" align="right">240.26</td></tr>
<tr valign="top"><td class="sidebarText" nowrap=nowrap><tc:ratingImage link='<%=sLink + 7364110%>' bg='W' cid='7364110' /></td><td class="sidebarText" align="right">238.78</td></tr>
            </table><br />
               </blockquote>
            
<!-- Online Rounds ends -->
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
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