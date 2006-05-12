<%@ page
  language="java"
  import="com.topcoder.shared.util.ApplicationServer,
         com.topcoder.shared.dataAccess.resultSet.*,
         com.topcoder.shared.dataAccess.*,
         com.topcoder.web.common.BaseServlet,
         com.topcoder.web.tc.Constants,
         com.topcoder.web.tc.model.SoftwareComponent" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
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
 function next() {
   var myForm = document.pointsHistoryForm;
   var oldStartRank = myForm.<%=DataAccessConstants.START_RANK%>.value;
   myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.END_RANK%>.value) + 1;
   myForm.<%=DataAccessConstants.END_RANK%>.value=2*parseInt(myForm.<%=DataAccessConstants.END_RANK%>.value)-parseInt(oldStartRank)+1;
   myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
   myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
   myForm.submit();
 }
 function previous() {
   var myForm = document.pointsHistoryForm;
   var oldEndRank = myForm.<%=DataAccessConstants.END_RANK%>.value;
   myForm.<%=DataAccessConstants.END_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) - 1;
   myForm.<%=DataAccessConstants.START_RANK%>.value=2*parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(oldEndRank) - 1;
   myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
   myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
   myForm.submit();
 }
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
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.CODER_LIST_KEY);
  String type = (String)request.getAttribute(Constants.TYPE_KEY);
  String phaseId = (String)request.getParameter(Constants.PHASE_ID);
  String coderId = (String)request.getParameter(Constants.CODER_ID);
%>

<% if(phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))){ %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Development Points History"/>
    </jsp:include>
<% } else { %>
    <jsp:include page="../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Design Points History"/>
    </jsp:include>
<% } %>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
    <br>
    <% if(phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))){ %>
        <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
    <% } else { %>
        <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } %>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
    &#160;|&#160;<A HREF="/stat?c=tcs_ratings_history&amp;<%=Constants.PHASE_ID%>=<%=phaseId%>&cr=<%=coderId%>" CLASS="bcLink">Rating History</A>
    &#160;|&#160;<A HREF="/stat?c=component_history&amp;<%=Constants.PHASE_ID%>=<%=phaseId%>&cr=<%=coderId%>" class="bcLink">Earnings History</A>
    &#160;|&#160;Points History
</span>


<div class="pagingBox" style="clear:both;">
        <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
            <%=(rsc2.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
            | <%=(rsc2.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
        <% } else { %>
            &#160;
        <% } %>
</div>

        <form name="pointsHistoryForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
           <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PointsHistory"/>
           <tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
           <tc-webtag:hiddenInput name="<%=Constants.CODER_ID%>"/>
              <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                 <tr><td class="title" colspan="9">
                 <% if(phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))){%>
                    Development
                 <% } else { %>
                    Design
                 <% } %>
                 Points History
                 </td></tr>
                 <tr>
                    <TD CLASS="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Date</a></TD>
                    <TD CLASS="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Contest</a></TD>
                    <TD CLASS="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true"/>">Score</a></TD>
                    <TD CLASS="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Submissions</a></TD>
                    <TD CLASS="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Placed</a></TD>
                    <TD CLASS="headerC">
                         <div id="container">
                            <img class="popper" src="/i/interface/emblem/digital_run.gif" alt="The Digital Run" border="0" id="popper0" onmouseover="popUp(this.id,'pop0')" onmouseout="popHide()" />
                            <div id="pop0" class="popUp" style="width:90px;">The Digital Run</div>
                         </div>
                         <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Points</a>
                     </TD>
                    <TD CLASS="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="9" includeParams="true"/>">Earnings</a></TD>
                    <TD CLASS="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true"/>">Rating</a></TD>
                    <TD CLASS="header" WIDTH="15%" align="right">&#160;</TD>
                 </tr>
                 <%boolean even = false;%>
                 <rsc:iterator list="<%=rsc2%>" id="resultRow">
                 <tr class="<%=even?"dark":"light"%>">
                    <TD class="value"><rsc:item name="rating_date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                    <TD class="value">
                        <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>" CLASS="statLink">
                            <rsc:item name="component_name" row="<%=resultRow%>"/>
                        </A>
                    </TD>
                    <TD class="valueR"><rsc:item name="final_score" row="<%=resultRow%>" format="0.00"/></TD>
                    <TD class="valueC"><rsc:item name="num_submissions_passed_review" row="<%=resultRow%>"/></TD>
                    <TD class="valueC"><rsc:item name="placed" row="<%=resultRow%>"/></TD>
                    <TD class="valueC"><rsc:item name="final_points" row="<%=resultRow%>"/></TD>
                    <TD class="valueR">$&nbsp;<rsc:item name="earning" row="<%=resultRow%>" format="0.00"/></TD>
                    <TD class="valueR"><rsc:item name="new_rating" row="<%=resultRow%>"/></TD>
                    <TD class="valueR">
                        <A HREF="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>" CLASS="statLink">
                            Contest Details
                        </A>
                    </TD>
                 </tr>
                 <%even=!even;%>
                 </rsc:iterator>
              </TABLE>
          </FORM>

    <div class="pagingBox">
        <% if (rsc2.croppedDataBefore() ||  rsc2.croppedDataAfter()) { %>
            <%=(rsc2.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
            | <%=(rsc2.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
        <% } else { %>
            &#160;
        <% } %>
    </div> 
    
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
