<%@ include file="head.inc" %>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->

<%
ResultSetContainer rdinfo = (ResultSetContainer) queryEntries.get("Round_Name");
ResultSetContainer.ResultSetRow row = rdinfo.getRow(0);
String contestName = row.getItem("contest_name").toString();
String roundName = row.getItem("round_name").toString();
int roundID = Integer.parseInt(row.getItem("round_id").toString());
String currRound = roundID+"";
ResultSetContainer rdlist = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetDates", rdlist);
%>

<P><B>School Rankings for <%= contestName %> - <%= roundName %></B></P>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
   <TD>
    <SPAN class="statText"><B>Select round:</B></SPAN>
    <FORM name="selectform">
    <SELECT CLASS="dropdown" NAME="Contest" onchange="goTo(this)">
        <OPTION value="#">Select round:</OPTION>
        <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
         <% if (resultRow.getItem(0).toString().equals(currRound)) { %>
           <OPTION value="?module=Statistics&c=school_round_rank&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
               <% } else { %>
           <OPTION value="?module=Statistics&c=school_round_rank&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
        <% } %>
        </logic:iterate>
    </SELECT>
    </FORM>
    </TD>
  </TR>
</TABLE>

<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("School_Round_Scores");
pageContext.setAttribute("resultSet", rsc);
%>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
                 <TR>
                   <TD   COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Position</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="48%">
				   <A HREF="?module=Statistics&c=school_round_rank&rd=<%=currRound%>&sq=School_Round_Scores&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText">School</a>
				   </TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">
				   <A HREF="?module=Statistics&c=school_round_rank&rd=<%=currRound%>&sq=School_Round_Scores&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText">Score</a>
				   </TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD   COLSPAN="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
       <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
	        <bean:define id="coderrank" value="3000" />  <%-- make them all red for now --%>
                 <TR>
                   <TD VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow" property='<%= "item[" + 3 /* order */ + "]" %>'/></TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="?module=Statistics&c=school_round_stats&rd=<%=currRound%>&hs=<bean:write name="resultRow" property='<%= "item[" + 0 /* school_id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 1 /* school full_name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 2 /* school score */ + "]" %>'/></TD>
                   <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		</logic:iterate>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
           <TR>
             <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
           </TR>
         </TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
