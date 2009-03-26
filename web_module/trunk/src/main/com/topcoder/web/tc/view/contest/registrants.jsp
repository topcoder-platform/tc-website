<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.controller.request.development.Base"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<% int projectTypeId = ((Integer) request.getAttribute(Constants.PROJECT_TYPE_ID)).intValue();
	ResultSetContainer registrants = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get(Base.getRegistrantsCommandName(projectTypeId));
%>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Active Contests</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" var="CONCEPTUALIZATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" var="SPECIFICATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.COMPONENT_TESTING_PROJECT_TYPE%>" var="COMPONENT_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.APPLICATION_TESTING_PROJECT_TYPE%>" var="APPLICATION_TESTING_PROJECT_TYPE"/>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="des_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="dev_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="conceptualization_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="specification_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="assembly_compete"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="architecture_compete"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="app_testing_compete"/>
                    </jsp:include>
                </c:when>        
            </c:choose>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_design"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_development"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="conceptualization"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>   
                <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="specification"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>   
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="assembly"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="architecture"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="app_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
            </c:choose>


<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
<tr>
<td class="divider">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
        <tr><td class="tableTitle" colspan="2">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                      Design
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                      Development
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
                      Conceptualization
                </c:when> 
                <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
                      Specification
                </c:when> 
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                      Assembly
                </c:when>        
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                      Architecture
                </c:when>        
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                      Component Testing
                </c:when>        
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                      Application Testing
                </c:when>        
            </c:choose>
                 Contest Details</td></tr>
        <tr>
            <td class="cat" nowrap="nowrap">Contest:</td>
            <td class="stat" align="right" nowrap="nowrap">
                <rsc:item name="component_name" set="<%=registrants%>"/>
               	<rsc:item name="version_text" set="<%=registrants%>"/>
            </td>
        </tr>
        <c:if test="${pt == DESIGN_PROJECT_TYPE or pt == DEVELOPMENT_PROJECT_TYPE}">
	        <tr>
	            <td class="cat" nowrap="nowrap">Component:</td>
	            <td class="stat" align="right" nowrap="nowrap">
	            <% if (registrants.getIntItem(0, "viewable")==1) { %>
	            <a target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" set="<%=registrants%>"/>">
	                <rsc:item name="component_name" set="<%=registrants%>"/>
	            </a>
	                <% } else { %>
	                <rsc:item name="component_name" set="<%=registrants%>"/>
	                <% } %>
	            </td>
	        </tr>
        </c:if>
        <tr>
            <td class="cat" nowrap="nowrap" style="padding-top: 3px">Catalog:</td>
            <td class="stat" align="right" nowrap="nowrap" style="padding-top: 3px">
                <tc_tags:languageIcon catalogName = "<%=registrants.getStringItem(0, "catalog_name")%>" aolBrand="<%=(registrants.getItem(0, "aol_brand").getResultData() != null)%>"/> 
            </td>
        </tr>
    </table>
</td>
<td width="75%" valign="top">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
        <tr><td class="tableTitle" colspan="10">Registrants</td></tr>
        <tr>
            <td CLASS="tableHeader">Handle</td>
            <td CLASS="tableHeader" align="right">Rating</td>
            <td CLASS="tableHeader" align="right">Reliability</td>
            <td CLASS="tableHeader" align="center">Registration Date</td>
            <td CLASS="tableHeader" align="center">Submission Date</td>
         </tr>
          <rsc:iterator list="<%=registrants%>" id="resultRow">
          <tr>
              <td class="statDk">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Design'/>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Development'/>
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Conceptualization'/>
                </c:when>
                <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Specification'/>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Architecture'/>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Assembly'/>
                </c:when>
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='Application_Testing'/>
                </c:when>
            </c:choose>
              </td>
              <td class="statDk" align="right" nowrap="0">
                  <rsc:item name="rating" row="<%=resultRow%>" format="####" ifNull="not rated"/>
              </td>
              <td class="statDk" align="right" nowrap="0">
                  <rsc:item name="reliability" row="<%=resultRow%>" format="#.##%" ifNull="n/a"/>
              </td>
              <td class="statDk" align="center" nowrap="0">
                  <rsc:item name="inquiry_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York"/>
              </td>
              <td class="statDk" align="center" nowrap="0">
                  <rsc:item name="submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York" ifNull="-"/>
              </td>
          </tr>
          </rsc:iterator>
      </table>
      </td>
   </tr>
</table>

        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>