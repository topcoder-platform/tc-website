<%@ include file="head.inc" %>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->
            <h3>My Rating History</h3>

<%
pageContext.setAttribute("coder_id", srb.getProperty("cr","0000"));

ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Basic_Coder_Information");
boolean bEmpty = (rsc == null || rsc.size()!=1);
if (!bEmpty) {
ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
pageContext.setAttribute("resultRow", rsr);
%>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
		<bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"coder_score"*/ + "]" %>'/>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText">
<B>Coder:</B>&nbsp;<SPAN CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><B><bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></B></SPAN>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4" CLASS="statText" VALIGN="middle" HEIGHT="16">
                     <A HREF="?module=Statistics&c=member_profile&cr=<%= pageContext.getAttribute("coder_id") %>" CLASS="statText">Profile</A>
                   </TD>
                 </TR>
                 <TR>
                     <TD COLSPAN="4" CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
               </TABLE>
<%
} //end if not empty
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("Ratings_History");
pageContext.setAttribute("resultSet", rsc2);

//calculate scrolling information
//1. pick apart parms
String sStartRow=srb.getProperty("sr","1");
pageContext.setAttribute("sr", sStartRow);
String sEndRow = srb.getProperty("er",Integer.toString(rsc2.size()));
pageContext.setAttribute("er", sEndRow);
String sNumRow = srb.getProperty("nr",Integer.toString(rsc2.size()));
pageContext.setAttribute("nr", sNumRow);

//2. calculate next scroll
int iTemp = Integer.parseInt(sEndRow)+1;
pageContext.setAttribute("next_sr", Integer.toString(iTemp));
iTemp += Integer.parseInt(sNumRow)-1;
pageContext.setAttribute("next_er", Integer.toString(iTemp));

//3. now calculate previous scroll
iTemp = Math.max(1,Integer.parseInt(sStartRow)-1);
pageContext.setAttribute("prev_er", Integer.toString(iTemp));
iTemp = Math.max(1,(iTemp-Integer.parseInt(sNumRow)+1));
pageContext.setAttribute("prev_sr", Integer.toString(iTemp));

String sortString = "";
if (srb.getProperty("sq")!=null){
	sortString="&sq=" + srb.getProperty("sq");
	sortString+="&sc=" + srb.getProperty("sc");
	sortString+="&sd=" + srb.getProperty("sd", "desc");
}
String sSortUrl = "?module=Statistics&c=ratings_history&cr="+srb.getProperty("cr")+"&sq=Ratings_History";
%>


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"  WIDTH="100%">
<% if (!bEmpty) { %>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="6" HEIGHT="18">&nbsp; <B>Ratings History</B>
                     <A HREF="JavaScript:void(getGraph('c=rating_history_graph&cr=<%=pageContext.getAttribute("coder_id")%>','800','600','history'))" class="statText">&nbsp;&nbsp;Rating History Graph</a>
                     <A HREF="JavaScript:void(getGraph('c=rating_distribution_graph','600','400','history'))" class="statText">&nbsp;&nbsp;Distribution Graph</a>
</TD>
                </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18"><a href="<%=sSortUrl%>&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Date</a></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="42%"><a href="<%=sSortUrl%>&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" class="statText">Contest</a></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="18%"><a href="<%=sSortUrl%>&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" class="statText">Round</a></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="5%"><a href="<%=sSortUrl%>&sc=5&sd=<%= "5".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Rating</a></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
				 <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
                 <TR>
                   <TD VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" VALIGN="middle" HEIGHT="13"><bean:write format="MM.dd.yy" name="resultRow2" property='<%= "item[" + 3 /* event date */ + "].resultData" %>'/></TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="left">
                     <A HREF="?module=Statistics&c=coder_room_stats&cr=<%=pageContext.getAttribute("coder_id").toString() %>&rd=<bean:write name="resultRow2" property='<%= "item[" + 0 /* round id */ + "]" %>'/>&rm=<bean:write name="resultRow2" property='<%= "item[" + 6 /* room id */ + "]" %>'/>" CLASS="statText"><bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="center">
                     <A HREF="?module=Statistics&c=coder_room_stats&cr=<%=pageContext.getAttribute("coder_id").toString() %>&rd=<bean:write name="resultRow2" property='<%= "item[" + 0 /* round id */ + "]" %>'/>&rm=<bean:write name="resultRow2" property='<%= "item[" + 6 /* room id */ + "]" %>'/>" CLASS="statText"><bean:write name="resultRow2" property='<%= "item[" + 1 /* round name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write name="resultRow2" property='<%= "item[" + 5 /* new Rating */ + "]" %>'/></TD>
                   <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
				 </logic:iterate>
                 <TR>
                   <TD COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif"  COLSPAN="6" HEIGHT="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
		 <% } else { %>
		        <TR>
                  <TD COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                </TR>
				<TR>
            <% if((""+SessionInfo.getUserId()).equals(request.getParameter("cr"))) { %>
                  <TD COLSPAN="7" CLASS="statText">You have no ratings history.</TD>
            <% } else { %>
                  <TD COLSPAN="7" CLASS="statText">This member has no ratings history.</TD>
            <% } %>
                </TR>
         <% } %>
               </TABLE>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
	   <% if (!bEmpty) { %>
		   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
		 <TR><TD CLASS="statText" COLSPAN="6" HEIGHT="16" align="center">
				<% if (rsc2.croppedDataBefore()) { %>
					<a href="?module=Statistics&c=ratings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="statText">&lt;&lt; previous</a>
				<% } else { %>
					&lt;&lt; previous
				<% } %>
					&nbsp;|&nbsp;
				<% if (rsc2.croppedDataAfter()) { %>
					<a href="?module=Statistics&c=ratings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="statText">next &gt;&gt;</a>
				<% } else { %>
					 next &gt;&gt;
				<% } %>
                    </TD>
                 </TR>
			<% } %>
		<% } %>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
