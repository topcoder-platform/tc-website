<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Coder Rankings</TITLE>
<jsp:include page="baseHRef.jsp" />
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />

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
 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="coder_ratings"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>

         <!-- BEGIN BODY -->
<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Coder Rankings&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>
 <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>

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
<form name="coderRankForm" action="/stat" method="get">
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" CLASS="statText">
                     Show <INPUT TYPE="text" NAME="nr" MAXLENGTH="4" SIZE="4" value="<%= srb.getProperty("nr","50") %>">&nbsp;coders per page. <A HREF="javascript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
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
                   <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Rank</TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="48%">
				   <A HREF="/stat?c=coder_ratings&sq=Coder_Ratings&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=1&sd=<%= "1".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("asc") ?"desc":"asc"%>" CLASS="statText">Handle</a>
				   </TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">
				   <A HREF="/stat?c=coder_ratings&sq=Coder_Ratings&pg=<%= iCurrentPage%>&First=<%= iFirst%>&Last=<%=iLast%>&sr=<%=srb.getProperty("sr","1")%>&er=<%=srb.getProperty("er","50")%>&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" CLASS="statText">Rating</a>
				   </TD>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
       <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">
	        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 2 /*"coder_score"*/ + "]" %>'/>
                 <TR>
                   <TD VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD CLASS="statText" HEIGHT="13"><bean:write name="resultRow" property='<%= "item[" + 5 /* order */ + "]" %>'/></TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 1 /* handle */ + "]" %>'/></A>
                   </TD>
                   <TD CLASS="statText" VALIGN="middle" ALIGN="right"><%= coderrank.toString() %></TD>
                   <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		</logic:iterate>
                 <TR>
                   <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
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
                   <TD COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" ALIGN="center" CLASS="statText">
                       Viewing coders ranked&#160;
                       <INPUT TYPE="text" NAME="First" MAXLENGTH="4" SIZE="4" value="<%=iFirst%>">
                       &#160;to&#160;
                       <INPUT TYPE="text" NAME="Last" MAXLENGTH="4" VALIGN="center" SIZE="4" value="<%=iLast%>">
                       <A HREF="javascript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
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
			   </form>
             </TD>
           </TR>
           <TR>
             <TD VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <p><br></p>
         <!-- END BODY -->
       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
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


