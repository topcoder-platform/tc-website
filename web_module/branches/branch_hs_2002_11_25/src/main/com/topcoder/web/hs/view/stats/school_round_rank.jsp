<%@ include file="head.inc" %>

<script language="JavaScript">
   function submitForm(goToPg){
 	var frm = document.schoolRankForm;
	var fst = (frm.First.value) ? parseInt(frm.First.value): 1;
	var lst = (frm.Last.value) ? parseInt(frm.Last.value):150;
	var numRow = (frm.nr.value) ? parseInt(frm.nr.value):25;
	if (fst<1) fst=1;
    if(numRow > 150) numRow=150;
	if(numRow < 1) numRow = 25;
	if ((lst - fst) > 1000) lst = fst+ 1000;
	if (!(fst>lst)){
      if (goToPg && (goToPg > 0)){
	    frm.pg.value = goToPg;
	 	frm.sr.value = fst + ((goToPg-1) * numRow);
		frm.er.value = fst + (goToPg * numRow - 1);
	  }else{
	   frm.sr.value = fst;
	   frm.er.value = (fst + numRow - 1);
	   frm.pg.value = 1;
	  }

   	  if (parseInt(frm.sr.value) < fst) {
		  frm.sr.value = fst;
		  frm.er.value = fst+numRow - 1;
		  frm.pg.value = 1;
	  }
	  if (parseInt(frm.er.value) > lst) frm.er.value = lst;
      frm.submit();
	}
   }
</script>

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
    <SPAN class="statText"><B>Please select a round:</B><BR/></SPAN>
    <SELECT CLASS="dropdown" NAME="Contest" onchange="goTo(this)">
        <OPTION value="#">Select a Round:</OPTION>
        <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
         <% if (resultRow.getItem(0).toString().equals(currRound)) { %>
           <OPTION value="/?module=Statistics&c=school_round_rank&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
               <% } else { %>
           <OPTION value="/?module=Statistics&c=school_round_rank&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
        <% } %>
        </logic:iterate>
    </SELECT>
    </TD>
  </TR>
</TABLE>

<% 
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("School_Round_Scores");
pageContext.setAttribute("resultSet", rsc);

//a little exception handling here for numeric issues...
int iCurrentPage = 1;
int iLast = 150;
int iEndRow = 50;
int iFirst = 1;
try{
  iCurrentPage = Integer.parseInt(srb.getProperty("pg","1"));
  iLast = Integer.parseInt(srb.getProperty("Last","150"));
  iFirst = Integer.parseInt(srb.getProperty("First","1"));  
  iEndRow = Integer.parseInt(srb.getProperty("er","50"));
}catch(Exception e){
//ignore
}
%>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
           <TR>
             <TD BGCOLOR="#001934"   VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
             <TD COLSPAN="2" VALIGN="top" BGCOLOR="#001934" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<form name="schoolRankForm" action="/" method="get">
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D"  COLSPAN="5" CLASS="statText">
                     Show <INPUT TYPE="text" NAME="nr" MAXLENGTH="4" SIZE="4" value="<%= srb.getProperty("nr","50") %>" CLASS="bodyText">&nbsp;Schools per page. <A HREF="javascript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D"   COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif"  CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
				   <% if (iCurrentPage > 1) {%>
                     <A HREF="javascript:submitForm(<%= iCurrentPage - 1 %>);" CLASS="statText">&lt;&lt; previous</A>
				   <% } else {%>
				     &lt;&lt; previous
				   <% } %>
                     |   
				 <% if (iEndRow < iLast) {%>
                     <A HREF="javascript:submitForm(<%= iCurrentPage + 1 %>);" CLASS="statText">next &gt;&gt;</A>
				   <% } else {%>
				     next &gt;&gt;
				   <% } %>					 
                   </TD>
                 </TR>
                 <TR>
                   <TD   COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Position</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="48%">
				   <A HREF="/?module=Statistics&c=school_round_ranks&sq=School_Round_Scores&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText">School</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">
				   <A HREF="/?module=Statistics&c=school_round_ranks&sq=School_Round_Scores&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Score</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD   COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
       <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
	        <bean:define id="coderrank" value="3000" />  <%-- @@@ make them all red --%>
                 <TR>
                   <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow" property='<%= "item[" + 3 /* order */ + "]" %>'/></TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/?module=Statistics&c=school_round_stats&rd=<%=currRound%>&hs=<bean:write name="resultRow" property='<%= "item[" + 0 /* school_id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 1 /* school full_name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write name="resultRow" property='<%= "item[" + 2 /* school score */ + "]" %>'/></TD>
                   <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		</logic:iterate>
                 <TR>
                   <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
				   <% if (iCurrentPage > 1) {%>
                     <A HREF="javascript:submitForm(<%= iCurrentPage - 1 %>);" CLASS="statText">&lt;&lt; previous</A>
				   <% } else {%>
				     &lt;&lt; previous
				   <% } %>
                     |   
				 <% if (iEndRow < iLast) {%>
                     <A HREF="javascript:submitForm(<%= iCurrentPage + 1 %>);" CLASS="statText">next &gt;&gt;</A>
				   <% } else {%>
				     next &gt;&gt;
				   <% } %>			
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5" ALIGN="center" CLASS="statText">
                       Viewing schools ranked&#160;
                       <INPUT TYPE="text" NAME="First" MAXLENGTH="4" SIZE="4" value="<%=iFirst%>" CLASS="bodyText">
                       &#160;to&#160;
                       <INPUT TYPE="text" NAME="Last" MAXLENGTH="4" VALIGN="center" SIZE="4" value="<%=iLast%>" CLASS="bodyText">
                       <A HREF="javascript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
               </TABLE>
			   <input type="hidden" name="sr" value="">
			   <input type="hidden" name="er" value="">
			   <input type="hidden" name="pg" value="<%= iCurrentPage%>">
   			   <input type="hidden" name="c" value="school_round_rank">
			   <% if (srb.getProperty("sq", "").equals("School_Round_Scores")) { %>
			   <input type="hidden" name="sq" value="School_Round_Scores">
			   <input type="hidden" name="sc" value="<%=srb.getProperty("sc","2")%>">
			   <input type="hidden" name="sd" value="<%=srb.getProperty("sd", "desc")%>">
			   <% } %>
   			   <input type="hidden" name="module" value="Statistics">
			   </form>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
