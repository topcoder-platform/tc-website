<%@ page
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.web.stat.common.JSPUtils,com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder :: Statistics</TITLE>
   <%@include file="baseHRef.jsp" %>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <%@ include file="/script.jsp" %>
 </HEAD>
 <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
   <%@ include file="/top.jsp" %>
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <%@ include file="left.jsp" %>
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR>

         <!-- BEGIN BODY -->
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<%
ResultSetContainer leaders = (ResultSetContainer) queryEntries.get("High_Scorers");
ResultSetContainer percents = (ResultSetContainer) queryEntries.get("Round_Percentages");
ResultSetContainer.ResultSetRow resultRow_0 = rsc.isValidRow(0)? rsc.getRow(0):null;
String roundID = resultRow_0!=null?resultRow_0.getItem("round_id").toString():"";

%>


			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<TR>
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" VALIGN="top" BGCOLOR="#FFFFFF">
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/>

<!-- <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="90%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Last Match Summary</B></TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="10%" NOWRAP="0"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">Results</A></TD>
  </TR>
</TABLE> -->
 	<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/><BR/>

   <A CLASS="bodyGeneric" href="/stat?&amp;c=last_match"><B>Single Round Match <%= roundID %></B></A><BR/>
Wednesday, August 12, 2002<BR/>
    <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="leaders"></A>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" COLSPAN="2" BGCOLOR="#CCCCCC" WIDTH="40%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-I Leaders</B></TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="10%" NOWRAP="0"><A HREF="/stat?c=last_match&amp;rd=4260&amp;dn=1" CLASS="bodyGeneric">Results</A></TD>
    <TD VALIGN="middle" COLSPAN="2" BGCOLOR="#CCCCCC" WIDTH="40%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-II Leaders</B></TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="10%" NOWRAP="0"><A HREF="/stat?c=last_match&amp;rd=4260&amp;dn=2" CLASS="bodyGeneric">Results</A></TD>
  </TR>

  <TR>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;bstanescu</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">1421.70 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText">&#160;Room 4</TD>

    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;UFP2161</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">680.30 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText">&#160;Room 6</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Yarin</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1347.74 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 1</TD>

    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Olorin</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">659.68 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 6</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;ZorbaTHut</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1302.99 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 1</TD>

    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;weissman</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">658.33 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 12</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;ShakeSpace</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1077.79 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 5</TD>

    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;debaser</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">645.37 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 13</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;RachaelLCook</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">848.79 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 4</TD>

    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;FrodoB</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">643.37 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 7</TD>
  </TR>
</TABLE>
    <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="problem_stats"></A>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" COLSPAN="5" BGCOLOR="#CCCCCC" WIDTH="100%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-I Problem Stats</B></TD>
  </TR>

  <TR>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText">&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;<B>Problem Name</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Submissions</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Correct %&#160;&#160;</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right"><B>Average Pts.</B></TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level One</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;StemChange</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">91 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">84.62% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">184.75</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Two</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;WordSearch</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">73 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">26.03% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">256.52</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Three</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;LeftMoves</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">32 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">56.25% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">530.03</TD>
  </TR>
</TABLE>
    <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" COLSPAN="5" BGCOLOR="#CCCCCC" WIDTH="100%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-II Problem Stats</B></TD>
  </TR>

  <TR>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText">&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;<B>Problem Name</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Submissions</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Correct %&#160;&#160;</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right"><B>Average Pts.</B></TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level One</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;Lars</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">145 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">62.07% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">220.37</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Two</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;StemChange</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">118 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">73.73% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">297.81</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Three</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;Packyman</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">15 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">6.67% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">461.70</TD>
  </TR>
  <TR>
    <TD VALIGN="middle" COLSPAN="5" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></TD>
  </TR>
  <!-- <TR>
    <TD VALIGN="middle" COLSPAN="5" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>

				 	</TD>
					<TD VALIGN="top" WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
  <TR>
    <TD VALIGN="top" COLSPAN="3" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>

				<!-- <TR>
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD COLSPAN="3" CLASS="statText" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">  -->
<!-- Coder of the Week Begins -->
        <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->


					<!-- </TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR> -->
				<TR>
					<TD COLSPAN="3" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
         <!-- END BODY -->

       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0">
         <%@ include file="/public_right.jsp" %>
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <%@ include file="/foot.jsp" %>
 </BODY>
</HTML>


