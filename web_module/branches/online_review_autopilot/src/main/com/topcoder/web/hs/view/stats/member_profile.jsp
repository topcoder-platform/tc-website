<%@ include file="head.inc" %>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->
<% ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Coder_Data");
boolean bEmpty = (rsc.size()!=1);
ResultSetContainer.ResultSetRow rsr = null;
if (!bEmpty) {
  rsr = rsc.getRow(0);
  pageContext.setAttribute("resultRow", rsr);
}
%>

<P><B>Member profile</B></P>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
           <TR>
             <TD   VALIGN="top" WIDTH="11"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top"   WIDTH="100%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD COLSPAN="5"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
         <% if (!bEmpty) { %>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText">
          <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 4 /*"coder_score"*/ + "]" %>'/>
                     <B>Coder:</B>&nbsp;<SPAN CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><B><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></B></SPAN>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText">
          <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 4 /*"coder_score"*/ + "]" %>'/>
                     <B>School:</B>&nbsp;<B><bean:write name="resultRow" property='<%= "item[" + 3 /* school full_name */ + "]" %>'/></B>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
                 <logic:notEqual name="resultRow" property='<%= "item[" + 2 /*"quote"*/ + "]" %>' type="ResultSetContainer.ResultSetRow" value="">
                   <TR>
                     <TD COLSPAN="5" CLASS="statText" ALIGN="center" WIDTH="80%">&quot;<bean:write name="resultRow" property='<%= "item[" + 2 /*"quote"*/ + "]" %>'/>&quot;</TD>
                   </TR>
                 </logic:notEqual>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" ROWSPAN="12" VALIGN="top"><BR>&nbsp;
                   </TD>
                   <TD CLASS="statText" WIDTH="50%">Rating:</TD>
                   <TD CLASS="statText" WIDTH="20%"ALIGN="right"><%= coderrank.toString() %></TD>
                   <TD CLASS="statText" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" WIDTH="30%" ALIGN="left"><A HREF="?module=Statistics&c=ratings_history&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"id"*/ + "]" %>'/>" CLASS="statText">[ ratings history ]</A></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText">Volatility Factor:</TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 5 /* volatility*/ + "]" %>'/></TD>
                   <TD CLASS="statText" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="left">&nbsp;</TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText">Member Since:</TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 6 /*"start_date"*/ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="left">&nbsp;</TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Number of Competitions:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 8 /* number of comps */ + "]" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&nbsp;</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Average Points per Contest:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /*"avg final pts"*/ + "].resultData" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&nbsp;</TD>
                </TR>
                <TR>
                  <TD CLASS="statText">Maximum Rating:</TD>
                  <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 10 /*"avg final pts"*/ + "].resultData" %>'/></TD>
                  <TD CLASS="statText" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" ALIGN="left">&nbsp;</TD>
                </TR>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD>
                </TR>
        <% } else { %>
        <TR>
            <% if((""+SessionInfo.getUserId()).equals(request.getParameter("cr"))) { %>
                  <TD COLSPAN="5" CLASS="statText">You have not yet been rated in a competition.</TD>
            <% } else { %>
                  <TD COLSPAN="5" CLASS="statText">This member has not yet been rated in a competition.</TD>
            <% } %>
                </TR>
        <% } %>
                <TR>
                  <TD COLSPAN="5" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="14" BORDER="0"></TD>
                </TR>
              </TABLE>
<% if (!bEmpty) {
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("Coder_Submission_Summary");
pageContext.setAttribute("resultSet", rsc2);
%>

              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                  <TD BGCOLOR="#1B2E5D" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&nbsp;&nbsp;Submission Information</TD>
                </TR>
                <TR>
                  <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>

                <TR>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Problem</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Challenge</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Sys. Test</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Submitted</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Success %</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* failed challenge */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 4 /* failed systest */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* submitted */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow2" property='<%= "item[" + 6 /* submitted */ + "].resultData" %>'/></TD>
                  <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
        </logic:iterate>
                <TR>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13">Total:</TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 14 /* failed challenge */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 15 /* failed systest*/ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 13 /* submitted */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow" property='<%= "item[" + 17 /* pct accuracy */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"></TD>
                </TR>
              </TABLE>
<% ResultSetContainer rsc3 = (ResultSetContainer) queryEntries.get("Coder_Challenge_Summary");
pageContext.setAttribute("resultSet", rsc3);
%>

              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                  <TD BGCOLOR="#1B2E5D" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&nbsp;&nbsp;Challenge Information</TD>
                </TR>
                <TR>
                  <TD COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="25%" HEIGHT="18">Problem</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%"># Failed Challenges</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%"># Challenges</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="25%">Success %</TD>
                  <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                <TR>
                  <TD COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                </TR>
        <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                <TR>
                  <TD VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow2" property='<%= "item[" + 0 /* level desc */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 3 /* attempts failed */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow2" property='<%= "item[" + 2 /* attempts made */ + "]" %>'/></TD>
                  <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow2" property='<%= "item[" + 5 /* attempts made */ + "].resultData" %>'/></TD>
                  <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
        </logic:iterate>
                <TR>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="smallFoot" VALIGN="middle" HEIGHT="13">Total:</TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 19 /* total failed */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 18 /* total challenges */ + "]" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00%" name="resultRow" property='<%= "item[" + 21 /* total challenges */ + "].resultData" %>'/></TD>
                  <TD BACKGROUND="/i/hs/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
              </TABLE>
            </TD>
            <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
          </TR>
        </TABLE>
<% } %>
        <!-- END BODY -->

<%@ include file="tail.inc" %>
