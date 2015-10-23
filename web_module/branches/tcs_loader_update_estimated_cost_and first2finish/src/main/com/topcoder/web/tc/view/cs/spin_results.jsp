<%--
  - Author: TCSASSEMBLER 
  - Version: 1.0
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page to show the spin results page.
  - Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) changes: The first version.
  -
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tc-webtag" uri="tc-webtags.tld" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
    <!-- Start head -->
    <head>
        <meta charset="utf-8">

        <!-- CSS Styles -->
        <link href="/css/mashathon_bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="/css/coders.css" media="screen" rel="stylesheet" type="text/css" />

        <!-- Page title -->
        <title>API Mashathon Spin Results</title>
    </head>
    <!-- End head -->
  
    <!-- Start body -->
    <body>
        <div class="container">
            <div class="span6">
                <h1>#SuperAwesome Cloud API Mashathon Spin Results</h1>

                <p>For details on each API, see the <a href="http://<%=ApplicationServer.SERVER_NAME%>/tco13/overview/api-hackathon/">official TCO Hackathon page</a>.</p>
          
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th> Username </th>
                            <th> API </th>
                        </tr>
                    </thead>
                    <tbody>                        
                        <c:forEach var="api" items="${apis}" varStatus="i">
                            <tr>
                                <td>
                                    <c:set var="user_id" value="${users[i.index]}"/>
                                    <tc-webtag:handle coderId='${user_id}' />
                                </td>
                                <td>
                                    ${api}
                                </td>                                
                            </tr>                        
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <!-- End .spinner-wrap -->
    </body>
    <!-- End body -->
</html>
