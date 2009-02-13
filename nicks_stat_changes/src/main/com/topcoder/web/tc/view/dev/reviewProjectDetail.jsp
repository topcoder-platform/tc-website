<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.ReviewBoardApplication,
                 java.util.List,
                 com.topcoder.web.tc.Constants"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer projectDetail= (ResultSetContainer)request.getAttribute("projectDetail");%>
<% List reviewerList= (List)request.getAttribute("reviewerList");%>
<head>
<title>Open Component Projects Available for Review</title>

<jsp:include page="../script.jsp" />

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
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>


            <table cellspacing="0" cellpadding="0" width="530">
                <tr>
                    <td class="bodyText" align="left">
                    <h2>Component Name: <rsc:item set="<%=projectDetail%>" name="component_name"/></h2>
                    </td>
                </tr>
            </table>
            
            <table cellspacing="0" width="530" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="3">Component Details</td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="left" width="50%">Catalog</td>
                    <td class="projectHeaders" align="center">Project Type</td>
                    <td class="projectHeaders" align="right" width="50%">Difficulty</td>
                </tr>
                <tr>
                    <td class="projectCells" align="left"><rsc:item set="<%=projectDetail%>" name="catalog"/></td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="phase_desc"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="level"/></td>
                </tr>
            </table>

            <br/>

            <table cellspacing="0" width="530" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="3">Timeline</td>
                </tr>
                <tr>
                    <td class="projectHeaders" width="50%">Phase</td>
                    <td class="projectHeaders" width="" align="center">Start</td>
                    <td class="projectHeaders" width="50%" align="right">End</td>
                <tr>
                    <td class="projectCells">Submission</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="submission_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="submission_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="projectCells">Screening</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="screening_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="screening_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="projectCells">Review</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="review_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="review_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="projectCells">Aggregation</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="aggregation_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="aggregation_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="projectCells">Aggregation Review</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="agg_review_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="agg_review_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="projectCells">Final Fixes</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="final_fix_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="final_fix_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="projectCells">Final Review</td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="final_review_start" format="MM.dd.yyyy"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="final_review_end" format="MM.dd.yyyy"/></td>
                </tr>
            </table>
            
            <br/>

            <table cellspacing="0" width="530" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="3">Positions Available</td>
                </tr>
                <tr>
                    <td class="projectHeaders" width="50%">Position</td>
                    <td class="projectHeaders" align="center">Reviewer</td>
                    <td class="projectHeaders" width="50%" align="right">Payment</td>
                <tr>
                <tc:listIterator id="reviewer" list="<%=reviewerList%>">
                    <tr>
                        <td class="projectCells">
                            <% if (((ReviewBoardApplication)reviewer).isPrimary()) { %>
                              Primary
                            <% } %>
                            <tc:beanWrite name="reviewer" property="reviewerType"/>
                        </td>
                        <td class="projectCells" align="center" nowrap>
                            <% if (((ReviewBoardApplication)reviewer).isSpotFilled()) { %>
                                <tc:beanWrite name="reviewer" property="handle"/>
                            <% } else { %>
                                <a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectReviewApply&<%=Constants.PROJECT_ID%>=<tc:beanWrite name="reviewer" property="projectId"/>&<%=Constants.PHASE_ID%>=<tc:beanWrite name="reviewer" property="phaseId"/>&<%=Constants.PRIMARY_FLAG%>=<%=((ReviewBoardApplication)reviewer).isPrimary()%>&<%=Constants.REVIEWER_TYPE_ID%>=<tc:beanWrite name="reviewer" property="reviewerTypeId"/>">Apply Now</a>**
                            <% } %>
                        </td>
                        <td class="projectCells" align="right">
                            $<tc:beanWrite name="reviewer" property="reviewPrice" format="#,###.00"/>
                        </td>
                    </tr>
                </tc:listIterator>
            </table>
            
            <br/>
            
            <table cellspacing="0" cellpadding="0" width="530" class="bodyText">
                <tr>
                    <td class="bodyText">
                    <p align="left">**By applying to review the component you are committing to the presented timeline.  Failure to meet the provided timeline may result in a suspension from the TopCoder Review Board.</p>
                    <p align="left"><a href="/tc?module=ViewReviewProjects">View all projects</a></p>
                    </td>
                </tr>
            </table>

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
