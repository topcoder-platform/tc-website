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
        <form name=frmConfig method=post enctype="multipart/form-data" action="/tc">
        <input type="hidden" name="module" value="PDFGenerator"/>
        <input type="hidden" name="process" value="true" />
        <input type="hidden" name="uid" value="<jsp:getProperty name="configInfo" property="UserID"/>" />
        <b>Profile Config</b><br />
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
            <tr>
                <td>
                    <b>Presented By:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="presentedBy"  size="25" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Presented By Email:</b>
                </td>
                <td>
                    <tc-webtag:textInput name="presentedByEmail"  size="25" maxlength="50"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Presented To Logo:</b>
                </td>
                <td>
                    <input type="file" name="logo" />
                </td>
            </tr>
            <tr>
                <td valign=top>
                    <b>Skills</b>
                </td>
                <td>
                    <tc:listIterator id="skillGroup" list="<%=configInfo.getSkillGroups()%>">
                    <table border=0>
                        <tr>
                            <td colspan=2>
                                <b><%=skillGroup%></b>
                            </td>
                        </tr>
                            <tc:skillIterator id="skill" list="<%=configInfo.getSkills((String)skillGroup)%>">
                        <tr>
                            <td>
                                <input type="checkbox" name="skills" checked="checked" value="<%=skill.getID()%>" id="skill<%=skill.getID()%>" />
                            </td>
                            <td>
                                <label for="skill<%=skill.getID()%>"><%=skill.getText()%> - <%=configInfo.getSkillRating(skill)%></label>
                            </td>
                        </tr>
                            </tc:skillIterator>
                    </table>
                    </tc:listIterator>
                </td>
            </tr>
            <tr>
                <td valign=top>
                    <b>Sample Problem</b>
                </td>
                <td>
                    <tc-webtag:rscSelect name="component" list="<%=configInfo.getProblems()%>" fieldText="name" fieldValue="problem_id"/>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="submit" />
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
