<%@ page 
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Room Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<jsp:include page="baseHRef.jsp" />
   <jsp:include page="../script.jsp" />
<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</script>   
 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<%
//common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
String sContentHandle = srb.getContentHandle();

ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetDates", rsc);
ResultSetContainer rscRoomList = (ResultSetContainer) queryEntries.get("Rooms_For_Round");
pageContext.setAttribute("resultSetRooms", rscRoomList);
pageContext.setAttribute("cr", srb.getProperty("cr", ""));
ResultSetContainer image = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");

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
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <% if (sContentHandle.startsWith("coder_")&&!srb.getProperties().containsKey("rd")) { %>
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="level1" value="statistics"/>
                    <jsp:param name="level2" value="my_last_match"/>
                </jsp:include>
            <% } else { %>
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="level1" value="statistics"/>
                </jsp:include>
            <% } %>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Room Statistics&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR/>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>


                    <FORM name="">
                <TR>
                  <TD COLSPAN="4" CLASS="statText">
                    <SPAN CLASS="statTextBig"><B>Please select a round:</B><BR/></SPAN>
                    <SELECT NAME="Contest" onchange="goTo(this)"><OPTION value="#">Select a Round:</OPTION>
                      <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
                        <% if (resultRow.getItem(0).toString().equals(pageContext.getAttribute("rd"))) { %>
                          <OPTION value="/stat?c=room_stats&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>&rm=<bean:write name="resultRow" property='<%= "item[" + 5 /* first room */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round */ + "]" %>'/></OPTION>
                        <% } else { %>           
                          <OPTION value="/stat?c=room_stats&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>&rm=<bean:write name="resultRow" property='<%= "item[" + 5 /* first room */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round */ + "]" %>'/></OPTION>
                        <% } %>      
                      </logic:iterate>
                    </SELECT>
                  </TD>
                </TR>
                <TR>
                  <TD COLSPAN="4" CLASS="statText">
                     <SPAN CLASS="statTextBig"><B>Please select a room:</B><BR/></SPAN>
                     <SELECT NAME="Round" onchange="goTo(this)"><OPTION value="#">Select a Room:</OPTION>
                       <logic:iterate name="resultSetRooms" id="resultRowRoom" type="ResultSetContainer.ResultSetRow">
                         <% if (resultRowRoom.getItem(0).toString().equals(pageContext.getAttribute("rm"))) { %>
                           <OPTION value="/stat?c=room_stats&rd=<%= pageContext.getAttribute("rd") %>&rm=<bean:write name="resultRowRoom" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRowRoom" property='<%= "item[" + 1 /* name */ + "]" %>'/> - <bean:write name="resultRowRoom" property='<%= "item[" + 2 /* division */ + "]" %>'/></OPTION>
                         <% } else { %>
                           <OPTION value="/stat?c=room_stats&rd=<%= pageContext.getAttribute("rd") %>&rm=<bean:write name="resultRowRoom" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRowRoom" property='<%= "item[" + 1 /* name */ + "]" %>'/> - <bean:write name="resultRowRoom" property='<%= "item[" + 2 /* division */ + "]" %>'/></OPTION>
                         <% } %>                 
                       </logic:iterate>
                     </SELECT>
                   </TD>
                 </TR>  
                    </FORM>
                 <TR>
                   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>      
               </TABLE>
<%
if (resultRow_0 == null) {
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">  
                 <TR>
                   <TD CLASS="statTextBig">No information available for the selected room.</TD>    
                 </TR>
               </TABLE>
<%
}
else {
     pageContext.setAttribute("contestName",resultRow_0.getItem(2));
     pageContext.setAttribute("roundName",resultRow_0.getItem(4));
     pageContext.setAttribute("roomName",resultRow_0.getItem(3));
%>      
               <TABLE BORDER="1" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="21"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" COLSPAN="21"><%@include file="coderLegend.html" %><BR><BR>
      Click the <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"> icon to view problem information.</TD>    
                 </TR>    
                 <TR>
                   <TD COLSPAN="21"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>  
              <TR>
                   <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="21" HEIGHT="18">&#160;Statistics for
                     <%= pageContext.getAttribute("contestName").toString() %>&nbsp;>&nbsp;<%= pageContext.getAttribute("roundName").toString() %>&nbsp;>&nbsp;<%= pageContext.getAttribute("roomName").toString() %>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="21"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>  
                 <TR VALIGN="middle">
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="18%" HEIGHT="18">&#160;</TD>      
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center" WIDTH="12%">Submissions</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="5%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>   
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center" WIDTH="12%">Defenses</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="5%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>    
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center" WIDTH="12%">Challenges</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>      
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" ALIGN="center" WIDTH="10%">
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=12&sd=<%= "12".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">System</a>
           </TD> 
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="5%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>       
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" ALIGN="center" WIDTH="10%">
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Point</a>
           </TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" WIDTH="5%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>   
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" COLSPAN="3" ALIGN="center" WIDTH="18%">Ratings</TD>    
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>  
                 <TR>
                   <TD COLSPAN="20"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>   
                 <TR VALIGN="middle">
                   <TD BACKGROUND="/i/steel_blue_bg.gif"  WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="left" HEIGHT="18">
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Coders</A>
           </TD>        
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Qnty</a>
           &#160;/&#160;
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Points</a>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Qnty</a>
           &#160;/&#160;
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=9&sd=<%= "9".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Points</a>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="2" ALIGN="center">
              <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=10&sd=<%= "10".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Qnty</a>
           &#160;/&#160;
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=11&sd=<%= "11".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Points</a>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>      
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=12&sd=<%= "12".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Test</a>
           </TD> 
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>       
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Total</a>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="3" ALIGN="center">
              <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=15&sd=<%= "15".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">Old</a>
           &#160;/&#160;
             <A HREF="/stat?c=<%=sContentHandle%>&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&sq=Room_Summary_Data&sc=17&sd=<%= "17".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%><%= srb.getProperty("cr","").length()>0?"&cr="+srb.getProperty("cr"):"" %>" CLASS="statText">New</a>
           </TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="20"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
       <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 17 /*"coder_score"*/ + "]" %>'/>       
                 <TR VALIGN="middle">
         <% if (sContentHandle.equals("coder_room_stats") && pageContext.getAttribute("cr").toString().equals(resultRow.getItem(1).toString())) { 
           pageContext.setAttribute("coderHandle", resultRow.getItem(0).toString()); %>
                   <TD WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="left" HEIGHT="13"> 
                     <SPAN CLASS="coderBrackets">[&#160;</SPAN><A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A><SPAN CLASS="coderBrackets">&#160;]</SPAN>
                   </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>        
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 6 /* submits */ + "]" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* submit pts */ + "].resultData" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 8 /* defenses */ + "]" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* defense pts */ + "].resultData" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 10 /* challenges */ + "]" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 11 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD> 
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 12 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>           
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 13 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right">&#160;&#160;</TD>        
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 15 /* pre-rating */ + "]" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="5%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>       
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 17 /* end-rating */ + "]" %>'/></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center" VALIGN="middle">
<% if (resultRow.getIntItem("rating_change")<0) { %>
<IMG src="/i/arrow_red_down.gif" width="10" height="10" border="0"/>
<% } %>
<% if (resultRow.getIntItem("rating_change")>0) { %>
<IMG src="/i/arrow_green_up.gif" width="10" height="10" border="0"/>
<% } %>
</TD>
                   <TD WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
         <% } else { %>
                    <TD WIDTH="10"><A HREF="/stat?c=coder_room_stats&rd=<%=pageContext.getAttribute("rd") %>&rm=<%=pageContext.getAttribute("rm") %>&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="statText"><IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"></A></TD>
                   <TD CLASS="coderBrackets" ALIGN="left" HEIGHT="13"> 
                     <A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></A>
                   </TD>
                   <TD CLASS="statText" ><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>        
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 6 /* submits */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* submit pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 8 /* defenses */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* defense pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right">&#160;&#160;</TD>    
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 10 /* challenges */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 11 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD> 
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 12 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>           
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 13 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right">&#160;&#160;</TD>        
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 15 /* pre-rating */ + "]" %>'/></TD>
                   <TD CLASS="statText" WIDTH="5%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>       
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 17 /* end-rating */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="center" VALIGN="middle">
<% if (resultRow.getIntItem("rating_change")<0) { %>
<IMG src="/i/arrow_red_down.gif" width="10" height="10" border="0"/>
<% } %>
<% if (resultRow.getIntItem("rating_change")>0) { %>
<IMG src="/i/arrow_green_up.gif" width="10" height="10" border="0"/>
<% } %>
</TD>
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
         <% } %>
                 </TR>
         <TR>
                   <TD COLSPAN="20"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>    
                 </TR>
      </logic:iterate>

                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="20"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" COLSPAN="20"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
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
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">  
                 <TR>
                   <TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="8" HEIGHT="18" VALIGN="middle" CLASS="statTextBig">&#160;Problem Information for <%=pageContext.getAttribute("coderHandle").toString() %></TD>    
                 </TR>  
                 <TR>
                   <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="8" HEIGHT="18" VALIGN="middle" CLASS="statText">&#160;Problems</TD>    
                 </TR>
                 <TR>
                   <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>            
                 <TR VALIGN="middle">
                   <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%" HEIGHT="18">Class&#160;Name</TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Method&#160;Name</TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Difficulty</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Coding Time</TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Status</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">Points</TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>  

           <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
                 <TR  VALIGN="middle">
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>  
                   <TD CLASS="statText" HEIGHT="13">
                     <A HREF="/stat?c=problem_solution&rm=<%=pageContext.getAttribute("rm") %>&rd=<%=pageContext.getAttribute("rd") %>&pm=<bean:write name="resultRow" property='<%= "item[" + 2 /* problem id*/ + "]" %>'/>&cr=<%=pageContext.getAttribute("cr") %>" CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 0 /* class name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 1 /* method name */ + "]" %>'/></TD>
                   <TD CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 3 /* level desc */ + "]" %>'/></TD>
                   <TD CLASS="statText"><%= sdfTime.format(new java.sql.Time(Long.parseLong(resultRow.getItem(5).toString()))).toString() %></TD>
                   <TD CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 6 /* status */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* points */ + "].resultData" %>'/></TD>      
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>        
                 </TR>  
                 <TR>
                   <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>    
                 </TR>
         </logic:iterate>     
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>    
               </TABLE>
<% } %>             
<% ResultSetContainer rscChallenge = (ResultSetContainer) queryEntries.get("Coder_Challenges");
if (rscChallenge != null && rscChallenge.size() > 0){
pageContext.setAttribute("resultSet", rscChallenge);
%>          
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">  
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="7" HEIGHT="18" VALIGN="middle" CLASS="statText">&#160;Challenges</TD>    
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>            
                 <TR VALIGN="middle">
                   <TD BACKGROUND="/i/steel_blue_bg.gif"  WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%" HEIGHT="18">Challenger</TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%">Defendant</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%">Problem</TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%">Succeeded</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%" ALIGN="right">Points</TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>
           <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
              <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 4 /*"defendent Rank"*/ + "]" %>'/>         
                 <TR VALIGN="middle">
                   <TD  WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>  
                   <TD CLASS="statText" ALIGN="left"><%=pageContext.getAttribute("coderHandle").toString() %></TD>
                   <TD CLASS="statText">
                     <A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 5 /* defendent id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* defendent name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 6 /* class name */ + "]" %>'/></TD>
                   <TD CLASS="statText"><%= resultRow.getItem(8).toString().equals("Y")?"Yes":"No"%></TD>    
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* challenge pts */ + "].resultData" %>'/></TD>      
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>        
                 </TR>  
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>    
                 </TR>
         </logic:iterate>
                  
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>    
               </TABLE>
<% } %>      
<% ResultSetContainer rscDefense = (ResultSetContainer) queryEntries.get("Coder_Defenses");
if (rscDefense != null && rscDefense.size() > 0) {  
pageContext.setAttribute("resultSet", rscDefense);
%>    
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">  
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="7" HEIGHT="18" VALIGN="middle" CLASS="statText">&#160;Defenses</TD>    
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>            
                 <TR VALIGN="middle">
                   <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%" HEIGHT="18">Defendant</TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%">Challenger</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%">Problem</TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%">Succeeded</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="20%" ALIGN="right">Points</TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>  
       
           <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
              <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"challenger Rank"*/ + "]" %>'/>         

                 <TR VALIGN="middle">
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>  
                   <TD CLASS="statText" ALIGN="left"><%=pageContext.getAttribute("coderHandle").toString() %></TD>
                   <TD CLASS="statText">
                     <A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 2 /* challenger id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* challenger_name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 6 /* class name */ + "]" %>'/></TD>
                   <TD CLASS="statText"><%= resultRow.getItem(8).toString().equals("Y")?"Yes":"No"%></TD>    
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>        
                 </TR>  
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>    
                 </TR>
         </logic:iterate>
                       
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR> 
   
               </TABLE>
<% } %>
<% } %>            
<% } %>
             </TD>
           </TR>
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

         <p><br></p>
         <!-- END BODY -->


       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
       <rsc:iterator list="<%=image%>" id="resultRow">
        <CENTER><A HREF="<rsc:item name="link" row="<%=resultRow%>"/>"><img src="<rsc:item name="file" row="<%=resultRow%>"/>" ALT="" WIDTH="<rsc:item name="width" row="<%=resultRow%>"/>" HEIGHT="<rsc:item name="height" row="<%=resultRow%>"/>" BORDER="0"/></A></CENTER>
       </rsc:iterator>
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>

