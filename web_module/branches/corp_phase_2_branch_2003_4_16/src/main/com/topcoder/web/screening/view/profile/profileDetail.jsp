<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="../errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp" />

</head>

<body>

<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Test Profile Details</h1>
                    </td>
                </tr>
            </table>

            <jsp:useBean id="profile" class="com.topcoder.web.screening.model.ProfileInfo" scope="request" />
            
            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Test Profile</td></tr>

                <tr>
                    <td class="testTableSubtitleOdd"><strong>Name:</strong></td>
                    <td class="testTableOdd"><jsp:getProperty name="profile" property="profileName" /></td>
                    <td class="errorTextOdd">&#160;</td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven"><strong>Problem Set:</strong></td>
                        <screen:resultSetRowIterator id="row" list="<%=profile.getProblemSetList()%>">
                        <% if(profile.isSelectedTestSetA(row.getItem("round_id").toString())) { %>
                            <td class="testTableEven"><screen:resultSetItem row="<%=row%>" name="name" /></td>
                        <% } %>
                        </screen:resultSetRowIterator>
                    <td class="errorTextEven">&#160;</td>
                </tr>
            </table>
            
             <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><td width="100%"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            </table>
 
            <table cellspacing="0" cellpadding="3" width="70%" class="testFrame">
                <tr><td class="testTableTitle" colspan="6">Test Set A</td></tr>
                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td width="40%" align="center" class="testFormHeader">Algorithmic Categories</td>
                    <td width="10" class="testFormHeader"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>
            
                <screen:listIterator id="testA" list="<%=profile.getTestSetAList()%>">
                <tr>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testA" property="roundId" />,<screen:beanWrite name="testA" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testA" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="difficultyDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testA" property="algorithmicCategoryList" /></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </screen:listIterator>

                <tr><td colspan="6"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            
                <tr><td class="testTableTitle" colspan="6">Test Set B</td></tr>

                <tr>
                    <td width="10" class="testFormHeader"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td width="20%" class="testFormHeader">Name</td>
                    <td width="20%" align="center" class="testFormHeader">Division</td>
                    <td width="20%" align="center" class="testFormHeader">Difficulty</td>
                    <td width="40%" align="center" class="testFormHeader">Algorithmic Categories</td>
                    <td width="10" class="testFormHeader"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                 </tr>

                <screen:listIterator id="testB" list="<%=profile.getTestSetBList()%>">
                <input type="hidden" name="testSetB" value="<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>" >
                <tr>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd"><a href="JavaScript:getProblemDetail('<screen:beanWrite name="testB" property="roundId" />,<screen:beanWrite name="testB" property="problemId"/>')" class="bodyText"><screen:beanWrite name="testB" property="problemName"/></a></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="divisionDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="difficultyDesc" /></td>
                    <td align="center" class="testTableOdd"><screen:beanWrite name="testB" property="algorithmicCategoryList" /></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                </screen:listIterator>

                <tr><td colspan="6"><img src="/i/clear.gif" width="1" height="20" alt="" border="0"></td></tr>

                <tr>
                    <td class="testTableTitle" colspan="6">Available Languages</td>
                </tr>

                <screen:resultSetRowIterator id="row" list="<%=profile.getLanguageList()%>">
                <% if(profile.hasLanguage(row.getItem("language_id").toString())) { %>
                    <input type="HIDDEN" name="language" value="<screen:resultSetItem row="<%=row%>" name="language_id" />">
                <tr>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                    <td class="testTableOdd" colspan="4"><screen:resultSetItem row="<%=row%>" name="language_name" /></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
                </tr>
                <% } %>
                </screen:resultSetRowIterator>

                <tr><td colspan="6"><img src="/i/clear.gif" width="1" height="10" alt="" border="0"></td></tr>
            </table>

            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../includes/foot.jsp" />

</body>
</html>
