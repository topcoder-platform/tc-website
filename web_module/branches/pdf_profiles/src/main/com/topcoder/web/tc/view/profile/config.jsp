<%@page contentType="text/html"%>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.model.PlacementProfileSearchResult,
                 java.util.List" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="configInfo" class="com.topcoder.web.tc.model.PlacementConfigInfo" scope="request" />
<html>
    <head><title>Placement Profile Config</title></head>
    <body>
        <form name=frmConfig method=post action="/tc">
        <input type="hidden" name="module" value=""/>
        <table border=0>
            <tr>
                <td>
                    <b>Handle:</b>
                </td>
                <td>
                    <jsp:getProperty name="configInfo" property="Handle"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Name:</b>
                </td>
                <td>
                    <jsp:getProperty name="configInfo" property="Name"/>
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
