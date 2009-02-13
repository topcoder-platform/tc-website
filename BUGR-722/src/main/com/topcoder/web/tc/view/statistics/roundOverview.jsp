         <%@ page
         language="java"
         import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.shared.dataAccess.resultSet.*,
                 com.topcoder.shared.util.ApplicationServer,
                 java.text.DecimalFormat,
                 java.util.ArrayList"
       %>

       <%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
       <%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
       <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
       <html>
        <head>
          <title>TopCoder Statistics - Match Overview</title>
          <jsp:include page="baseHRef.jsp" />
            <jsp:include page="/script.jsp" />
            <jsp:include page="/style.jsp">
              <jsp:param name="key" value="tc_stats"/>
            </jsp:include>
        </head>

       <body>
          <jsp:include page="../top.jsp" />

       <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr valign="top">
       <!-- Left Column Begins-->
               <td width="180">
                   <jsp:include page="/includes/global_left.jsp">
                      <jsp:param name="node" value="algo_match_overviews"/>
                   </jsp:include>

               </td>
       <!-- Left Column Ends -->

       <!-- Gutter -->
               <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
       <!-- Gutter Ends -->


       <!-- Center Column Begins -->
                <td class="bodyText" width="100%" align="center" style="padding: 12px 0px 0px 0px;">

                <table width="100%" border="0" cellpadding="0" cellspacing="0" valign="top">
                  <tr>
                    <td width="11" height="26" align="left" valign="bottom"><img width="11" height="26" border="0" src="/i/steelblue_top_left1.gif"></td>
                    <td valign="bottom" width="180" align="left"><img width="180" height="26" border="0" src="/i/header_statistics.gif"></td>
                    <td class="bodyTextBold" valign="middle" width="100%">&#160;<span class="bodySubhead">&#160;&#160;<%= "Match Overview"%>&#160;&#160;</span></td>
                    <td valign="top" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"></td>
                  </tr>
                </table>


       <script language="JavaScript">
          function submitForm(){
          var frm = document.coderRankForm;
          frm.action = "/stat";
           if (isNaN(parseInt(frm.er.value)))
             alert(frm.er.value+" is not a valid integer");
           else{
             frm.er.value = parseInt(frm.er.value);
             frm.submit();
           }
          }
       </script>

<% //common code that pulls out the request bean.
           Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>
       <bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<%
           DecimalFormat df = new DecimalFormat("0.00");
           DecimalFormat dfp = new DecimalFormat("0.00%");
           ResultSetContainer leaders = (ResultSetContainer) queryEntries.get("High_Scorers");
           ResultSetContainer percents = (ResultSetContainer) queryEntries.get("Round_Percentages");
           ResultSetContainer image = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");

           ResultSetContainer.ResultSetRow currentRow = null;
           int topN = 5;
           try{
             topN = Integer.parseInt(srb.getProperty("er","5"));
           }catch(Exception e){}
           boolean lastMatch = request.getParameter("rd") == null;
//    if(!lastMatch)lastMatch = request.getAttribute("rd").toString().length()==0;
    if(topN<0)topN = 5;
    if(topN>1000)topN=1000;
    currentRow = leaders.getRow(0);
    String contestName = currentRow.getItem("contest_name").toString();
    int roundID = Integer.parseInt(currentRow.getItem("round_id").toString());
    String forumIDStr = currentRow.getItem("forum_id").toString();
    int forumID = -1;
    if (forumIDStr != "") {
        forumID = Integer.parseInt(forumIDStr);
    }
    //get divisionIDs
    ArrayList divisionNames = new ArrayList(5);
    ArrayList divisionIDs = new ArrayList(5);
    String last = "";
    int divisions = 0;
    //first we go through and extract all the division info
    for(int i = 0; i<percents.size();i++){
        currentRow = percents.getRow(i);
        String current = currentRow.getItem("division_desc").toString();
        if(!current.equals(last)){
            divisionNames.add(current);
            divisionIDs.add(currentRow.getItem("division_id"));
            last = current;
            divisions++;
        }
    }
    int ptrs[] = new int[divisions];
    String coders[][] = new String[divisions][topN];
    String scores[][] = new String[divisions][topN];
    String rooms[][] = new String[divisions][topN];
    String ratings[][] = new String[divisions][topN];
    String coderIDs[][] = new String[divisions][topN];
    String placeds[][] = new String[divisions][topN];
    //now go through and put all the coder's data in the arrays
    int lastDivisionID = -1;
    int divisionPtr = -1;
    for(int i = 0; i<leaders.size();i++){
        currentRow = leaders.getRow(i);
        int divisionID = Integer.parseInt(currentRow.getItem("division_id").toString());
        if(divisionID!=lastDivisionID){
            lastDivisionID = divisionID;
            divisionPtr++;
        }
        if(ptrs[divisionPtr]==topN)continue;
        String handle = currentRow.getItem("handle").toString();
        String room_name = currentRow.getItem("room_name").toString();
        String points = currentRow.getItem("final_points").toString();
        String rating = currentRow.getItem("new_rating").toString();
        String coderID = currentRow.getItem("coder_id").toString();
        String placed = currentRow.getItem("division_placed").toString();
        coders[divisionPtr][ptrs[divisionPtr]]=handle;
        placeds[divisionPtr][ptrs[divisionPtr]]=placed;
        scores[divisionPtr][ptrs[divisionPtr]]=points;
        ratings[divisionPtr][ptrs[divisionPtr]]=rating;
        coderIDs[divisionPtr][ptrs[divisionPtr]]=coderID;
        rooms[divisionPtr][ptrs[divisionPtr]++]=room_name;
    }
    topN = 0;
    for(int i = 0; i<divisions;i++)topN = Math.max(topN,ptrs[i]);

%>
         <table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#001B35" valign="top" style="padding: 3px 10px 0px 10px;">
           <tr>
             <td class="bodyText" valign="top">

<%
       String currRound = roundID+"";
       ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Rounds_By_Date");
       pageContext.setAttribute("resultSetDates", rsc);
%>
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
<!--   <A class="statTextBig" href="/stat?c=<%= ("round_stats&amp;rd="+roundID) %>"><B><%= contestName %></B></A><BR/>-->
<!--DATE <BR/>-->
                            <form name="coderRankForm" action="javaScript:submitForm();" method="get">
                                    <SPAN CLASS="statTextBig"><B>Please select a round:</B><BR/></SPAN>
                                    <SELECT CLASS="dropdown" NAME="Contest" onchange="goTo(this)">
                                    <OPTION value="#">Select a Round:</OPTION>

                                           <logic:iterate name="resultSetDates" id="resultRow" type="ResultSetContainer.ResultSetRow">

                                    <% if (resultRow.getItem(0).toString().equals(currRound)) { %>
                                               <OPTION value="/stat?c=round_overview&er=<%= topN %>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>" selected><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
                                    <% } else { %>
                                               <OPTION value="/stat?c=round_overview&er=<%= topN %>&rd=<bean:write name="resultRow" property='<%= "item[" + 0 /* id */ + "]" %>'/>"><bean:write name="resultRow" property='<%= "item[" + 3 /* match name */ + "]" %>'/> > <bean:write name="resultRow" property='<%= "item[" + 1 /* round name */ + "]" %>'/></OPTION>
                                    <% } %>

                                           </logic:iterate>

                                    </SELECT>
                                    <%  if (forumID != -1) { %>
                                    <br><br><A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=forumID%>" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
                                    <%  } %>
             </td>
           </tr>
         </table>

         <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#001B35" valign="top" style="padding: 0px 10px 0px 10px;">
           <tr>
             <td class="bodyText" height="10" colspan="5" valign="top"><A NAME="leaders"></a></td>
           </tr>

           <tr>
                            <%for(int i = 0; i<divisionNames.size();i++){%>
             <td width="2%" height="16" background="/i/steel_bluebv_bg.gif"></td>
             <td valign="middle" width="19%" nowrap="0" height="16" background="/i/steel_bluebv_bg.gif" class="registerNav">&#160;&#160;<B><%= divisionNames.get(i).toString() %> Leaders</B></td>
             <td valign="middle" align="right" width="10%" nowrap="0" height="16" background="/i/steel_bluebv_bg.gif" class="registerNav"><B>Score</B>&#160;</td>
             <td valign="middle" align="right" width="7%" nowrap="0" height="16" background="/i/steel_bluebv_bg.gif" class="registerNav"><B>Placed</B>&#160;</td>
             <td valign="middle" align="center" width="12%" nowrap="0" height="16" background="/i/steel_bluebv_bg.gif"><A HREF="/stat?c=<%= ("round_stats&amp;rd="+roundID) %>&amp;dn=<%= divisionIDs.get(i).toString() %>" class="statText">Results</A></td>
                            <%}%>
           </tr>

           <tr>
                            <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

                            <% //this part creates the top scorers for the round in each division
                            for(int i = 0; i<topN;i++){%>
                            <tr>
                                <%for(int j = 0; j<divisions;j++){
                                           if(coderIDs[j][i]==null){//puts in blank rows if the coder doesn't exist - happens when you view more coders than there are participants
                                %>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>

                            <%} else {%>
             <td valign="middle" width="2%" height="16" class="statText" align="center"><A HREF="/stat?c=coder_room_stats&rd=<%=roundID %>&cr=<%= coderIDs[j][i] %>" CLASS="statText"><IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"></A></td>
             <td valign="middle" nowrap="0" width="19%" height="16" class="statText" align="left"><a href="/tc?module=MemberProfile&cr=<%= coderIDs[j][i] %>" class="<bean:write name="nameColor" property='<%= "style[" + ratings[j][i] + "]" %>'/>">&#160;<%= coders[j][i] %></a></td>
             <td valign="middle" nowrap="0" width="10%" height="16" class="statText" align="right"><%= scores[j][i] %>&#160;</td>
             <td valign="middle" nowrap="0" width="7%" height="16" class="statText" align="right"><%= placeds[j][i] %>&#160;</td>
             <td valign="middle" nowrap="0" width="12%" height="16" class="statText" align="center"><%= rooms[j][i] %>&#160;</td>
                            <%  }

                                }%>
                            </tr>
                                <%}%>

<%  int currentRowPtr = 0;
           for(int i = 0; i<divisions;i++){
%>
         </table>

         <a name="problem_stats"></a>
         <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#001B35" valign="top" style="padding: 10px 10px 0px 10px;">
           <tr><td valign="middle" colspan="7" width="100%" nowrap="0" height="16" class="registerNav" background="/i/steel_bluebv_bg.gif">&#160;&#160;<B><%= divisionNames.get(i).toString() %> Problem Stats</B></td></tr>
           <tr>
             <td valign="middle" nowrap="0" width="17%" height="16" class="statText">&#160;</td>
             <td valign="middle" nowrap="0" width="25%" height="16" class="statText">&#160;<B>Problem Name</B></td>
             <td valign="middle" nowrap="0" width="9%" height="16" class="statText" align="right">&#160;<B>Submissions</B></td>
             <td valign="middle" nowrap="0" width="17%" height="16" class="statText" align="right">&#160;<B>Correct %&#160;&#160;</B></td>
             <td valign="middle" nowrap="0" width="17%" height="16" class="statText" align="right"><B>Average Pts.</B></td>
             <td colspan="2" valign="middle" nowrap="0" width="15%" height="16" class="statText" align="right"></td>
<%--             <td valign="middle" nowrap="0" width="15%" height="15" class="statText" align="right"></td> --%>
           </tr>
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
               double total = correct==0?0.0D:Double.parseDouble(currentRow.getItem("total_points").toString())/correct;
               String perCor = dfp.format(submissions==0?0.0D:(((double)correct)/submissions));
               String avgPoints = df.format(total);
  %>

           <tr>
             <td valign="middle" nowrap="0" height="16" class="statText">&#160;<%=problemLevel%></td>
             <td valign="middle" nowrap="0" height="16" class="statText">&#160;&#160;<A HREF="/stat?c=problem_statement&pm=<%= problemID %>&rd=<%= roundID %>" class="statText"><%=problemName%></A></td>
             <td valign="middle" nowrap="0" height="16" class="statText" align="right"><%=submissions%> &#160;&#160;</td>
             <td valign="middle" nowrap="0" height="16" class="statText" align="right"><%=perCor%> &#160;&#160;</td>
             <td valign="middle" nowrap="0" height="16" class="statText" align="right"><%=avgPoints%></td>
             <td valign="middle" nowrap="0" height="16" class="statText" align="right">&#160;<a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=<%=roundID%>&pm=<%= problemID %>&dn=<%= currentDivID %>','600','400','distribution')" class="statText">Distribution Graph</a></td>
             <td valign="middle" nowrap="0" height="16" class="statText" align="right">&#160;<a href="Javascript:void openProblemRating(<%= problemID %>)" class="statText"><img border="0" src="/i/rate_it.gif" /></a></td>
           </tr>
                                <%
                                    }
                                }%>
           <tr><td valign="middle" colspan="7" width="100%" nowrap="0" height="16" class="registerNav"  background="/i/steel_bluebv_bg.gif"></td></tr>

           <tr>
             <td colspan="6" align="center" class="statText">
                                    <%if(!lastMatch){%>
                                               <INPUT TYPE="HIDDEN" NAME="rd" VALUE="<%=roundID%>">
                                    <%}%>
                                    <INPUT TYPE="HIDDEN" NAME="c" VALUE="round_overview">

                                    Viewing top&#160;&#160;
                                    <INPUT TYPE="text" NAME="er" MAXLENGTH="4" SIZE="4" value="<%=topN%>">&#160;&#160;
                                    <A HREF="javaScript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
             </td>
           </tr>
           <tr>
             <td colspan="7">&#160;</td>
           </tr>
         </table>
             </form>

        <p><br/></p>
       </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
       <td width="180" valign="top"><img src="/i/clear.gif" width="180" height="1" border="0">
       <rsc:iterator list="<%=image%>" id="resultrow">
        <CENTER><a href="<rsc:item name="link" row="<%=resultrow%>"/>"><img src="<rsc:item name="file" row="<%=resultrow%>"/>" ALT="" width="<rsc:item name="width" row="<%=resultrow%>"/>" height="<rsc:item name="height" row="<%=resultrow%>"/>" border="0"/></a></CENTER>
       </rsc:iterator>
         <jsp:include page="../public_right.jsp" />
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
   </tr>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>