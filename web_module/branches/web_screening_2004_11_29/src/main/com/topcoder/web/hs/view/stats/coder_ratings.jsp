<%@ include file="head.inc" %>

<script language="JavaScript">
   function submitForm(goToPg){
 	var frm = document.coderRankForm;
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

<P><B>Coder Rankings</B></P>

         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
           <TR>
             <TD BGCOLOR="#001934"   VALIGN="top" WIDTH="11"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
             <TD COLSPAN="2" VALIGN="top" BGCOLOR="#001934" WIDTH="100%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDE
R="0"/><BR>

<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Coder_Ratings");
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
<form name="coderRankForm" action="" method="get">
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D"  COLSPAN="6" CLASS="statText">
                     Show <INPUT TYPE="text" NAME="nr" MAXLENGTH="4" SIZE="4" value="<%= srb.getProperty("nr","50") %>" CLASS="bodyText">&nbsp;Coders per page. <A HREF="javascript:submitForm();" CLASS="statText">&nbsp;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D"   COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif"  CLASS="statText" HEIGHT="16" COLSPAN="6" ALIGN="center">
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
                   <TD   COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="20">Rank</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="30%">
				   <A HREF="?module=Statistics&c=coder_ratings&sq=Coder_Ratings&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText">Handle</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="30%">
				   <A HREF="?module=Statistics&c=coder_ratings&sq=Coder_Ratings&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText">High School</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">
				   <A HREF="?module=Statistics&c=coder_ratings&sq=Coder_Ratings&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Rating</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD   COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
       <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
	        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 2 /*"coder_score"*/ + "]" %>'/>
                 <TR>
                   <TD VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow" property='<%= "item[" + 5 /* order */ + "]" %>'/></TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 0 /* coder_id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 1 /* handle */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="?module=Statistics&c=school_round_stats&hs=<bean:write name="resultRow" property='<%= "item[" + 3 /* school_id */ + "]" %>'/>" CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 4 /* school full_name */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="right"><%= coderrank.toString() %></TD>
                   <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		</logic:iterate>
                 <TR>
                   <TD COLSPAN="6"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="6" ALIGN="center">
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
                   <TD BGCOLOR="#1B2E5D" COLSPAN="6" VALIGN="middle"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="6" ALIGN="center" CLASS="statText">
                       Viewing coders ranked&nbsp;
                       <INPUT TYPE="text" NAME="First" MAXLENGTH="4" SIZE="4" value="<%=iFirst%>" CLASS="bodyText">
                       &nbsp;to&nbsp;
                       <INPUT TYPE="text" NAME="Last" MAXLENGTH="4" VALIGN="center" SIZE="4" value="<%=iLast%>" CLASS="bodyText">
                       <A HREF="javascript:submitForm();" CLASS="statText">&nbsp;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="6" VALIGN="middle"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
               </TABLE>
			   <input type="hidden" name="sr" value="">
			   <input type="hidden" name="er" value="">
			   <input type="hidden" name="pg" value="<%= iCurrentPage%>">
   			   <input type="hidden" name="c" value="coder_ratings">
			   <% if (srb.getProperty("sq", "").equals("Coder_Ratings")) { %>
			   <input type="hidden" name="sq" value="Coder_Ratings">
			   <input type="hidden" name="sc" value="<%=srb.getProperty("sc","2")%>">
			   <input type="hidden" name="sd" value="<%=srb.getProperty("sd", "desc")%>">
			   <% } %>
   			   <input type="hidden" name="module" value="Statistics">
			   </form>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
