<%@page contentType="text/html"%>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

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
                    <tc-webtag:textInput name="handle"  size="15" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>First Name:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="firstname"  size="15" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Last Name:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="lastname"  size="15" maxlength="50"/>
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
        <br />
        <table border=0>
            <tr>
                <td colspan=3>
                    <b>Search Results Here</b>
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
            </tr>
        </table>
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
