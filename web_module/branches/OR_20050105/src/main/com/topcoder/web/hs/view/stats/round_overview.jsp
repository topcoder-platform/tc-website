<%@ include file="head.inc" %>

<script language="JavaScript">
function submitForm(){
    var frm = document.coderRankForm;
    var v = parseInt(frm.er.value);
    if(isNaN(v) || v<=0) {
        alert(frm.er.value+" is not a positive integer");
    } else {
        frm.er.value = v;
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
        schools[0][i] = currentRow.getItem("school_name").toString();
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
    <SPAN class="statText"><B>Select round:</B></SPAN>
    <FORM name="selectform">
    <SELECT CLASS="dropdown" NAME="Contest" onchange="goTo(this)">
        <OPTION value="#">Select round:</OPTION>
        <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">
         <% if (resultRow.getItem(0).toString().equals(currRound)) { %>
           <OPTION value="?module=Statistics&c=round_overview&er=<%= topN %>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
               <% } else { %>
           <OPTION value="?module=Statistics&c=round_overview&er=<%= topN %>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
        <% } %>
        </logic:iterate>
    </SELECT>
    </FORM>
    </TD>
  </TR>
  <TR>
    <TD   COLSPAN="16">
      <IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR><A NAME="leaders"></A>
    </TD>
  </TR>
  <TR>

    <TD VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="25%" NOWRAP HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif">&nbsp;<B>Handle</B></TD>
<TD VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="35%" NOWRAP HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif">&nbsp;&nbsp;<B>School</B></TD>
    <TD VALIGN="middle" ALIGN="right" BGCOLOR="#CCCCCC" WIDTH="20%" NOWRAP HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif"><B>Points&nbsp;&nbsp;</B></TD>
  <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="20%" NOWRAP HEIGHT="16" class="statText" BACKGROUND="/i/hs/blue_heading_bg.gif">&nbsp;&nbsp;<B>Room</B></TD>
  </TR>
  <TR>
    <TD   COLSPAN="16"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
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
            <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText">
              <A HREF="?module=Statistics&c=member_profile&cr=<%= coderIDs[j][i] %>" CLASS="<bean:write name="nameColor" property='<%= "style[" + ratings[j][i] + "]" %>'/>"><%= coders[j][i] %></A>
            </TD>
            <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText">
              <A HREF="?module=Statistics&c=school_round_stats&rd=<%= currRound %>&hs=<%= hsids[j][i] %>" CLASS="statText"><%= schools[j][i] %></A>
            </TD>
            <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText" ALIGN="right"><%= scores[j][i] %> &nbsp;&nbsp;</TD>
            <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText" ALIGN="center">&nbsp;<%= rooms[j][i] %></TD>
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
      <IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR><A NAME="problem_stats"></A>
    </TD>
  </TR>
  <TR>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP WIDTH="17%" HEIGHT="15" CLASS="statText">&nbsp;<B>Problem Stats</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP WIDTH="25%" HEIGHT="15" CLASS="statText">&nbsp;<B>Problem Name</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP WIDTH="9%" HEIGHT="15" CLASS="statText" ALIGN="right">&nbsp;<B>Submissions</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP WIDTH="17%" HEIGHT="15" CLASS="statText" ALIGN="right">&nbsp;<B>Correct %&nbsp;&nbsp;</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP WIDTH="17%" HEIGHT="15" CLASS="statText" ALIGN="right"><B>Average Pts.</B></TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" BACKGROUND="/i/hs/blue_heading_bg.gif" NOWRAP WIDTH="15%" HEIGHT="15" CLASS="statText" ALIGN="right"></TD>
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
    <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText">&nbsp;<%=problemLevel%></TD>
    <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText">&nbsp;&nbsp;<A HREF="?module=Statistics&c=problem_statement&pm=<%= problemID %>&rd=<%= roundID %>" class="statText"><%=problemName%></A></TD>
    <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText" ALIGN="right"><%=submissions%> &nbsp;&nbsp;</TD>
    <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText" ALIGN="right"><%=perCor%> &nbsp;&nbsp;</TD>
    <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText" ALIGN="right"><%=avgPoints%></TD>
    <TD VALIGN="middle" NOWRAP HEIGHT="15" CLASS="statText" ALIGN="right">&nbsp;<A HREF="JavaScript:void(getGraph('c=problem_distribution_graph&pm=<%= problemID %>&dn=<%= currentDivID %>','600','400','distribution'))" class="statText">Distribution Graph</a></TD>
  </TR>
  <%
      }
    }%>

  <TR>
    <TD VALIGN="middle" COLSPAN="6" BGCOLOR="#CCCCCC" WIDTH="100%" NOWRAP HEIGHT="16" CLASS="registerNav"  BACKGROUND="/i/hs/blue_heading_bg.gif">&nbsp;</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#1B2E5D" COLSPAN="6" ALIGN="center" CLASS="statText">
<FORM name="coderRankForm" action="" method="get">
<%if(!lastMatch){%>
<INPUT TYPE="HIDDEN" NAME="rd" VALUE="<%=roundID%>">
<%}%>
<INPUT TYPE="HIDDEN" NAME="c" VALUE="round_overview">
      Viewing top&nbsp;&nbsp;
<INPUT TYPE="text" NAME="er" MAXLENGTH="4" SIZE="4" value="<%=topN%>">&nbsp;&nbsp;
      <A HREF="javascript:submitForm();" CLASS="statText">&nbsp;[ submit ]</A>
<INPUT TYPE="HIDDEN" NAME="module" VALUE="Statistics">
</FORM>
    </TD>
  </TR>


</TABLE>
         <!-- END BODY -->

<%@ include file="tail.inc" %>
