<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.resultSet.TCTimestampResult,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.model.SoftwareComponent,
                 com.topcoder.web.tc.model.ReviewBoardApplication,
                 java.sql.Timestamp"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<jsp:useBean id="prices" scope="request" class="java.util.List"/>
<jsp:useBean id="projectList" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"/>
<% boolean isWaiting = ((Boolean) request.getAttribute("waitingToReview")).booleanValue(); %>
<% String waitingUntil = (String) request.getAttribute("waitingUntil"); %>
<%--<% ResultSetContainer projectList = (ResultSetContainer)request.getAttribute("projectList");%>--%>

<%--<% ResultSetContainer tournamentProjectList = (ResultSetContainer)request.getAttribute("tournamentProjectList");%>--%>
<head>
<title>Project Review</title>

<jsp:include page="../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value="reviews"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="development"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Components"/>
        </jsp:include>

            <p><h2 align="left">Review opportunities currently available!</h2></p>

            <p align="left">In the table below you will be able to see which projects are available for review, the type of project, the current number of submissions on each, the review timeline for each, and the number of review positions available for each project. If you click on a component name you will be able to see all of the details associated with that component review.</p>
            <p align="left">If you are not currently on the TopCoder Architect or Development Review Boards you may send an email to <A href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</A> requesting permission to perform reviews. Please keep in mind only members that have completed component projects are eligible to join the TopCoder Review boards.</p>
            <p align="left">In order to sign up for a review position, click on the "details" link for any component with positions available, and then select "Apply Now" next to the position that you would like to commit to.</p>

            <br/>
            
            <% if (isWaiting) { %>
                <p align="center"><b>You may not apply for a new review until <%=waitingUntil%>.</b></p>
                <br/>
            <% } %>
            
<%--

            <table border="0" cellspacing="0" width="100%" class="formFrame">
                <tr>
                    <td class="tccc04SubNav" colspan="8">Open 2004 TopCoder Collegiate Challenge Components</td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="center">Catalog</td>
                    <td class="projectHeaders">Component Name</td>
                    <td class="projectHeaders" align="center">Phase</td>
                    <td class="projectHeaders" align="center">Submissions</td>
                    <td class="projectHeaders" align="center">Review<br/>Start</td>
                    <td class="projectHeaders" align="center">Review<br/>End</td>
                    <td class="projectHeaders" align="center">Positions<br/>Available</td>
                    <td class="projectHeaders" align="center">Details</td>
                </tr>

                <rsc:iterator list="<%=tournamentProjectList%>" id="resultRow">
                    <tr>
                        <% if ((resultRow.getLongItem("category_id"))==Constants.DOT_NET_CATALOG_ID) { %>
                            <td class="projectCells" align="center"><img src="/i/development/netSm.gif"/></td>
                        <% } else if ((resultRow.getLongItem("category_id"))==Constants.JAVA_CATALOG_ID) { %>
                            <td class="projectCells" align="center"><img src="/i/development/smJava.gif"/></td>
                        <% } else if ((resultRow.getLongItem("category_id"))==Constants.FLASH_CATALOG_ID) { %>
                            <td class="projectCells" align="center"><img src="/i/development/flashSm.gif"/></td>
                        <% } else { %>
                            <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="catalog"/></td>
                        <% } %>

                        <td class="projectCells"><rsc:item row="<%=resultRow%>" name="component_name"/></td>
                        <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="phase_desc"/></td>
                        <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="submission_count"/></td>
                        <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="review_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="review_end" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="available_spots"/></td>
                        <td class="projectCells" align="center"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ReviewProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>&<%=Constants.PHASE_ID%>=<rsc:item row="<%=resultRow%>" name="phase_id"/>">details</a></td>
                    </tr>
                </rsc:iterator>

           </table>

            <br/>
--%>

<%
    int devProjectCount = 0;
    int desProjectCount = 0;
%>
    <rsc:iterator list="<%=projectList%>" id="resultRow">
        <% if (resultRow.getIntItem("phase_id")==SoftwareComponent.DESIGN_PHASE) desProjectCount++;%>
        <% if (resultRow.getIntItem("phase_id")==SoftwareComponent.DEV_PHASE) devProjectCount++;%>
    </rsc:iterator>

<% if (desProjectCount>0) { %>

            <table border="0" cellspacing="0" width="100%" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="10">Design Components</td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="center">Catalog</td>
                    <td class="projectHeaders" width="100%">Component Name</td>
                    <td class="projectHeaders" align="center">Primary<br/>Reviewer<br/>Payment</td>
                    <td class="projectHeaders" align="center">Reviewer<br/>Payment</td>
                    <td class="projectHeaders" align="center">Submissions</td>
                    <td class="projectHeaders" align="center">Opens<br/>On</td>
                    <td class="projectHeaders" align="center">Review<br/>Start</td>
                    <td class="projectHeaders" align="center">Review<br/>End</td>
                    <td class="projectHeaders" align="center">Positions<br/>Available</td>
                    <td class="projectHeaders" align="left">Details</td>
                </tr>

<% int i = 0; %>
<rsc:iterator list="<%=projectList%>" id="resultRow">
 <% pageContext.setAttribute("price", prices.get(i)); %>
 <% if (resultRow.getIntItem("phase_id")==SoftwareComponent.DESIGN_PHASE) { %>
  <tr>
 <% if (resultRow.getLongItem("category_id")==Constants.DOT_NET_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/netSm.gif" border="0"/></td>
 <% } else if (resultRow.getLongItem("category_id")==Constants.CUSTOM_DOT_NET_CATALOG_ID) {%>
 <td class="projectCells" align="center"><img src="/i/development/smNetCustom.gif" border="0"/></td>
 <% } else if ((resultRow.getLongItem("category_id"))==Constants.JAVA_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/smJava.gif" border="0"/></td>
 <% } else if (resultRow.getLongItem("category_id")==Constants.CUSTOM_JAVA_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/smJavaCustom.gif" border="0"/></td>
 <% } else if ((resultRow.getLongItem("category_id"))==Constants.FLASH_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/flashSm.gif" border="0"/></td>
 <% } else if ((resultRow.getLongItem("category_id"))==Constants.APPLICATIONS_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/smApp.gif" border="0"/></td>
 <% } else { %>
  <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="catalog"/></td>
 <% } %>
 <% if ((resultRow.getLongItem("category_id"))==Constants.APPLICATIONS_CATALOG_ID) { %>
  <td class="projectCells"><rsc:item row="<%=resultRow%>" name="component_name"/> <rsc:item row="<%=resultRow%>" name="version"/></td>
 <% } else { %>
  <td class="projectCells"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>"><rsc:item row="<%=resultRow%>" name="component_name"/> <rsc:item row="<%=resultRow%>" name="version"/></a></td>
 <% } %>
 <td class="projectCells" align="right">$<tc:beanWrite name="price" property="PrimaryReviewPrice" format="#,###.00"/></td>
 <td class="projectCells" align="right">$<tc:beanWrite name="price" property="ReviewPrice" format="#,###.00"/></td>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="submission_passed_screening_count"/></td>
 <% if (((TCTimestampResult) resultRow.getItem("opens_on")).compareTo(new TCTimestampResult(new Timestamp(System.currentTimeMillis()))) == 1) { %>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="opens_on" format="MM.dd.yyyy"/></td>
 <% } else { %>
 <td class="projectCells" align="center"><i>open</i></td>
 <% } %>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="review_start" format="MM.dd.yyyy"/></td>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="review_end" format="MM.dd.yyyy"/></td>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="available_spots"/></td>
 <td class="projectCells" align="left" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ReviewProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>&<%=Constants.PHASE_ID%>=<rsc:item row="<%=resultRow%>" name="phase_id"/>">details</a>
 <% if (resultRow.getIntItem("price_changes")>0) { %> <img src="/i/development/up_arrow_gr.gif" border="0"/> <% } %></td>
 </tr>
 <% } %>
 <% i++;%>
</rsc:iterator>

                    <tr>
                        <td class="projectHeaders" align="left" nowrap="nowrap" colspan="10"><img src="/i/development/up_arrow_gr.gif" border="0"/>: the payment for reviewing this component has increased</td>
                    </tr>
           </table>


           <br/><br/>
<% } %>

<% if (devProjectCount>0) { %>

            <table border="0" cellspacing="0" width="100%" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="10">Development Components</td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="center">Catalog</td>
                    <td class="projectHeaders" width="100%">Component Name</td>
                    <td class="projectHeaders" align="center">Primary<br/>Reviewer<br/>Payment</td>
                    <td class="projectHeaders" align="center">Reviewer<br/>Payment</td>
                    <td class="projectHeaders" align="center">Submissions</td>
                    <td class="projectHeaders" align="center">Opens<br/>On</td>
                    <td class="projectHeaders" align="center">Review<br/>Start</td>
                    <td class="projectHeaders" align="center">Review<br/>End</td>
                    <td class="projectHeaders" align="center">Positions<br/>Available</td>
                    <td class="projectHeaders" align="left">Details</td>
                </tr>

<%-- reduce the data that has to be sent over the wire and speed this page up --%>
<% int j=0; %>
<rsc:iterator list="<%=projectList%>" id="resultRow">
 <% pageContext.setAttribute("price", prices.get(j));%>
 <% if (resultRow.getIntItem("phase_id")==SoftwareComponent.DEV_PHASE) { %>
 <tr>
 <% if ((resultRow.getLongItem("category_id"))==Constants.DOT_NET_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/netSm.gif" border="0"/></td>
 <% } else if (resultRow.getLongItem("category_id")==Constants.CUSTOM_DOT_NET_CATALOG_ID) {%>
 <td class="projectCells" align="center"><img src="/i/development/smNetCustom.gif" border="0"/></td>
 <% } else if ((resultRow.getLongItem("category_id"))==Constants.JAVA_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/smJava.gif" border="0"/></td>
 <% } else if (resultRow.getLongItem("category_id")==Constants.CUSTOM_JAVA_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/smJavaCustom.gif" border="0"/></td>
 <% } else if ((resultRow.getLongItem("category_id"))==Constants.FLASH_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/flashSm.gif" border="0"/></td>
 <% } else if ((resultRow.getLongItem("category_id"))==Constants.APPLICATIONS_CATALOG_ID) { %>
  <td class="projectCells" align="center"><img src="/i/development/smApp.gif" border="0"/></td>
 <% } else { %>
  <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="catalog"/></td>
 <% } %>
 <% if ((resultRow.getLongItem("category_id"))==Constants.APPLICATIONS_CATALOG_ID) { %>
  <td class="projectCells"><rsc:item row="<%=resultRow%>" name="component_name"/> <rsc:item row="<%=resultRow%>" name="version"/></td>
 <% } else { %>
  <td class="projectCells"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>"><rsc:item row="<%=resultRow%>" name="component_name"/> <rsc:item row="<%=resultRow%>" name="version"/></a></td>
 <% } %>
  <td class="projectCells" align="right">$<tc:beanWrite name="price" property="primaryReviewPrice" format="#,###.00"/></td>
  <td class="projectCells" align="right">$<tc:beanWrite name="price" property="reviewPrice" format="#,###.00"/></td>
  <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="submission_count"/></td>
 <% if (((TCTimestampResult) resultRow.getItem("opens_on")).compareTo(new TCTimestampResult(new Timestamp(System.currentTimeMillis()))) == 1) { %>
  <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="opens_on" format="MM.dd.yyyy"/></td>
 <% } else { %>
  <td class="projectCells" align="center"><i>open</i></td>
 <% } %>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="review_start" format="MM.dd.yyyy"/></td>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="review_end" format="MM.dd.yyyy"/></td>
 <td class="projectCells" align="center"><rsc:item row="<%=resultRow%>" name="available_spots"/></td>
 <td class="projectCells" align="left" nowrap="nowrap"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ReviewProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>&<%=Constants.PHASE_ID%>=<rsc:item row="<%=resultRow%>" name="phase_id"/>">details</a>
 <% if (resultRow.getIntItem("price_changes")>0) { %> <img src="/i/development/up_arrow_gr.gif" border="0"/> <% } %></td>
  </tr>
<% } %>
<% j++; %>
</rsc:iterator>

                    <tr>
                        <td class="projectHeaders" align="left" nowrap="nowrap" colspan="10"><img src="/i/development/up_arrow_gr.gif" border="0"/>: the payment for reviewing this component has increased</td>
                    </tr>
           </table>

<% } %>
<% if (desProjectCount+devProjectCount==0) { %>
            <br />
            <p>Sorry, there are currently no review positions available.</p>
            <br />
<% } else { %>
            <br/>
            <p>Review positions for new projects become open 24 hours after the project starts.</p>
            <p>Please note that custom components do not get added to the catalog and therefore do not have royalties.</p>
            <br/>
<% } %>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
