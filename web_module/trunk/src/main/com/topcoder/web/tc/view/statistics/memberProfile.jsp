<%@ page 
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.common.web.data.Navigation"
%>

<%
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<HTML>
 <HEAD>
   <TITLE>Member Profiles at TopCoder</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>

<jsp:include page="baseHRef.jsp" />   
<jsp:include page="../script.jsp" />

</HEAD>

<body onLoad="timer(1);">

<jsp:include page="../top.jsp" />

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR valign="top">

       <TD WIDTH="180">
<!-- Left nav begins -->
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
<!-- Left nav ends -->
       </TD>

<!-- Gutter begins -->
       <TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter ends -->

       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>

<!-- Center column begins -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Member Profile&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
     <logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<% ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Coder_Data");
boolean vieweeHasImage = false;
boolean hasCharity = false;
ResultSetContainer.ResultSetRow rsr = null;
if (!rsc.isEmpty()) {
  rsr = rsc.getRow(0);
  pageContext.setAttribute("resultRow", rsr);
  vieweeHasImage = rsr.getItem(23).toString().equals("1");
  if (Integer.parseInt(rsr.getItem(25).toString()) > 0)
    hasCharity = true;  //have there winnings ever gone to charity
}
%>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR/>

         <% if (rsc.isEmpty()) { %>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText">This member has not yet been rated in a competition.</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="14" BORDER="0"></TD>
                </TR>
              </TABLE>
         <% } else {%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" CLASS="statTextLarge">
          <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 4 /*"coder_score"*/ + "]" %>'/>
                     <B>Coder:</B>&#160;<SPAN CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><B><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></B></SPAN>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
                 <logic:notEqual name="resultRow" property='<%= "item[" + 2 /*"quote"*/ + "]" %>' type="ResultSetContainer.ResultSetRow" value="">
                   <TR>
                     <TD COLSPAN="5" CLASS="statText" ALIGN="center" WIDTH="80%">&quot;<bean:write name="resultRow" property='<%= "item[" + 2 /*"quote"*/ + "]" %>'/>&quot;</TD>
                   </TR>
                 </logic:notEqual>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" ROWSPAN="12" VALIGN="top">
<% if (vieweeHasImage) { %>
                     <IMG SRC="<bean:write name="resultRow" property='<%= "item[" + 22 /*"image path"*/ + "]" %>'/>" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
<% } else if (nav.isIdentified()) { %>
                     <A HREF="<%="https://"+request.getServerName()+"/Registration"%>"><IMG SRC="/i/m/nophoto_submit.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
<% } else { %>
                     <A HREF="<%="/tc?&module=Login&message=You must log in to submit your photo.&nextpage=https://"+request.getServerName()+"/Registration"%>"><IMG SRC="/i/m/nophoto_login.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
<% } %>
                     <IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
                   </TD>
                   <TD CLASS="statText" WIDTH="50%">Rating:</TD>
                   <TD CLASS="statText" WIDTH="20%"ALIGN="right"><%= coderrank.toString() %></TD>
                   <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" WIDTH="30%" ALIGN="left"><A HREF="/stat?c=ratings_history&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"id"*/ + "]" %>'/>" CLASS="statText">[ ratings history ]</A></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText">Volatility Factor:</TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 5 /* volatility*/ + "]" %>'/></TD>
                   <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="left">&#160;</TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText">Member Since:</TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 6 /*"start_date"*/ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Total Earnings:</TD>
                  <TD CLASS="statText" ALIGN="right">$<bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /*"earnings"*/ + "].resultData" %>'/><%=hasCharity?"*":""%></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">
          <A HREF="/stat?c=earnings_history&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"id"*/ + "]" %>'/>" CLASS="statText">[ earnings history ]</A>
          </TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Number of Competitions:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 8 /* number of comps */ + "]" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Average Points per Contest:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /*"avg final pts"*/ + "].resultData" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Maximum Rating:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 10 /*"max rating"*/ + "].resultData" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Minimum Rating:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 26 /*"min rating"*/ + "].resultData" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                </TR>                
                <TR>
                  <TD COLSPAN="4" CLASS="statText">
                  <% if ( nav.isIdentified() && Integer.parseInt(rsr.getItem(1).toString())==nav.getUserId() ) { %><A HREF="<%="https://"+request.getServerName()+"/Registration"%>" CLASS="statText" TARGET="_parent">Update your profile</A>
                  <% } else { %>&#160;<%}%>
                  </TD>
                </TR>                
                <% if (hasCharity) {%> 
                  <TR>
                    <TD COLSPAN="5" CLASS="statText">* Some or all of these earnings have been donated to charity.</TD>
                  </TR>                
                <% } %>
                <TR>
                  <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="14" BORDER="0"></TD>
                </TR>
              </TABLE>
<%
ResultSetContainer rsc4 = (ResultSetContainer) queryEntries.get("Coder_Submission_Summary_Div_1");
ResultSetContainer rsc6 = (ResultSetContainer) queryEntries.get("Coder_Submission_Totals_Div_1");
if (rsc4!=null && !rsc4.isEmpty() && rsc6!=null && !rsc6.isEmpty()) {
    pageContext.setAttribute("resultSet", rsc4);
    pageContext.setAttribute("totalRow1", rsc6.getRow(0));
%>

              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                <TR>
                  <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Division-I Submission Information</TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Problem</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Challenge</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Sys. Test</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Submitted</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Success %</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* failed challenge */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 4 /* failed systest */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* submitted */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow2" property='<%= "item[" + 6 /* submitted */ + "].resultData" %>'/></TD>
                  <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
        </logic:iterate>
                <TR>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13">Total:</TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="totalRow1" property='<%= "item[" + 1 /* failed challenge */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="totalRow1" property='<%= "item[" + 2 /* failed systest*/ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="totalRow1" property='<%= "item[" + 0 /* submitted */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="totalRow1" property='<%= "item[" + 4 /* pct accuracy */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"></TD>
                </TR>
              </TABLE>
<% }
    ResultSetContainer rsc5 = (ResultSetContainer) queryEntries.get("Coder_Submission_Summary_Div_2");
    ResultSetContainer rsc7 = (ResultSetContainer) queryEntries.get("Coder_Submission_Totals_Div_2");
    if (rsc5!=null && !rsc5.isEmpty() && rsc7!=null && !rsc7.isEmpty()) {
        pageContext.setAttribute("resultSet", rsc5);
        pageContext.setAttribute("totalRow2", rsc7.getRow(0));
%>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                <TR>
                  <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Division-II Submission Information</TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Problem</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Challenge</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Sys. Test</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Submitted</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Success %</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* failed challenge */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 4 /* failed systest */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* submitted */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow2" property='<%= "item[" + 6 /* submitted */ + "].resultData" %>'/></TD>
                  <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
        </logic:iterate>
                <TR>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13">Total:</TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="totalRow2" property='<%= "item[" + 1 /* failed challenge */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="totalRow2" property='<%= "item[" + 2 /* failed systest*/ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="totalRow2" property='<%= "item[" + 0 /* submitted */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="totalRow2" property='<%= "item[" + 4 /* pct accuracy */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"></TD>
                </TR>
              </TABLE>
<%  }
    ResultSetContainer rsc3 = (ResultSetContainer) queryEntries.get("Coder_Challenge_Summary");
    if (rsc3!=null && !rsc3.isEmpty()) {
pageContext.setAttribute("resultSet", rsc3);
%>

              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                <TR>
                  <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Challenge Information</TD>
                </TR>
                <TR>
                  <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="25%" HEIGHT="18">Problem</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%"># Failed Challenges</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%"># Challenges</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="25%">Success %</TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* attempts failed */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* attempts made */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow2" property='<%= "item[" + 5 /* attempts made */ + "].resultData" %>'/></TD>
                  <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
        </logic:iterate>
                <TR>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallFoot" VALIGN="middle" HEIGHT="13">Total:</TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 19 /* total failed */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 18 /* total challenges */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow" property='<%= "item[" + 21 /* total challenges */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
              </TABLE>
   <% } %>
<% } %>
            </TD>
          </TR>
          <TR>
            <TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
          </TR>
        </TABLE>
        </logic:present>
         
         <p><br></p>
<!-- Center column ends -->

       </TD>

<!-- Gutter begins -->
       <TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter ends -->

        <TD width="170">
<!-- right begins -->
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="profile"/>
            </jsp:include>
<!-- right ends -->
       </TD>

<!-- Gutter begins -->
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
<!-- Gutter ends -->

     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </body>
</HTML>

