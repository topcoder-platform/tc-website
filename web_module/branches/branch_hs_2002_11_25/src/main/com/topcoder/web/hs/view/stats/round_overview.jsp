<%@ include file="head.inc" %>

<script language="JavaScript">
   function submitForm(){
 	var frm = document.coderRankForm;
 	frm.action = "/";
    if (isNaN(parseInt(frm.er.value)))
      alert(frm.er.value+" is not a valid integer");
    else{
      frm.er.value = parseInt(frm.er.value);
      frm.submit();
    }
   }
</script>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->

<%
    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfp = new DecimalFormat("0.00%");
    ResultSetContainer leaders = (ResultSetContainer) queryEntries.get("High_Scorers");
    ResultSetContainer percents = (ResultSetContainer) queryEntries.get("Round_Percentages");

    ResultSetContainer.ResultSetRow currentRow = null;
    int topN = 5;
    try{
    	topN = Integer.parseInt(srb.getProperty("er","5"));
    }catch(Exception e){}
    boolean lastMatch = request.getParameter("rd") == null;
//    if(!lastMatch)lastMatch = request.getAttribute("rd").toString().length()==0;
    if(topN<0)topN = 5;
    if(topN>leaders.size()) topN=leaders.size();
    currentRow = leaders.getRow(0);
    String contestName = currentRow.getItem("contest_name").toString();
    int roundID = Integer.parseInt(currentRow.getItem("round_id").toString());

    int divisions = 1;
    String coders[][] = new String[divisions][topN];
    String scores[][] = new String[divisions][topN];
    String rooms[][] = new String[divisions][topN];
    String ratings[][] = new String[divisions][topN];
    String coderIDs[][] = new String[divisions][topN];
    String schools[][] = new String[divisions][topN];
    String hsids[][] = new String[divisions][topN];
    //now go through and put all the coder's data in the arrays
    for(int i = 0; i<topN; i++){
        currentRow = leaders.getRow(i);
        coders[0][i] = currentRow.getItem("handle").toString();
        rooms[0][i] = currentRow.getItem("room_name").toString();
        scores[0][i] = currentRow.getItem("final_points").toString();
        ratings[0][i] = currentRow.getItem("new_rating").toString();
        coderIDs[0][i] = currentRow.getItem("coder_id").toString();
        schools[0][i] = currentRow.getItem("full_name").toString();
        hsids[0][i] = currentRow.getItem("school_id").toString();
    }
%>


<%
String currRound = roundID+"";
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
pageContext.setAttribute("resultSetDates", rsc);
%>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
   <TD COLSPAN="16">
    <SPAN class="statText"><B>Please select a round:</B><BR/></SPAN>
    <SELECT CLASS="dropdown" NAME="Contest" onchange="goTo(this)">
        <OPTION value="#">Select a Round:</OPTION>
        <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
         <% if (resultRow.getItem(0).toString().equals(currRound)) { %>
           <OPTION value="/?module=Statistics&c=round_overview&er=<%= topN %>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
               <% } else { %>
           <OPTION value="/?module=Statistics&c=round_overview&er=<%= topN %>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
        <% } %>
        </logic:iterate>
    </SELECT>
    </TD>
  </TR>
  <TR>
    <TD   COLSPAN="16">
      <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="leaders"></A>
    </TD>
  </TR>
  <TR>
  
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="25%" NOWRAP="0" HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif">&#160;<B>Handle</B></TD>
<TD VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="35%" NOWRAP="0" HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif">&#160;&#160;<B>School</B></TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="20%" NOWRAP="0" HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif"><B>Points</B></TD>
  <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="20%" NOWRAP="0" HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif">&#160;&#160;<B>Room</B></TD>
  </TR>
  <TR>
    <TD   COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>


  <%
      //this part creates the top scorers for the round in each division
      for(int i = 0; i<topN;i++){%>
      <TR>
        <%for(int j = 0; j<divisions;j++){
        if(coderIDs[j][i]==null){//puts in blank rows if the coder doesn't exist - happens when you view more coders than there are participants
        %>
            <TD></TD><TD></TD><TD></TD><TD></TD>
        <%}else{%>
            <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText">
              <A HREF="/?module=Statistics&c=member_profile&cr=<%= coderIDs[j][i] %>" CLASS="<bean:write name="nameColor" property='<%= "style[" + ratings[j][i] + "]" %>'/>"><%= coders[j][i] %></A>
            </TD>
            <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText">
              <A HREF="/?module=Statistics&c=school_round_stats&rd=<%= currRound %>&hs=<%= hsids[j][i] %>" CLASS="<bean:write name="nameColor" property='<%= "style[" + ratings[j][i] + "]" %>'/>"><%= schools[j][i] %></A>
            </TD>
            <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%= scores[j][i] %> &#160;&#160;</TD>
            <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="center">&#160;<%= rooms[j][i] %></TD>
  <%    }
        }%>
      </TR>
  <%}%>
<%  int currentRowPtr = 0;
    for(int i = 0; i<divisions;i++){
    %>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
    <TD   COLSPAN="16">
      <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="problem_stats"></A>
    </TD>
  </TR>
  <TR>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP="0" WIDTH="17%" HEIGHT="15" CLASS="statText">&#160;<B>Problem Stats</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP="0" WIDTH="25%" HEIGHT="15" CLASS="statText">&#160;<B>Problem Name</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP="0" WIDTH="9%" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<B>Submissions</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP="0" WIDTH="17%" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<B>Correct %&#160;&#160;</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP="0" WIDTH="17%" HEIGHT="15" CLASS="statText" ALIGN="right"><B>Average Pts.</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP="0" WIDTH="15%" HEIGHT="15" CLASS="statText" ALIGN="right"></TD>
  </TR>
  <%
      currentRow = percents.getRow(currentRowPtr);
      int currentDivID = Integer.parseInt(currentRow.getItem("division_id").toString());
      while(currentRowPtr<percents.size() &&
              Integer.parseInt((currentRow = percents.getRow(currentRowPtr)).getItem("division_id").toString())==currentDivID){
        currentRowPtr++;
        String problemLevel = currentRow.getItem("problem_level").toString();
        String problemName = currentRow.getItem("problem_name").toString();
        int submissions =Integer.parseInt(currentRow.getItem("submissions").toString());
        int correct = Integer.parseInt(currentRow.getItem("successful_submissions").toString());
        int problemID = Integer.parseInt(currentRow.getItem("problem_id").toString());
        double total = Double.parseDouble(currentRow.getItem("total_points").toString())/correct;
        String perCor = dfp.format((((double)correct)/submissions));
        String avgPoints = df.format(total);
  %>

  <TR>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText">&#160;<%=problemLevel%></TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText">&#160;&#160;<A HREF="/?module=Statistics&c=problem_statement&pm=<%= problemID %>&rd=<%= roundID %>" class="statText"><%=problemName%></A></TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%=submissions%> &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%=perCor%> &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%=avgPoints%></TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<A HREF="JavaScript:getGraph('/graph?c=problem_distribution_graph&pm=<%= problemID %>&dn=<%= currentDivID %>','600','400')" class="statText">Distribution Graph</a></TD>
  </TR>
  <%
      }
    }%>

  <TR>
    <TD VALIGN="middle" COLSPAN="6" BGCOLOR="#CCCCCC" WIDTH="100%" NOWRAP="0" HEIGHT="16" CLASS="registerNav"  BACKGROUND="/i/hs/blue_heading_bg.gif">&#160;</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#1B2E5D" COLSPAN="6" ALIGN="center" CLASS="statText">
<FORM name="coderRankForm" action="javaScript:submitForm();" method="get">
<%if(!lastMatch){%>
<INPUT TYPE="HIDDEN" NAME="rd" VALUE="<%=roundID%>">
<%}%>
<INPUT TYPE="HIDDEN" NAME="c" VALUE="round_overview">
      Viewing top&#160;&#160;
<INPUT TYPE="text" NAME="er" MAXLENGTH="4" SIZE="4" value="<%=topN%>">&#160;&#160;
      <A HREF="javaScript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
<INPUT TYPE="HIDDEN" NAME="module" VALUE="Statistics">
</FORM>
    </TD>
  </TR>


</TD>
<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
</TR>
</TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
