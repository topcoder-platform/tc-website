<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/stat-taglib.tld" prefix="stat" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder :: Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<%@include file="baseHRef.jsp" %>   
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
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>


         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" BGCOLOR="#CCCCCC" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Member Profile&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
     <logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<% ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Coder_Data");
boolean bEmpty = (rsc.size()!=1);
boolean vieweeHasImage = false;
boolean hasCharity = false;
ResultSetContainer.ResultSetRow rsr = null;
if (!bEmpty) {
  rsr = rsc.getRow(0);
  pageContext.setAttribute("resultRow", rsr);
  vieweeHasImage = rsr.getItem(23).toString().equals("1");
  if (Integer.parseInt(rsr.getItem(25).toString()) > 0)
    hasCharity = true;  //have there winnings ever gone to charity
}
%>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
           <TR>
             <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR/>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
         <% if (!bEmpty) { %>
                 <TR>
                   <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statTextLarge">
          <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 4 /*"coder_score"*/ + "]" %>'/>           
                     <B>Coder:</B>&#160;<SPAN CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><B><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></B></SPAN>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
                 <logic:notEqual name="resultRow" property='<%= "item[" + 2 /*"quote"*/ + "]" %>' type="ResultSetContainer.ResultSetRow" value="">
                   <TR>
                     <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="center" WIDTH="80%">&quot;<bean:write name="resultRow" property='<%= "item[" + 2 /*"quote"*/ + "]" %>'/>&quot;</TD>
                   </TR>
                 </logic:notEqual>
                 <TR>
                   <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ROWSPAN="12" VALIGN="top">
<% if (vieweeHasImage) { %>
                     <IMG SRC="<bean:write name="resultRow" property='<%= "item[" + 22 /*"image path"*/ + "]" %>'/>" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
<% } else if (nav.getLoggedIn()) { %>
                     <A HREF="<%="https://"+request.getServerName()+"/reg/index.jsp"%>"><IMG SRC="/i/m/nophoto_submit.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
<% } else { %>
                     <A HREF="<%="?t=authentication&c=login&errorMsg=You must log in to submit your photo.&errorURL=https://"+request.getServerName()+"/reg/index.jsp"%>"><IMG SRC="/i/m/nophoto_login.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
<% } %>
                     <IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
                   </TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="50%">Rating:</TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="20%"ALIGN="right"><%= coderrank.toString() %></TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="30%" ALIGN="left"><A HREF="/stat?c=ratings_history&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"id"*/ + "]" %>'/>" CLASS="statText">[ ratings history ]</A></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Volatility Factor:</TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 5 /* volatility*/ + "]" %>'/></TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Member Since:</TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><stat:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 6 /*"start_date"*/ + "].resultData" %>'/></TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Total Earnings:</TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right">$<stat:write format="0.00" name="resultRow" property='<%= "item[" + 7 /*"earnings"*/ + "].resultData" %>'/><%=hasCharity?"*":""%></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">
          <A HREF="/stat?c=earnings_history&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"id"*/ + "]" %>'/>" CLASS="statText">[ earnings history ]</A>
          </TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Number of Competitions:</TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 8 /* number of comps */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Average Points per Contest:</TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><stat:write format="0.00" name="resultRow" property='<%= "item[" + 9 /*"avg final pts"*/ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Maximum Rating:</TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><stat:write format="0" name="resultRow" property='<%= "item[" + 10 /*"avg final pts"*/ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                </TR>                
                <TR>
                  <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">
                  <% if ( nav.getLoggedIn() && Integer.parseInt(rsr.getItem(1).toString())==nav.getUserId() ) { %><A HREF="<%="https://"+request.getServerName()+"/reg/index.jsp"%>" CLASS="statText" TARGET="_parent">Update your profile</A>
<% } else { %>&#160;</xsl:otherwise><%}%>
                  </TD>
                </TR>                
                <% if (hasCharity) {%> 
                  <TR>
                    <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">* Some or all of these earnings have been donated to charity.</TD>
                  </TR>                
                <% } %>
                <!-- <TR>
                  <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BOR
            DER="0"/></TD>
                </TR>
                <TR> -->
                  <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BO
            RDER="0"/></TD>
                </TR>
        <% } else { %>
        <TR>
                  <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">This member has not yet been rated in a competition.</TD>
                </TR>
        <% } %>
                <TR>
                  <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="14" BORDER="0"></TD>
                </TR>
              </TABLE>
<% if (!bEmpty) {
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("Coder_Submission_Summary");
pageContext.setAttribute("resultSet", rsc2);
%>
        
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                <TR>
                  <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Submission Information</TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* failed challenge */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 4 /* failed systest */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* submitted */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><stat:write format="0.00%" name="resultRow2" property='<%= "item[" + 6 /* submitted */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
        </logic:iterate>
                <TR>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13">Total:</TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 14 /* failed challenge */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 15 /* failed systest*/ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 13 /* submitted */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><stat:write format="0.00%" name="resultRow" property='<%= "item[" + 17 /* pct accuracy */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"></TD>
                </TR>
              </TABLE>
<% ResultSetContainer rsc3 = (ResultSetContainer) queryEntries.get("Coder_Challenge_Summary");
pageContext.setAttribute("resultSet", rsc3);
%>
        
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                <TR>
                  <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Challenge Information</TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* attempts failed */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* attempts made */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><stat:write format="0.00%" name="resultRow2" property='<%= "item[" + 5 /* attempts made */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
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
        </logic:present>
            </TD>
            <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
          </TR>
          <TR>
            <TD COLSPAN="5" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
          </TR>
          <TR>
            <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
            <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
          </TR>
          <TR>
            <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"></TD>
            <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"></TD>
            <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
            <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
          </TR>
        </TABLE>
<% } %>
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

