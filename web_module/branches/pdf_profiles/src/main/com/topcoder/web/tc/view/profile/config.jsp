<%@page contentType="text/html"%>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.model.PlacementProfileSearchResult,
                 java.util.List" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                    handle
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
