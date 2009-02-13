<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@ page language="java" %>
          
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<html>
<head>
    <title>TopCoder Statistics</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="../script.jsp" />
 
</head>

<body>

        <jsp:include page="../top.jsp" >
            <jsp:param name="level1" value="long"/>
        </jsp:include>
     

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="../includes/global_left.jsp">
                        <jsp:param name="node" value="top_rated_long"/>
                    </jsp:include>
                </td>
                <!-- Left Column Ends -->

                <!-- Center Column Begins -->
                <td class="statTableSpacer" width="100%" valign="top">

        <div class="fixedWidthBody">

                <jsp:include page="../page_title.jsp" >
                    <jsp:param name="image" value="statistics_w"/>
                    <jsp:param name="title" value="Top Ranked Marathon Match Schools"/>
                </jsp:include>

                <div align="center">
                     <a href="${sessionInfo.servletPath}?module=CoderRank" class="bcLink">Competitors</a>
                     | Schools
                     | <a href="${sessionInfo.servletPath}?module=CountryRank" class="bcLink">Countries</a>
                </div>
                <br/>
               <b>Note:</b> provisionally, a school must have just 5 members to be ranked, but after more people compete, the criteria will be raised to 10 members in order to agree with other ranks. <br/>

            <table class="stat" cellpadding="0" cellspacing="0" width="510" border="0">
               <tr><td class="title" colspan="5">Top Ranked Marathon Match Schools</td></tr>
               <tr>
                  <td class="headerC">Rank</td>
                  <td class="header">Name</td>
                  <td class="header">School Country</td>
                  <td class="headerC">Member Count</td>
                  <td class="headerC">Rating</td>
               </tr>
               <c:forEach items="${list}" var="row" varStatus="status">
                   <tr class='${status.index % 2 == 1? "dark" : "light" }'>
                        <td class="valueC">${row.map['rank']}</td>
                        <td class="value">
                            <a href="${sessionInfo.servletPath}?module=CoderRank&amp;scid=${row.map['school_id']}">                        
                                     ${row.map['name']}
                             </a>
                           </td>     
                        <td class="value">
                            <a href="${sessionInfo.servletPath}?module=CoderRank&amp;cc=${row.map['country_code']}">
                                ${row.map['country_name']}
                            </a>
                        </td>                        
                                          
                        <td class="valueC">${row.map['rated_count']}</td>
                        <td class="valueC"><fmt:formatNumber value="${row.map['avg_rating']}" pattern="#####0.00"/></td>
                    </tr>   
               </c:forEach>   
            </table>
            </div>
                </td>


         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt=""/></td>
                <!-- Gutter Ends -->
            </tr>
        </table>

        <jsp:include page="../foot.jsp" />

    </body>

</html>