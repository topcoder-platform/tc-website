<%--
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 *
 * This JSP renders the list of users already registered to 2010 TCO event.
 *
 * Author TCSDEVELOPER
 * Version 1.0 (2010 TCO WebSite Release assembly v1.0)
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Registrants" area="overview" menu="registrants"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <script type="text/javascript">
       function next() {
         var myForm = document.registrantsForm;
         myForm.<%=DataAccessConstants.START_RANK%>.value= parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
         myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
         myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
         myForm.submit();
       }
       function previous() {
         var myForm = document.registrantsForm;
         myForm.<%=DataAccessConstants.START_RANK%>.value-=parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
         myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
         myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

         myForm.submit();
       }
     </script>
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list"));%>
                    <form name="registrantsForm" action='${sessionInfo.servletPath}' method="get">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Registrants"/>
                        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

                        <tco10:paginationLinks previousAvailable="<%=rsc.croppedDataBefore()%>"
                                               nextAvailable="<%=rsc.croppedDataAfter()%>"/>
                        <br /><br />

                        <table cellpadding="0" cellspacing="0" class="leaderboard"><!-- Start table list -->
                            <tr>
                                <th class="first"><span class="left"></span>Registrants: ${requestScope.numRegistrants}</th>
                                <!-- table left top corner -->
                                <th class="last"><span class="right"></span>&nbsp;</th>
                                <!-- table right top corner -->
                            </tr>
                            <tr>
                                <th class="first">
                                    <a href="/tco10?module=Registrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
                                </th>
                                <th class="last">Search:
                                    <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="16"
                                                         style="border: 1px solid #999999; color: #999999;"
                                                         onClick="this.style.color='#333333';" maxlength="100"/>
                                </th>
                            </tr>
                            <rsc:iterator list='<%=rsc%>' id="resultRow">
                                <tr>
                                    <td colspan="2">
                                        <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>'/>
                                    </td>
                                </tr>
                            </rsc:iterator>
                        </table>

                        <br/>
                        <tco10:paginationLinks previousAvailable="<%=rsc.croppedDataBefore()%>"
                                               nextAvailable="<%=rsc.croppedDataAfter()%>"/>
                        <br/><br/>
                        View &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                        &#160;at a time starting with &#160;
                        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                        <button name="nameSubmit" value="submit" type="submit">Go</button>
                    </form>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
