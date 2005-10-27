<%@ page
  language="java"
  import="com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,
          com.topcoder.shared.dataAccess.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.shared.util.ApplicationServer,
          java.text.DecimalFormat,
          java.util.ArrayList"
%>

<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Round Overview</TITLE>
   <jsp:include page="baseHRef.jsp" />
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />
 </HEAD>
 <BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="round_overview"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="99%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR>

         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;<%= "Round Overview"%>&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>

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
        coders[divisionPtr][ptrs[divisionPtr]]=handle;
        scores[divisionPtr][ptrs[divisionPtr]]=points;
        ratings[divisionPtr][ptrs[divisionPtr]]=rating;
        coderIDs[divisionPtr][ptrs[divisionPtr]]=coderID;
        rooms[divisionPtr][ptrs[divisionPtr]++]=room_name;
    }
    topN = 0;
    for(int i = 0; i<divisions;i++)topN = Math.max(topN,ptrs[i]);

%>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" width="100%">
                <TR>
                    <TD CLASS="bodyText" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/><br/>

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
                        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">
                            <FORM name="coderRankForm" action="javaScript:submitForm();" method="get">
                            <TR>
                                <TD COLSPAN="18">
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
                                    &#160;<A HREF="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=<%=forumID%>" CLASS="statText">Discuss</A>
                                    <%  } %>
                                </TD>
                            </TR>

                            <TR>
                                <TD COLSPAN="18"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="leaders"></A></TD>
                            </TR>

                            <TR>

                            <%for(int i = 0; i<divisionNames.size();i++){%>
                                <TD BACKGROUND="/i/steel_bluebv_bg.gif"></TD>
                                <TD VALIGN="middle" COLSPAN="2" WIDTH="40%" NOWRAP="0" HEIGHT="18" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="registerNav">&#160;&#160;<B><%= divisionNames.get(i).toString() %> Leaders</B></TD>
                                <TD VALIGN="middle" ALIGN="center" WIDTH="10%" NOWRAP="0" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/stat?c=<%= ("round_stats&amp;rd="+roundID) %>&amp;dn=<%= divisionIDs.get(i).toString() %>" class="statText">Results</A></TD>
                            <%}%>

                            </TR>

                            <TR><TD COLSPAN="18"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD></TR>

                            <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

                            <% //this part creates the top scorers for the round in each division
                            for(int i = 0; i<topN;i++){%>
                            <TR>
                                <%for(int j = 0; j<divisions;j++){
                                    if(coderIDs[j][i]==null){//puts in blank rows if the coder doesn't exist - happens when you view more coders than there are participants
                                %>
                                <TD></TD>
                                <TD></TD>
                                <TD></TD>
                                <TD></TD>

                            <%} else {%>
                                <TD VALIGN="middle" WIDTH="1%" CLASS="statText">
                                    <A HREF="/stat?c=coder_room_stats&rd=<%=roundID %>&cr=<%= coderIDs[j][i] %>" CLASS="statText">
                                       <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0">
                                    </A>
                                </TD>

                                <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="statText">
                                    <A HREF="/tc?module=MemberProfile&cr=<%= coderIDs[j][i] %>" CLASS="<bean:write name="nameColor" property='<%= "style[" + ratings[j][i] + "]" %>'/>"><%= coders[j][i] %></A>
                                </TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="statText" ALIGN="right"><%= scores[j][i] %> &#160;&#160;</TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="statText">&#160;<%= rooms[j][i] %></TD>
                            <%  }

                                }%>
                            </TR>
                                <%}%>

<%  int currentRowPtr = 0;
    for(int i = 0; i<divisions;i++){
%>
                        </TABLE>

                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="problem_stats"></A>

                        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#001B35">
                            <TR><TD VALIGN="middle" COLSPAN="7" WIDTH="100%" NOWRAP="0" HEIGHT="16" CLASS="registerNav" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<B><%= divisionNames.get(i).toString() %> Problem Stats</B></TD></TR>

                            <TR><TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"></TD></TR>

                            <TR>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="17%" HEIGHT="15" CLASS="statText">&#160;</TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="25%" HEIGHT="15" CLASS="statText">&#160;<B>Problem Name</B></TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="9%" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<B>Submissions</B></TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="17%" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<B>Correct %&#160;&#160;</B></TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="17%" HEIGHT="15" CLASS="statText" ALIGN="right"><B>Average Pts.</B></TD>
                                <TD VALIGN="middle" NOWRAP="0" WIDTH="15%" HEIGHT="15" CLASS="statText" ALIGN="right"></TD>
<%--                                <TD VALIGN="middle" NOWRAP="0" WIDTH="15%" HEIGHT="15" CLASS="statText" ALIGN="right"></TD> --%>
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
        double total = correct==0?0.0D:Double.parseDouble(currentRow.getItem("total_points").toString())/correct;
        String perCor = dfp.format(submissions==0?0.0D:(((double)correct)/submissions));
        String avgPoints = df.format(total);
  %>

                            <TR>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText">&#160;<%=problemLevel%></TD>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText">&#160;&#160;<A HREF="/stat?c=problem_statement&pm=<%= problemID %>&rd=<%= roundID %>" class="statText"><%=problemName%></A></TD>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%=submissions%> &#160;&#160;</TD>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%=perCor%> &#160;&#160;</TD>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right"><%=avgPoints%></TD>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<A HREF="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=<%=roundID%>&pm=<%= problemID %>&dn=<%= currentDivID %>','600','400','distribution')" class="statText">Distribution Graph</A></TD>
                                <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="statText" ALIGN="right">&#160;<A HREF="Javascript:void openProblemRating(<%= problemID %>)" class="statText"><img src="/i/rate_it_blue.gif" width="60" height="18" border="0" hspace="10"/></A></TD>
                            </TR>
                                <%
                                    }
                                }%>
                            <TR><TD VALIGN="middle" COLSPAN="7" WIDTH="100%" NOWRAP="0" HEIGHT="16" CLASS="registerNav"  BACKGROUND="/i/steel_bluebv_bg.gif"></TD></TR>

                            <TR>
                                <TD COLSPAN="6" ALIGN="center" CLASS="statText">
                                    <%if(!lastMatch){%>
                                        <INPUT TYPE="HIDDEN" NAME="rd" VALUE="<%=roundID%>">
                                    <%}%>
                                    <INPUT TYPE="HIDDEN" NAME="c" VALUE="round_overview">

                                    Viewing top&#160;&#160;
                                    <INPUT TYPE="text" NAME="er" MAXLENGTH="4" SIZE="4" value="<%=topN%>">&#160;&#160;
                                    <A HREF="javaScript:submitForm();" CLASS="statText">&#160;[ submit ]</A>
                                </TD>
                            </TR>
                        </TABLE>
                    </TD>
                </TR>

                <TR><TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
            </FORM>
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



