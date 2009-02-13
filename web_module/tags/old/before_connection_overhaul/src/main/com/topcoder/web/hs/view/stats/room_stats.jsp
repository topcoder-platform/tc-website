<%@ include file="head.inc" %>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->
<%
String sContentHandle = srb.getContentHandle();

ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetDates", rsc);
ResultSetContainer rscRoomList = (ResultSetContainer) queryEntries.get("Rooms_For_Round");
pageContext.setAttribute("resultSetRooms", rscRoomList);
pageContext.setAttribute("cr", srb.getProperty("cr", ""));

ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("Room_Summary_Data");
pageContext.setAttribute("resultSet", rsc2);
ResultSetContainer.ResultSetRow resultRow_0 = rsc2.isValidRow(0)? rsc2.getRow(0):null;
String currRound = "";
String currRoom = "";
if (resultRow_0 != null) {
  if (resultRow_0.getItem("round_id") != null)
    currRound = resultRow_0.getItem("round_id").toString();
  if (resultRow_0.getItem("room_id") != null)
    currRoom = resultRow_0.getItem("room_id").toString();
}
pageContext.setAttribute("rd", currRound);
pageContext.setAttribute("rm", currRoom);

%>

<% if(sContentHandle.equals("room_stats")) { %>
<P><B>Room Stats</B></P>
<% } else { %>
<P><B>Coder Problem Stats</B></P>
<% } %>

               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>

                <TR>
                  <TD COLSPAN="4"  CLASS="statText">
                    <SPAN CLASS="statText"><B>Select round:</B></SPAN>
                    <FORM name="selectform">
                    <SELECT NAME="Contest" onchange="goTo(this)" CLASS="dropdown"><OPTION value="#">Select round:</OPTION>
                      <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
                        <% if (resultRow.getItem(0).toString().equals(pageContext.getAttribute("rd"))) { %>
                          <OPTION value="?module=Statistics&c=room_stats&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>&rm=<bean:write name="resultRow" property='<%= "item[" + 5 /* first room */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round */ + "]" %>'/></OPTION>
                        <% } else { %>
                          <OPTION value="?module=Statistics&c=room_stats&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>&rm=<bean:write name="resultRow" property='<%= "item[" + 5 /* first room */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round */ + "]" %>'/></OPTION>
                        <% } %>
                      </logic:iterate>
                    </SELECT>
                    </FORM>
                  </TD>
                </TR>
                <TR>
                  <TD COLSPAN="4"  CLASS="statText">
                     <SPAN CLASS="statText"><B>Select room:</B></SPAN>
                     <FORM name="selectanotherform">
                     <SELECT NAME="Round" onchange="goTo(this)" CLASS="dropdown"><OPTION value="#">Select room:</OPTION>
                       <logic:iterate name="resultSetRooms" id="resultRowRoom" type="ResultSetContainer.ResultSetRow">
                         <% if (resultRowRoom.getItem(0).toString().equals(pageContext.getAttribute("rm"))) { %>
                           <OPTION value="?module=Statistics&c=room_stats&rd=<%= pageContext.getAttribute("rd") %>&rm=<bean:write name="resultRowRoom" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRowRoom" property='<%= "item[" + 1 /* name */ + "]" %>'/> - <bean:write name="resultRowRoom" property='<%= "item[" + 2 /* division */ + "]" %>'/></OPTION>
                         <% } else { %>
                           <OPTION value="?module=Statistics&c=room_stats&rd=<%= pageContext.getAttribute("rd") %>&rm=<bean:write name="resultRowRoom" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRowRoom" property='<%= "item[" + 1 /* name */ + "]" %>'/> - <bean:write name="resultRowRoom" property='<%= "item[" + 2 /* division */ + "]" %>'/></OPTION>
                         <% } %>
                       </logic:iterate>
                     </SELECT>
                     </FORM>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
               </TABLE>
<%
if (resultRow_0 == null) {
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
                 <TR>
                   <TD  CLASS="statText">No information available for the selected room.</TD>
                 </TR>
               </TABLE>
<%
}
else {
     pageContext.setAttribute("contestName",resultRow_0.getItem(2));
     pageContext.setAttribute("roundName",resultRow_0.getItem(4));
     pageContext.setAttribute("roomName",resultRow_0.getItem(3));
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
                 <TR>
                   <TD  COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="20">[ <SPAN CLASS="coderTextGray">001 - 899</SPAN> | <SPAN CLASS="coderTextGreen">900 - 1199</SPAN> | <SPAN CLASS="coderTextBlue">1200 - 1499</SPAN> | <SPAN CLASS="coderTextYellow">1500 - 2199</SPAN> | <SPAN CLASS="coderTextRed">2200+</SPAN> ]<BR><BR>
      Click the <IMG src="/i/hs/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"> icon to view problem information.</TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
              <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="20" HEIGHT="18">&nbsp;<B>Statistics for
                     <%= pageContext.getAttribute("contestName").toString() %>&nbsp;>&nbsp;<%= pageContext.getAttribute("roundName").toString() %>&nbsp;>&nbsp;<%= pageContext.getAttribute("roomName").toString() %></B>
                   </TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR VALIGN="middle">
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="18%" HEIGHT="18">&nbsp;</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center" WIDTH="12%">Submissions</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="5%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center" WIDTH="12%">Defenses</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="5%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center" WIDTH="12%">Challenges</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" ALIGN="center" WIDTH="10%">
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=12&sd=<%= "12".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">System</a>
           </TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="5%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" ALIGN="center" WIDTH="10%">
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Point</a>
           </TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" WIDTH="5%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="3" ALIGN="center" WIDTH="18%">Ratings</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR VALIGN="middle">
                   <TD BGCOLOR="#1B2E5D"  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="left" HEIGHT="18">
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Coders</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Qnty</a>
           &nbsp;/&nbsp;
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Points</a>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="right">&nbsp;&nbsp;</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Qnty</a>
           &nbsp;/&nbsp;
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=9&sd=<%= "9".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Points</a>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="right">&nbsp;&nbsp;</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=10&sd=<%= "10".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Qnty</a>
           &nbsp;/&nbsp;
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=11&sd=<%= "11".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Points</a>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=12&sd=<%= "12".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Test</a>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Total</a>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="right">&nbsp;&nbsp;</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="3" ALIGN="center">
              <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=15&sd=<%= "15".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Pre</a>
           &nbsp;/&nbsp;
             <A HREF="?module=Statistics&c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=17&sd=<%= "17".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Post</a>
           </TD>
                   <TD BGCOLOR="#1B2E5D" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
       <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 17 /*"coder_score"*/ + "]" %>'/>
                 <TR VALIGN="middle">
         <% if (sContentHandle.equals("coder_room_stats") && pageContext.getAttribute("cr").toString().equals(resultRow.getItem(1).toString())) {
           pageContext.setAttribute("coderHandle", resultRow.getItem(0).toString()); %>
                   <TD  WIDTH="10"><IMG src="/i/hs/coders_icon_on.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"></TD>
                   <TD  CLASS="coderBrackets" ALIGN="left" HEIGHT="13">
                     <SPAN CLASS="coderBrackets">[&nbsp;</SPAN><A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>" TITLE="<bean:write name="resultRow" property='<%= "item[" + 21 /* school_name */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A><SPAN CLASS="coderBrackets">&nbsp;]</SPAN>
                   </TD>
         <% } else { %>
                    <TD  WIDTH="10"><A HREF="?module=Statistics&c=coder_room_stats&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="statText"><IMG src="/i/hs/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"></A></TD>
                   <TD  CLASS="coderBrackets" ALIGN="left" HEIGHT="13">
                     <A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>" TITLE="<bean:write name="resultRow" property='<%= "item[" + 21 /* school_name */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></A>
                   </TD>
         <% } %>
                   <TD  CLASS="statText" ><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 6 /* submits */ + "]" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* submit pts */ + "].resultData" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right">&nbsp;&nbsp;</TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 8 /* defenses */ + "]" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* defense pts */ + "].resultData" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right">&nbsp;&nbsp;</TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 10 /* challenges */ + "]" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 11 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD  CLASS="statText" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 12 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 13 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right">&nbsp;&nbsp;</TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 15 /* pre-rating */ + "]" %>'/></TD>
                   <TD  CLASS="statText" WIDTH="5%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 17 /* end-rating */ + "]" %>'/></TD>
                   <TD  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
         <TR>
                   <TD  COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
      </logic:iterate>

                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="20"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>
               </TABLE>

<%
if (pageContext.getAttribute("cr").toString().length()>0){
  ResultSetContainer rscProblems = (ResultSetContainer) queryEntries.get("Coder_Problems");
if (rscProblems != null && rscProblems.size() > 0) {
  pageContext.setAttribute("resultSet", rscProblems);
  java.text.SimpleDateFormat sdfTime = new java.text.SimpleDateFormat("H:mm:ss.S");
  sdfTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT"));
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="8" HEIGHT="18" VALIGN="middle" CLASS="statText">&nbsp;<B>Problem Information for <%=pageContext.getAttribute("coderHandle").toString() %></B></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="8" HEIGHT="18" VALIGN="middle" CLASS="statText">&nbsp;Problems</TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR VALIGN="middle">
                   <TD BGCOLOR="#1B2E5D" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%" HEIGHT="18">Class&nbsp;Name</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText">Method&nbsp;Name</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText">Difficulty</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText">Coding Time</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText">Status</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">Points</TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>

           <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
                 <TR  VALIGN="middle">
                   <TD  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" HEIGHT="13">
                     <A HREF="?module=Statistics&c=problem_solution&rm=<%=pageContext.getAttribute("rm") %>&rd=<%=pageContext.getAttribute("rd") %>&pm=<bean:write name="resultRow" property='<%= "item[" + 2 /* problem id*/ + "]" %>'/>&cr=<%=pageContext.getAttribute("cr") %>" CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 0 /* class name */ + "]" %>'/></A>
                   </TD>
                   <TD  CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 1 /* method name */ + "]" %>'/></TD>
                   <TD  CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 3 /* level desc */ + "]" %>'/></TD>
                   <TD  CLASS="statText"><%= sdfTime.format(new java.sql.Time(Long.parseLong(resultRow.getItem(5).toString()))).toString() %></TD>
                   <TD  CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 6 /* status */ + "]" %>'/></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* points */ + "].resultData" %>'/></TD>
                   <TD  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
         </logic:iterate>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>
               </TABLE>
<% } %>
<% ResultSetContainer rscChallenge = (ResultSetContainer) queryEntries.get("Coder_Challenges");
if (rscChallenge != null && rscChallenge.size() > 0){
pageContext.setAttribute("resultSet", rscChallenge);
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="7" HEIGHT="18" VALIGN="middle" CLASS="statText">&nbsp;<B>Challenges</B></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR VALIGN="middle">
                   <TD BGCOLOR="#1B2E5D"  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%" HEIGHT="18">Challenger</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%">Defendant</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%">Problem</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%">Succeeded</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%" ALIGN="right">Points</TD>
                   <TD BGCOLOR="#1B2E5D" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="8"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
           <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
              <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 4 /*"defendent Rank"*/ + "]" %>'/>
                 <TR VALIGN="middle">
                   <TD   WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" ALIGN="left"><%=pageContext.getAttribute("coderHandle").toString() %></TD>
                   <TD  CLASS="statText">
                     <A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 5 /* defendent id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* defendent name */ + "]" %>'/></A>
                   </TD>
                   <TD  CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 6 /* class name */ + "]" %>'/></TD>
                   <TD  CLASS="statText"><%= resultRow.getItem(8).toString().equals("Y")?"Yes":"No"%></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
         </logic:iterate>

                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>
               </TABLE>
<% } %>
<% ResultSetContainer rscDefense = (ResultSetContainer) queryEntries.get("Coder_Defenses");
if (rscDefense != null && rscDefense.size() > 0) {
pageContext.setAttribute("resultSet", rscDefense);
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="7" HEIGHT="18" VALIGN="middle" CLASS="statText">&nbsp;<B>Defenses</B></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR VALIGN="middle">
                   <TD BGCOLOR="#1B2E5D" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%" HEIGHT="18">Defendant</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%">Challenger</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%">Problem</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%">Succeeded</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="20%" ALIGN="right">Points</TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>

           <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
              <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"challenger Rank"*/ + "]" %>'/>

                 <TR VALIGN="middle">
                   <TD  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" ALIGN="left"><%=pageContext.getAttribute("coderHandle").toString() %></TD>
                   <TD  CLASS="statText">
                     <A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 2 /* challenger id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* challenger_name */ + "]" %>'/></A>
                   </TD>
                   <TD  CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 6 /* class name */ + "]" %>'/></TD>
                   <TD  CLASS="statText"><%= resultRow.getItem(8).toString().equals("Y")?"Yes":"No"%></TD>
                   <TD  CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
         </logic:iterate>

                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>

               </TABLE>
<% } %>
<% } %>
<% } %>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
