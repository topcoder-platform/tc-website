<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.ReviewBoardApplication,
                 java.util.List"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer projectDetail= (ResultSetContainer)request.getAttribute("projectDetail");%>
<% List reviewerList= (List)request.getAttribute("reviewerList");%>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

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
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
            <img src="/i/clear.gif" alt="" width="1" height="15" border="0" /><br/>


            <table border="0" cellspacing="3" cellpadding="0" width="530">
                <tr>
                    <td class="bodyText">Component Name: <rsc:item set="<%=projectDetail%>" name="component_name"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Catalog: <rsc:item set="<%=projectDetail%>" name="catalog"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Phase: <rsc:item set="<%=projectDetail%>" name="phase_desc"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Level: <rsc:item set="<%=projectDetail%>" name="level"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Submission Start: <rsc:item set="<%=projectDetail%>" name="submission_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Submission End: <rsc:item set="<%=projectDetail%>" name="submission_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Screening Start: <rsc:item set="<%=projectDetail%>" name="screening_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Screening End: <rsc:item set="<%=projectDetail%>" name="screening_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Review Start: <rsc:item set="<%=projectDetail%>" name="review_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Review End: <rsc:item set="<%=projectDetail%>" name="review_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Aggregation Start: <rsc:item set="<%=projectDetail%>" name="aggregation_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Aggregation End: <rsc:item set="<%=projectDetail%>" name="aggregation_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Aggregation Review Start: <rsc:item set="<%=projectDetail%>" name="agg_review_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Aggregation Review End: <rsc:item set="<%=projectDetail%>" name="agg_review_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Final Fixes Start: <rsc:item set="<%=projectDetail%>" name="final_fix_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Final Fixes End: <rsc:item set="<%=projectDetail%>" name="final_fix_end" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Final Review Start: <rsc:item set="<%=projectDetail%>" name="final_review_start" format="MM.dd.yyyy"/></td>
                </tr>
                <tr>
                    <td class="bodyText">Final Review End: <rsc:item set="<%=projectDetail%>" name="final_review_end" format="MM.dd.yyyy"/></td>
                </tr>

            </table>


            <table border="0" cellspacing="3" cellpadding="0" width="530">
                <tc:listIterator id="reviewer" list="<%=reviewerList%>">
                    <tr>
                        <td class="bodyText">
                            <% if (((ReviewBoardApplication)reviewer).isPrimary()) { %>
                              Primary
                            <% } %>
                            <tc:beanWrite name="reviewer" property="reviewerType"/>
                        </td>
                        <td class="bodyText">
                            <% if (((ReviewBoardApplication)reviewer).isSpotFilled()) { %>
                                <tc:beanWrite name="reviewer" property="handle"/>
                            <% } else { %>
                                link here
                            <% } %>
                        </td>
                        <td class="bodyText">
                            $<tc:beanWrite name="reviewer" property="reviewPrice" format="#,###.00"/>
                        </td>
                    </tr>
                </tc:listIterator>
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
