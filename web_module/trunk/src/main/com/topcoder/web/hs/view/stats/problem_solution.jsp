<%@ include file="head.inc" %>

<%@ include file="body.inc" %>

<%
String sCoderId = srb.getProperty("cr","");
String sRoomId = srb.getProperty("rm","");
String sRoundId = srb.getProperty("rd","");
pageContext.setAttribute("pm", srb.getProperty("pm",""));

//get the Header info

ResultSetContainer rscHdr = (ResultSetContainer) queryEntries.get("Room_Header_Information");

ResultSetContainer.ResultSetRow resultRowHdr = rscHdr.isValidRow(0)? rscHdr.getRow(0) : null;

String sHeader = "";

if (resultRowHdr != null) {
 sHeader = resultRowHdr.getItem(0).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(1).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(2).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(3).toString();
}

//get the Problem Name info
ResultSetContainer rscInfo = (ResultSetContainer) queryEntries.get("Problem_Data");
ResultSetContainer.ResultSetRow resultRow_Info = rscInfo.isValidRow(0)? rscInfo.getRow(0):null;
String sClassName = resultRow_Info!=null?resultRow_Info.getItem(0).toString():"";

//get the solution text
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Problem_Submission");
ResultSetContainer.ResultSetRow resultRow_0 = rsc.isValidRow(0)? rsc.getRow(0):null;
String sSolutionText = resultRow_0!=null?resultRow_0.getItem("submission_text").toString():"";
//here is where we make the solution-text readable
int i=-1;
while((i = sSolutionText.indexOf("\n\n"))>=0){
  sSolutionText = sSolutionText.substring(0,i+1) + "&nbsp;" + sSolutionText.substring(i+1);

}
java.util.StringTokenizer strtok = new java.util.StringTokenizer(sSolutionText,"\n");
StringBuffer stBuffer = new StringBuffer(sSolutionText.length());
String sTemp = "";
while (strtok.hasMoreTokens()){
  sTemp = strtok.nextToken();
  for (i=0; i<sTemp.length(); i++){
    if (sTemp.charAt(i)==' ')
      stBuffer.append("&nbsp;");
    else if (sTemp.charAt(i)=='\t')
      stBuffer.append("&nbsp;&nbsp;&nbsp;");
    else
      stBuffer.append(JSPUtils.htmlEncode(sTemp.substring(i, i+1)));
  }
  stBuffer.append("<BR>");
}
%>

         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
           <TR>
             <TD   VALIGN="top" WIDTH="11"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top"   WIDTH="100%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="4"  CLASS="statText"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
                 </TR>
               </TABLE>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="7" HEIGHT="18">&nbsp;Problem Statistics for
          <%= sHeader %>
                   </TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Class Name</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Method Name</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Difficulty</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Status</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Points</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<% ResultSetContainer rscSubmissions = (ResultSetContainer) queryEntries.get("Coder_Problems");
pageContext.setAttribute("resultSetSubmissions", rscSubmissions);
if (rscSubmissions.size() > 0) {  %>
   <logic:iterate name="resultSetSubmissions" id="resultRow" type="ResultSetContainer.ResultSetRow">
                   <TR>
                     <TD  VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <% if (pageContext.getAttribute("pm").toString().equals(resultRow.getItem(2).toString())) { %>
                     <TD  CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                      <SPAN CLASS="coderBrackets">[&nbsp;</SPAN><SPAN CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 0 /* class name */ + "]" %>'/></SPAN><SPAN CLASS="coderBrackets">&nbsp;]</SPAN>
                     </TD>
       <% } else { %>
         <TD  CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                      <A HREF="?module=Statistics&c=problem_solution&rd=<%= sRoundId %>&rm=<%=sRoomId %>&cr=<%=sCoderId%>&pm=<bean:write name="resultRow" property='<%= "item[" + 2 /* class name */ + "]" %>'/>"  CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 0 /* class name */ + "]" %>'/></A>
                 </TD>
       <% } %>
                     <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 1 /* method name */ + "]" %>'/></TD>
                     <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 3 /* problem level */ + "]" %>'/></TD>
                     <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 6 /* problem status*/ + "]" %>'/></TD>
                     <TD  CLASS="statText" VALIGN="middle" ALIGN="right"><bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* problem points*/ + "].resultData" %>'/></TD>
                     <TD  VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   </TR>
  </logic:iterate>
                   <TR>
                     <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                   </TR>
<% } %>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                     <TD  CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>


                 <TR>
                   <TD  CLASS="statText" COLSPAN="7" VALIGN="middle" ALIGN="center">
                     <A HREF="?module=Statistics&c=problem_statement&pm=<%= pageContext.getAttribute("pm").toString()%>&rd=<%=sRoundId%>&rm=<%=sRoomId%>&cr=<%=sCoderId%>" CLASS="statText">View&nbsp;<%= sClassName %>&nbsp; Problem Statement</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="7" VALIGN="middle" ALIGN="left">
                  <%= stBuffer.toString().trim().length()==0?"Solution Not Available":stBuffer.toString() %>
                   </TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
               </TABLE>
<!-- Defenses -->
<% ResultSetContainer rscDefense = (ResultSetContainer) queryEntries.get("Problem_Defenses");
pageContext.setAttribute("resultSetDefense", rscDefense);
if (rscDefense.size() > 0) {
  int row = 0;
%>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="10" HEIGHT="18">&nbsp;Defense Results</TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Challenger</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Challenge Arguments</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Expected Result</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Received Result</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Succeeded</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
  <logic:iterate name="resultSetDefense" id="resultRow" type="ResultSetContainer.ResultSetRow">
    <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"challenger Rating"*/ + "]" %>'/>
                 <TR>
                   <TD  COLSPAN="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<%  if (row%2==0) { %>

                 <TR>
                   <TD  VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                     <A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 2 /* challenger id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* challenger name */ + "]" %>'/></A>
                   </TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><%= JSPUtils.htmlEncode(resultRow.getItem(7))%></TD>
                   <TD  VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><%= JSPUtils.htmlEncode(resultRow.getItem(3))%></TD>
                   <TD  VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><%= JSPUtils.htmlEncode(resultRow.getItem(4))%></TD>
                   <TD  VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="center"><%= resultRow.getItem(6).toString().equals("Y")?"Yes":"No" %></TD>
                   <TD  VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<% } else { %>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                     <A HREF="?module=Statistics&c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 2 /* challenger id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 0 /* challenger name */ + "]" %>'/></A>
                   </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="center"><%= JSPUtils.htmlEncode(resultRow.getItem(7))%></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="center"><%= JSPUtils.htmlEncode(resultRow.getItem(3))%></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="center"><%= JSPUtils.htmlEncode(resultRow.getItem(4))%></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="center"><%= resultRow.getItem(6).toString().equals("Y")?"Yes":"No" %></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<% }
   row++;
%>
 </logic:iterate>
                 <TR>
                   <TD  COLSPAN="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>

               </TABLE>
<% } //end if there are > 0 defenses %>


<!-- End Defense -->
<!-- System Testing -->
<% ResultSetContainer rscSysTest = (ResultSetContainer) queryEntries.get("System_Tests");
pageContext.setAttribute("resultSetSysTest", rscSysTest);
if (rscSysTest.size() > 0) {
  int row = 0;
  %>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"   WIDTH="100%">
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="7" HEIGHT="18">&nbsp;System Test Results</TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Test Arguments</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Expected Results</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Result</TD>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
    <logic:iterate name="resultSetSysTest" id="resultRow" type="ResultSetContainer.ResultSetRow">
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<%  if (row%2==0) { %>
                 <TR>
                   <TD  VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(0))%></TD>
                   <TD  VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(1))%></TD>
                   <TD  VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(2))%></TD>
                   <TD  VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<% } else { %>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(0))%></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(1))%></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="5"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(2))%></TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
<% }
   row++;
 %>
   </logic:iterate>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
               </TABLE>
<% } %>
<!-- End System Testing -->
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
