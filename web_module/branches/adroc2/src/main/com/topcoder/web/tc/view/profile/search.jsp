<%@page contentType="text/html"%>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.model.PlacementProfileSearchResult,
                 java.util.List" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
List resultsList = (List)request.getAttribute("results");
%>
<html>
    <head><title>Placement Profile</title></head>
    <body>

        <form name=frmSearch method=post action="/tc">
        <input type="hidden" name="module" value="PlacementProfile"/>
        <table border=0>
            <tr>
                <td colspan=2>
                    <b>Search</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Handle:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="handle"  size="25" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>First Name:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="firstname"  size="25" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Last Name:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="lastname"  size="25" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="submit"/>
                </td>
            </tr>
        </table>
        <%if(resultsList != null) {%>
        <br />
        <table border=0>
            <tr>
                <td colspan=4>
                    <b>Search Results</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Handle</b>
                </td>
                <td>
                    <b>First Name</b>
                </td>
                <td>
                    <b>Last Name</b>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tc:placementProfileSearchResultIterator id="searchResult" list="<%=resultsList%>">
            <tr>
                <td>
                    <%=searchResult.getHandle()%>
                </td>
                <td>
                    <%=searchResult.getFirstName()%>
                </td>
                <td>
                    <%=searchResult.getLastName()%>
                </td>
                <td>
                    <a href="/tc?module=ProfileConfig&uid=<%=searchResult.getID()%>">configure</a>
                </td>
            </tr>
            </tc:placementProfileSearchResultIterator>
        </table>
        <% }%>
        <br />
        <table border=0>
            <tr>
                <td colspan=3>
                    <b>Recent Profiles</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Handle</b>
                </td>
                <td>
                    <b>Date</b>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
