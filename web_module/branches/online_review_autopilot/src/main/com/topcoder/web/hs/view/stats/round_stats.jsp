<%@ include file="head.inc" %>

<%
String sContentHandle = srb.getContentHandle();
boolean bSchool = sContentHandle.startsWith("school_");
boolean bSorted = sContentHandle.endsWith("_sorted");
if(bSorted) sContentHandle = sContentHandle.substring(0, sContentHandle.indexOf("_sorted"));

ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get(bSchool?"School_Round_Statistics_Data":"Round_Statistics_Data");
pageContext.setAttribute("resultSet", rsc2);
ResultSetContainer.ResultSetRow resultRow_0 = rsc2.isValidRow(0)? rsc2.getRow(0):null;



//calculate scrolling information
//1. pick apart parms
String sStartRow = "";
String sEndRow = "";
String sNumRow = "";
if(bSorted) {
sStartRow = srb.getProperty("sr","1");
sEndRow = srb.getProperty("er",Integer.toString(rsc2.size()));
sNumRow = srb.getProperty("nr",Integer.toString(rsc2.size()));
} else {
sStartRow = srb.getProperty("sm","1");
//the nxt 2 lines actually refer to room counts, hardcoded to match DB entries (calculation is too complex to do here-reliably)
sEndRow = srb.getProperty("em", "10");
sNumRow = srb.getProperty("nr","10");
}

//2. calculate next scroll
int iTemp = Integer.parseInt(sEndRow)+1;
pageContext.setAttribute("next_s", Integer.toString(iTemp));

boolean bHasNextScroll = true;
int iMaxRoom = Integer.MAX_VALUE;
//TCB 3.9.02 added next 5 lines
if(!(bSorted)){
  ResultSetContainer rscRoomCount = (ResultSetContainer) queryEntries.get("Division_Room_Count");
  try {
    iMaxRoom = Integer.parseInt(rscRoomCount.getItem(0,0).toString());
  } catch(Exception e) { }
  bHasNextScroll = (iMaxRoom >= iTemp);
}
iTemp += Integer.parseInt(sNumRow)-1;
iTemp = bSorted?iTemp:Math.min(iTemp, iMaxRoom);
//end tcb changes
pageContext.setAttribute("next_e", Integer.toString(iTemp));


//3. now calculate previous scroll
iTemp = Math.max(1,Integer.parseInt(sStartRow)-1);
pageContext.setAttribute("prev_e", Integer.toString(iTemp));
iTemp = Math.max(1,(iTemp-Integer.parseInt(sNumRow)+1));
pageContext.setAttribute("prev_s", Integer.toString(iTemp));

String sortString = "";
if(srb.getProperty("sq")!=null){
  sortString+="&sq=" + srb.getProperty("sq");
  sortString+="&sc=" + srb.getProperty("sc");
  sortString+="&sd=" + srb.getProperty("sd", "desc");
}

String currRound = resultRow_0==null?srb.getProperty("rd"):resultRow_0.getItem("round_id").toString();
ResultSetContainer rdlist = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetDates", rdlist);

String currSchool = "";
if(bSchool) {
  currSchool = resultRow_0==null?srb.getProperty("hs"):resultRow_0.getItem("school_id").toString();
  ResultSetContainer hslist = (ResultSetContainer) queryEntries.get("Round_Schools_Competed");
  pageContext.setAttribute("resultSetSchools", hslist);
}
%>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->

         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
           <TR>
             <TD   VALIGN="top" WIDTH="11"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top"   WIDTH="100%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>

               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText">
                     <SPAN CLASS="statText"><B>Select round:</B></SPAN>
                     <FORM name="selectform">
                     <SELECT NAME="Contest" onchange="goTo(this)" CLASS="dropdown">
                       <OPTION value="#">Select round:</OPTION>
                       <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
                         <OPTION value="?module=Statistics&c=<%=sContentHandle%>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/><%=bSchool?"&hs="+currSchool:""%>" <%= (resultRow.getItem(0).toString().equals(currRound)) ? "SELECTED" : ""%> ><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
                       </logic:iterate>
                     </SELECT>
                     </FORM>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
               </TABLE>

<% if(bSchool) { %>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText">
                     <SPAN CLASS="statText"><B>Select school:</B></SPAN>
                     <FORM name="selectanotherform">
                     <SELECT NAME="Contest" onchange="goTo(this)" CLASS="dropdown">
                       <OPTION value="#">Select school:</OPTION>
                       <logic:iterate name="resultSetSchools" id="resultRow" type="ResultSetContainer.ResultSetRow">
                         <OPTION value="?module=Statistics&c=<%=sContentHandle%>&rd=<%=currRound%>&hs=<bean:write name="resultRow" property='<%= "item[" + 0 /* school_id */ + "]" %>'/>" <%= (resultRow.getItem(0).toString().equals(currSchool)) ? "SELECTED" : ""%> ><%= resultRow.getItem("attended").toString().equals("0") ? "" : "* " %><bean:write name="resultRow" property='<%= "item[" + 1 /* school full_name */ + "]" %>'/></OPTION>
                       </logic:iterate>
                     </SELECT>
                     </FORM>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
               </TABLE>
<% } %>

               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
<% if(resultRow_0==null) { %>
    <TR>
      <TD CLASS="statText" COLSPAN="16" align="left">No coders from the specified school competed in this round.</TD>
    </TR>
<% } else {
     pageContext.setAttribute("roomId",resultRow_0.getItem(4));
     pageContext.setAttribute("roomName",resultRow_0.getItem(5));
%>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="16">[ <SPAN CLASS="coderTextGray">001 - 899</SPAN> | <SPAN CLASS="coderTextGreen">900 - 1199</SPAN> | <SPAN CLASS="coderTextBlue">1200 - 1499</SPAN> | <SPAN CLASS="coderTextYellow">1500 - 2199</SPAN> | <SPAN CLASS="coderTextRed">2200+</SPAN> ]<BR><BR>
                     Click the <IMG src="/i/hs/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/> icon to view problem information or Room # for Room details.
                   </TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="registerNav" COLSPAN="16" HEIGHT="18">&nbsp;&nbsp;Statistics for <%= resultRow_0.getItem(2).toString() + "&nbsp;&gt;&nbsp;" + resultRow_0.getItem(3).toString() %></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
         <% if(!bSorted || (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter())) { %>
         <TR valign="middle"><TD CLASS="statText" BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="16" HEIGHT="16" align="center">
        <% if((!bSorted && !sStartRow.equals("1")) || rsc2.croppedDataBefore()) { %>
          <a href="?module=Statistics&c=<%=sContentHandle%><%=bSorted?"_sorted":""%><%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">&lt;&lt; previous</a>
        <% } else { %>
          &lt;&lt; previous
        <% } %>
          &nbsp;|&nbsp;
        <% if((!bSorted && bHasNextScroll) || rsc2.croppedDataAfter()) { %>
          <a href="?module=Statistics&c=<%=sContentHandle %><%=bSorted?"_sorted":""%><%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">next &gt;&gt;</a>
        <% } else { %>
           next &gt;&gt;
        <% } %>
                    </TD>
                 </TR>
         <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
        <% } %>

                 <TR VALIGN="middle">
                   <TD BGCOLOR="#1B2E5D"  WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" WIDTH="15%" HEIGHT="18">
             <A <% if(!bSchool) { %>HREF="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText"<% } %>>Coders</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREF="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>Coding<br>Phase</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">+</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREf="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>Challenge<br>Phase</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">+</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREF="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=9&sd=<%= "9".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>Testing<br>Phase</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">=</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREf="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=10&sd=<%= "10".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>Final<br>Points</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             Adv.
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREF="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=12&sd=<%= "12".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>Old<br>Rating</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">+</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREF="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>Rating<br>Change</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">=</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" ALIGN="center">
             <A <% if(!bSchool) { %>HREF="?module=Statistics&c=<%=sContentHandle%>_sorted<%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound%>&sq=Round_Statistics_Data&sc=14&sd=<%= "14".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText"<% } %>>New<br>Rating</A>
           </TD>
                   <TD BGCOLOR="#1B2E5D" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
         <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>

<% if(!bSorted) { //this nugget puts in the room-spacer-line on unsorted stats for the 1st room %>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="16" CLASS="statText" VALIGN="middle" HEIGHT="16"><IMG src="/i/hs/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE= "3" ALIGN="left"><A HREF="?module=Statistics&c=room_stats&rd=<%= currRound %>&rm=<%= pageContext.getAttribute("roomId") %>" CLASS="statText"><%= pageContext.getAttribute("roomName") %></A></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
                 </TR>
<% } %>


    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
       <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 14 /*"coder_score"*/ + "]" %>'/>
        <% if((!bSorted) && !(pageContext.getAttribute("roomName").toString().equals(resultRow.getItem(5).toString()))){
             pageContext.setAttribute("roomName",resultRow.getItem(5));
              pageContext.setAttribute("roomId",resultRow.getItem(4));
        %>
                 <TR>
                   <TD COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="16" CLASS="statText" VALIGN="middle" HEIGHT="16"><IMG src="/i/hs/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE= "3" ALIGN="left"><A HREF="?module=Statistics&c=room_stats&rd=<%= currRound %>&rm=<%= pageContext.getAttribute("roomId") %>" CLASS="statText"><%= pageContext.getAttribute("roomName") %></A></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
                 </TR>
        <% } %>
                 <TR VALIGN="middle">
                   <TD CLASS="statText"  HEIGHT="13" WIDTH="10">
                     <A HREF="?module=Statistics&c=coder_room_stats&rd=<%= currRound %>&rm=<bean:write name="resultRow" property='<%= "item[" + 4 /* id */ + "]" %>'/>&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="statText"><IMG src="/i/hs/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"/></A>
                   </TD>
                   <TD CLASS="statText"><A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>" TITLE="<bean:write name="resultRow" property='<%= "item[" + 18 /* school_name */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></TD>
                   <TD CLASS="statText"ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* coding pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 8 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* testing pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 10 /* final pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 11 /* advanced */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 12 /* old rating */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 13 /* change in */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 14 /* new rating */ + "].resultData" %>'/></TD>
                   <TD WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
               <TR>
                   <TD COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
                 </TR>
         </logic:iterate>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
           <% if(!bSorted || (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter())) { %>
         <TR valign="middle"><TD CLASS="statText" BACKGROUND="/i/hs/blue_heading_bg.gif" COLSPAN="16" HEIGHT="16" align="center">
        <% if((!bSorted && !sStartRow.equals("1")) || rsc2.croppedDataBefore()) { %>
          <a href="?module=Statistics&c=<%=sContentHandle%><%=bSorted?"_sorted":""%><%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">&lt;&lt; previous</a>
        <% } else { %>
          &lt;&lt; previous
        <% } %>
          &nbsp;|&nbsp;
        <% if((!bSorted && bHasNextScroll) || rsc2.croppedDataAfter()) { %>
          <a href="?module=Statistics&c=<%=sContentHandle %><%=bSorted?"_sorted":""%><%=bSchool?"&hs="+currSchool:""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">next &gt;&gt;</a>
        <% } else { %>
           next &gt;&gt;
        <% } %>
                    </TD>
                 </TR>
         <TR>
                   <TD  COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
        <% } %>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="16"><A HREF="#top" CLASS="statText">&nbsp;Back to Top</A></TD>
                 </TR>
<% } %>
               </TABLE>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
