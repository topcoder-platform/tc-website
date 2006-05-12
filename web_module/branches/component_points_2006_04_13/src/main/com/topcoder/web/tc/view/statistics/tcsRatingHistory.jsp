<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,com.topcoder.shared.util.ApplicationServer"

%>
<%@ page import="com.topcoder.web.tc.Constants"%>

<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
<HEAD>
<TITLE>TopCoder Statistics</TITLE>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="baseHRef.jsp" />
<jsp:include page="../script.jsp" />
<script type="text/javascript">
var objPopUp = null;
function popUp(event,objectID){
objPopTrig = document.getElementById(event);
objPopUp = document.getElementById(objectID);
xPos = objPopTrig.offsetLeft+15;
yPos = objPopTrig.offsetTop + objPopTrig.offsetHeight - 5;
if(xPos + objPopUp.offsetWidth > document.body.clientWidth) xPos = xPos - objPopUp.offsetWidth;
if(yPos + objPopUp.offsetHeight > document.body.clientHeight) yPos = yPos - objPopUp.offsetHeight - objPopTrig.offsetHeight;
objPopUp.style.left = xPos + 'px';
objPopUp.style.top = yPos + 'px';
objPopUp.style.visibility = 'visible';
}
function popHide(){
objPopUp.style.visibility = 'hidden';
objPopUp = null;
}
</script>
<STYLE TYPE="text/css">
.popper{display:block; margin: 0px auto 0px auto;}
#container{text-align: center;position: relative;margin: 0px;padding: 0px;}
.popUp
{
font-size: 10px;
text-align: center;
background-color: #FFFFCC;
visibility: hidden;
margin: 10px;
padding: 3px;
position: absolute;
white-space: nowrap;
border: solid 1px black;
z-index: 1;
}
</STYLE>
</HEAD>
<BODY>
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR valign="top">
        <TD WIDTH="180">
<!-- Left nav begins -->
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitor_stats"/>
         </jsp:include>
<!-- Left nav ends -->
        </TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<%
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
pageContext.setAttribute("coder_id", srb.getProperty("cr","0000"));
%>

<% if(srb.getProperty(Constants.PHASE_ID).equals("113")){ %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Development Competition History"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Design Competition History"/>
    </jsp:include>
<% } %>

<% if(srb.getProperty(Constants.PHASE_ID).equals("113")){ %>

    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=pageContext.getAttribute("coder_id").toString() %>' context="development"/></span>
    <br>
    <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%= pageContext.getAttribute("coder_id") %>" class="bcLink">Member Profile</A>
    &#160;|&#160;Competition History
    </span>

<% } else { %>

    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=pageContext.getAttribute("coder_id").toString() %>' context="design"/></span>
    <br>
    <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%= pageContext.getAttribute("coder_id") %>" class="bcLink">Member Profile</A>
    &#160;|&#160;Competition History
    </span>

<% } %>

<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Basic_Coder_Information");
boolean bEmpty = (rsc == null || rsc.size()!=1);
if (!bEmpty) {
ResultSetContainer.ResultSetRow rsr = rsc.getRow(0);
pageContext.setAttribute("resultRow", rsr);
%>
    <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"coder_score"*/ + "]" %>'/>
<% }
ResultSetContainer rsc2 = (ResultSetContainer) queryEntries.get("TCS_Ratings_History");
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
String sSortUrl = "/stat?c=tcs_ratings_history&cr="+srb.getProperty("cr")+"&sq=tcs_ratings_history&amp;"+Constants.PHASE_ID+"=" + srb.getProperty(Constants.PHASE_ID);
%>

    <% if (!bEmpty) { %>
   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
      <div class="pagingBox">
      <% if (rsc2.croppedDataBefore()) { %>
         <a href="/stat?c=ratings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">&lt;&lt; previous</a>
      <% } else { %>
         &lt;&lt; previous
      <% } %>
         &nbsp;|&nbsp;
      <% if (rsc2.croppedDataAfter()) { %>
         <a href="/stat?c=atings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">next &gt;&gt;</a>
      <% } else { %>
         next &gt;&gt;
      <% } %>
      </div>
   <% } else { %>
      <div class="pagingBox">&#160;</div>
   <% } %>

     <table class="stat" cellpadding="0" cellspacing="0" width="100%">
         <tr><td class="title" colspan="9">
         <% if(srb.getProperty(Constants.PHASE_ID).equals("113")){%>
         Development
         <% } else { %>
         Design
         <% } %>
         Competition History
         </td></tr>
         <TR>
            <TD CLASS="header"><a href="<%=sSortUrl%>&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Date</a></TD>
            <TD CLASS="header" WIDTH="37%"><a href="<%=sSortUrl%>&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Contest</a></TD>
            <TD CLASS="headerR" WIDTH="9%"><a href="<%=sSortUrl%>&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Score</a></TD>
            <TD CLASS="headerC" WIDTH="9%"><a href="">Submissions</a></TD>
            <TD CLASS="headerC" WIDTH="9%"><a href="<%=sSortUrl%>&sc=13&sd=<%= "13".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Place</a></TD>
            <TD CLASS="headerC" WIDTH="9%">
               <div id="container">
                  <img class="popper" src="/i/interface/emblem/digital_run.gif" alt="The Digital Run" border="0" id="popper0" onmouseover="popUp(this.id,'pop0')" onmouseout="popHide()" />
                  <div id="pop0" class="popUp" style="width:90px;">The Digital Run</div>
               </div>
            <a href="">Points</a>
            </TD>
            <TD CLASS="headerR" WIDTH="9%"><a href="">Earnings</a></TD>
            <TD CLASS="headerR" WIDTH="9%"><a href="<%=sSortUrl%>&sc=5&sd=<%= "5".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Rating</a></TD>
            <TD CLASS="headerR" WIDTH="9%">&#160;</TD>
         </TR>
         <%boolean even = false;%>
         <logic:iterate name="resultSet" id="resultRow2" type="ResultSetContainer.ResultSetRow">
         <tr class="<%=even?"dark":"light"%>">
            <TD class="value"><bean:write format="MM.dd.yy" name="resultRow2" property='<%= "item[" + 3 /* event date */ + "].resultData" %>'/></TD>
            <TD class="value">
                <% if (resultRow2.getIntItem("viewable_category_ind") ==1) { %>
                <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME %>/catalog/c_component.jsp?comp=<bean:write name="resultRow2" property='<%= "item[" + 2 /* component id */ + "]" %>'/>" class="statLink">
                    <bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/>
                </A>
                <% } else { %>
                <bean:write name="resultRow2" property='<%= "item[" + 4 /* contest name */ + "]" %>'/>
                <% } %>
            </TD>
            <TD class="valueR"><bean:write name="resultRow2" property='<%= "item[" + 7 /* score */ + "]" %>'/></TD>
            <TD class="valueC">submissions</TD>
            <TD class="valueC"><bean:write name="resultRow2" property='<%= "item[" + 13 /* placed */ + "]" %>'/></TD>
            <TD class="valueC">points</TD>
            <TD class="valueR">$$$$.$$</TD>
            <TD class="valueR"><bean:write name="resultRow2" property='<%= "item[" + 5 /* new Rating */ + "]" %>'/></TD>
            <TD class="valueR" nowrap="nowrap"><A href="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow2%>"/>" class="statLink">Contest Details</A></TD>
         </TR>
         <%even=!even;%>
         </logic:iterate>
      </TABLE>

<% } else { %>
   This member has no competition history.
<% } %>

<% if (!bEmpty) { %>
   <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
      <div class="pagingBox">
      <% if (rsc2.croppedDataBefore()) { %>
         <a href="/stat?c=ratings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("prev_sr").toString() %>&er=<%=pageContext.getAttribute("prev_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">&lt;&lt; previous</a>
      <% } else { %>
         &lt;&lt; previous
      <% } %>
         &nbsp;|&nbsp;
      <% if (rsc2.croppedDataAfter()) { %>
         <a href="/stat?c=atings_history&cr=<%=pageContext.getAttribute("coder_id").toString() %>&sr=<%=pageContext.getAttribute("next_sr").toString() %>&er=<%=pageContext.getAttribute("next_er").toString() %>&nr=<%=pageContext.getAttribute("nr").toString() %><%=sortString%>" class="bcLink">next &gt;&gt;</a>
      <% } else { %>
         next &gt;&gt;
      <% } %>
      </div>
   <% } %>
<% } %>

         <p><br></p>
         <!-- END BODY -->

       </TD>
       <td WIDTH="180" VALIGN="top">
         <jsp:include page="../public_right.jsp" >
             <jsp:param name="level1" value="profile"/>
         </jsp:include>
       </TD>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
    <!-- Gutter Ends -->
     </tr>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>