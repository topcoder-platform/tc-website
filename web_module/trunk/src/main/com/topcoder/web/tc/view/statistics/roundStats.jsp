<%@ page 
  language="java"
  import="java.net.URLEncoder,com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
//common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");

String sDivision = srb.getProperty("dn","1");

String sContentHandle = srb.getContentHandle();
boolean bSorted = sContentHandle.endsWith("_sorted");
if (bSorted) 
  sContentHandle = sContentHandle.substring(0, sContentHandle.indexOf("_sorted"));

boolean bRequireLogin = sContentHandle.startsWith("round_stats");
%>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<%
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("Round_Statistics_Data");
ResultSetContainer rsc3 = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");
pageContext.setAttribute("resultSet", rsc2);
ResultSetContainer.ResultSetRow resultRow_0 = rsc2.isValidRow(0)? rsc2.getRow(0):null;
ResultSetContainer.ResultSetRow sir = rsc3.isValidRow(0)? rsc3.getRow(0):null;
boolean hasSponsorImage = (sir!=null);
if (hasSponsorImage) pageContext.setAttribute("sponsorImageRow", sir);


//calculate scrolling information
//1. pick apart parms
String sStartRow = "";
String sEndRow = "";
String sNumRow = "";
if (bSorted){ 
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
if (!(bSorted)){
  ResultSetContainer rscRoomCount = (ResultSetContainer) queryEntries.get("Division_Room_Count");
  iMaxRoom = Integer.parseInt(rscRoomCount.getItem(0,0).toString());
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

String sortString = "&dn="+srb.getProperty("dn","1");
if (srb.getProperty("sq")!=null){
  sortString+="&sq=" + srb.getProperty("sq");
  sortString+="&sc=" + srb.getProperty("sc");
  sortString+="&sd=" + srb.getProperty("sd", "desc");  
}
%>

<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Round Statistics</TITLE>
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
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <% if (bRequireLogin) { %>
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="level1" value="statistics"/>
                </jsp:include>
            <% } else { %>
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="level1" value="statistics"/>
                    <jsp:param name="level2" value="last_match"/>
                </jsp:include>
            <% } %>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>


         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;<%= bRequireLogin?"Round Statistics":"Last Match Results"%>&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<%
String currRound = resultRow_0==null?srb.getProperty("rd"):resultRow_0.getItem("round_id").toString();
if (bRequireLogin){
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetDates", rsc);
%>           
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>  
        <TR>
                   <TD COLSPAN="4" CLASS="statText">
                     <SPAN CLASS="statTextBig"><B>Please select a round:</B><BR/></SPAN>
                     <FORM name="">
                     <SELECT NAME="Contest" onchange="goTo(this)">
           <OPTION value="#">Select a Round:</OPTION>
         <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
         <% if (resultRow.getItem(0).toString().equals(currRound)) { %>
           <OPTION value="/stat?c=round_stats&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
               <% } else { %>
           <OPTION value="/stat?c=round_stats&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
        <% } %>   
        </logic:iterate>
           </SELECT>
                   </FORM>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>      
               </TABLE>
<% } %>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
         <TR>
                   <TD COLSPAN="16" CLASS="statText">
           <a href="/stat?c=<%=sContentHandle%>&rd=<%=currRound %>&dn=1" class="statTextBig">Division-I</a>&nbsp;|&nbsp;<a href="/stat?c=<%=sContentHandle%>&rd=<%=currRound %>&dn=2" class="statTextBig">Division-II</a></TD>
                 </TR>

         <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
<% if (resultRow_0==null) { %>
    <tr>
      <TD CLASS="statTextBig" COLSPAN="16" align="left">There were no Division <%=sDivision.equals("1")?"I":"II"%> coders in this round.</td>  
    </tr>
<% } else {
     pageContext.setAttribute("roomId",resultRow_0.getItem(4));
     pageContext.setAttribute("roomName",resultRow_0.getItem(5)); 

%>
                 <TR>
                   <TD CLASS="statText" COLSPAN="16"><%@include file="coderLegend.html" %><BR><BR>
                     Click the <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/> icon to view problem information or Room # for Room details.
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>  
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="16" HEIGHT="18">&#160;&#160;Statistics for <%= resultRow_0.getItem(2).toString() + "&nbsp;&gt;&nbsp;" + resultRow_0.getItem(3).toString() %>&nbsp;&gt;&nbsp;Division-<%=sDivision.equals("1")?"I":"II"%></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
         <% if (!bSorted || (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter())) { %>
         <TR valign="middle"><TD CLASS="statText" BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="16" HEIGHT="16" align="center">
        <% if ((!bSorted && !sStartRow.equals("1")) || rsc2.croppedDataBefore()) { %>
          <a href="/stat?c=<%=sContentHandle%><%=bSorted?"_sorted":""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">&lt;&lt; previous</a>   
        <% } else { %>
          &lt;&lt; previous  
        <% } %>
          &nbsp;|&nbsp;
        <% if ((!bSorted && bHasNextScroll) || rsc2.croppedDataAfter()) { %>
          <a href="/stat?c=<%=sContentHandle %><%=bSorted?"_sorted":""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">next &gt;&gt;</a>
        <% } else { %>
           next &gt;&gt;           
        <% } %>
                    </TD>
                 </TR> 
         <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
        <% } %>   
        
                 <TR VALIGN="middle">    
                   <TD BACKGROUND="/i/steel_blue_bg.gif"  WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" WIDTH="15%" HEIGHT="18">
             <A HREF="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Coders</A>
           </TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Coding<br>Phase</A>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">+</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREf="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=8&sd=<%= "8".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Challenge<br>Phase</A>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">+</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=9&sd=<%= "9".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Testing<br>Phase</A>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">=</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREf="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=10&sd=<%= "10".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Final<br>Points</A>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             Adv.
           </TD>  
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=12&sd=<%= "12".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Old<br>Rating</A>
           </TD>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">+</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Rating<br>Change</A>
           </TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">=</TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="center">
             <A HREF="/stat?c=<%=sContentHandle%>_sorted&rd=<%=currRound%>&dn=<%=sDivision%>&sq=Round_Statistics_Data&sc=14&sd=<%= "14".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">New<br>Rating</A>
           </TD>    
                   <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
         <TR>    
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>
         
<% if (!bSorted) 
//this nugget puts in the room-spacer-line on unsorted stats for the 1st room
{
  pageContext.setAttribute("roomDivision",resultRow_0.getItem(15)); 
 %>
                 <TR>    
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="16" CLASS="statText" VALIGN="middle" HEIGHT="16"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE= "3" ALIGN="left"><A HREF="/stat?c=room_stats&rd=<%= currRound %>&rm=<%= pageContext.getAttribute("roomId") %>" CLASS="statText"><%= pageContext.getAttribute("roomName") %> - <%= pageContext.getAttribute("roomDivision") %></A></TD>
                 </TR>   
                 <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>    
                 </TR> 
<% } %>         
           
            
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
       <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 14 /*"coder_score"*/ + "]" %>'/>
        <% if ((!bSorted) && !(pageContext.getAttribute("roomName").toString().equals(resultRow.getItem(5).toString()))){ 
             pageContext.setAttribute("roomName",resultRow.getItem(5));
              pageContext.setAttribute("roomId",resultRow.getItem(4));
              pageContext.setAttribute("roomDivision",resultRow.getItem(15));
        %> 
                 <TR>    
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>    
                 </TR>   
                 <TR>    
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="16" CLASS="statText" VALIGN="middle" HEIGHT="16"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE= "3" ALIGN="left"><A HREF="/stat?c=room_stats&rd=<%= currRound %>&rm=<%= pageContext.getAttribute("roomId") %>" CLASS="statText"><%= pageContext.getAttribute("roomName") %> - <%= pageContext.getAttribute("roomDivision") %></A></TD>
                 </TR>   
                 <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>    
                 </TR> 
        <% } %>
                 <TR VALIGN="middle">
                   <TD CLASS="statText"  HEIGHT="13" WIDTH="10">
                     <A HREF="/stat?c=coder_room_stats&rd=<%= currRound %>&rm=<bean:write name="resultRow" property='<%= "item[" + 4 /* id */ + "]" %>'/>&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="statText"><IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"/></A>
                   </TD>
                   <TD CLASS="statText"><A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></TD>
                   <TD CLASS="statText"ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* coding pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 8 /* challenge pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 9 /* testing pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 10 /* final pts */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 11 /* advanced */ + "]" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 12 /* old rating */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 13 /* change in */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" ALIGN="right"><bean:write format="0" name="resultRow" property='<%= "item[" + 14 /* new rating */ + "].resultData" %>'/></TD>
                   <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
               <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
                 </TR>
         </logic:iterate>
                 <TR>
                   <TD CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
           <% if (!bSorted || (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter())) { %>
         <TR valign="middle"><TD CLASS="statText" BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="16" HEIGHT="16" align="center">
        <% if ((!bSorted && !sStartRow.equals("1")) || rsc2.croppedDataBefore()) { %>
          <a href="/stat?c=<%=sContentHandle%><%=bSorted?"_sorted":""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("prev_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">&lt;&lt; previous</a>   
        <% } else { %>
          &lt;&lt; previous  
        <% } %>
          &nbsp;|&nbsp;
        <% if ((!bSorted && bHasNextScroll) || rsc2.croppedDataAfter()) { %>
          <a href="/stat?c=<%=sContentHandle %><%=bSorted?"_sorted":""%>&rd=<%=currRound %>&s<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_s").toString() %>&e<%=bSorted?"r":"m"%>=<%=pageContext.getAttribute("next_e").toString() %>&n<%=bSorted?"r":"m"%>=<%=sNumRow%><%=sortString%>" class="statText">next &gt;&gt;</a>
        <% } else { %>
           next &gt;&gt;           
        <% } %>
                    </TD>
                 </TR> 
         <TR>
                   <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
        <% } %>   
                 <TR>
                   <TD CLASS="statText" COLSPAN="16"><A HREF="/stat?c=round_stats#top" CLASS="statText">&#160;Back to Top</A></TD>
                 </TR>
<% } %>         
               </TABLE>
             </TD>
           </TR>
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>     
         </TABLE>
         
         <p><br></p>
         <!-- END BODY -->

       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">

<% if (hasSponsorImage) { %>
        <CENTER><A HREF="<bean:write name="sponsorImageRow" property='<%= "item[" + 1 /* link */ + "]" %>'/>"><img src="<bean:write name="sponsorImageRow" property='<%= "item[" + 0 /* link */ + "]" %>'/>" ALT="" WIDTH="<bean:write name="sponsorImageRow" property='<%= "item[" + 2 /* width */ + "]" %>'/>" HEIGHT="<bean:write name="sponsorImageRow" property='<%= "item[" + 3 /* height */ + "]" %>'/>" BORDER="0"/></A></CENTER>
<% } %>


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

