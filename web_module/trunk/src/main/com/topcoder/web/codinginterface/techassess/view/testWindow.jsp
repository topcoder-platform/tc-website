<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.shared.problem.DataType,
                 com.topcoder.web.common.render.DataTypeRenderer,
                 com.topcoder.web.codinginterface.CodingInterfaceConstants,
                 com.topcoder.shared.problem.TestCase,
                 com.topcoder.shared.netCommon.screening.ScreeningConstants,
                 java.net.URLEncoder"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/codinginterface.tld" prefix="ci" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<tc-webtag:useBean id="prob" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.problem.Problem" toScope="page" property="problem"/>
<tc-webtag:useBean id="problemInfo" name="<%=Constants.PROBLEM%>" type="com.topcoder.web.codinginterface.techassess.model.ProblemInfo" toScope="page" />
<tc-webtag:useBean id="language" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.language.Language" toScope="page" property="language"/>
<% TestCase[] testCases = prob.getPrimaryComponent().getTestCases();%>


<html>
  <head>
    <title>Test Arguments</title>
   <link type="text/css" rel="stylesheet" href="/css/screening.css" >
  </head>
  <body>
        <form name="frmTesting" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post">
          <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
          <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="<%=Constants.RP_TEST%>"/>
          <tc-webtag:hiddenInput name="<%=Constants.COMPONENT_ID%>" value="<%=String.valueOf(problemInfo.getComponentId())%>"/>
          <tc-webtag:hiddenInput name="<%=Constants.PROBLEM_TYPE_ID%>" value="<%=String.valueOf(problemInfo.getProblemTypeId())%>"/>
          <ci:argumentIterator problem="<%=prob%>" language="language">
            <input type="hidden" name="<%=CodingInterfaceConstants.TEST_ARGUMENT+argumentIndex%>" value="" />
            <input type="hidden" name="<%=CodingInterfaceConstants.TEST_ARGUMENT_DIMENSION+argumentIndex%>" value="<%=argumentDimension%>" />
          </ci:argumentIterator>
          <%--these three fields are for communication to the arrayEntry page--%>
          <input type="hidden" name="arrayArg" value=0 />
          <input type="hidden" name="arrayArgType" value="" />
          <input type="hidden" name="arrayDisplayArgType" value="" />
        <table border=0 width="100%">
               <tr><td class="testWinTitle" colspan="2">Test Arguments</td></tr>
            <ci:argumentIterator problem="<%=prob%>" language="language">
                <tr>
                    <td width="50%" align="right">
                        <%=StringUtils.htmlEncode(argument)%>
                    </td>
                    <td width="50%">
                        <% if (Integer.parseInt(argumentDimension)>0) { %>
                          <a href="Javascript:launchArray(<%=argumentIndex%>);"><img id="<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT + argumentIndex%>" src="/i/corp/screening/buttonCreate.gif" alt="Create"/></a>
                        <% } else { %>
                          <input type="text" name="<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT + argumentIndex%>" size="20" maxlength="50" value=""/>
                        <% }%>
                    </td>
                </tr>
            </ci:argumentIterator>



            <tr><td colspan="2" align="center">
                        <select name="testcase" size="1">
                          <option value="#" selected> Select Example: </option>
                          <%
                                for (int i=0; i<testCases.length; i++) {
                                    %> <option onClick="Javascript:setExample(<%=i%>);">Example <%=i%></option><%

                                }
                            %>
                        </select>
            </td></tr>
<%--

            <tr><td colspan="2" align="center">
               <a href="javascript:show();">show me</a>
            </td></tr>
--%>

            <tr><td colspan="2"></td></tr>
            <tr>
                <td colspan="2" align=center>
                    <a href="Javascript:ok();"><img src="/i/corp/screening/buttonOK.gif" alt="OK"/></a>
                    <a href="Javascript:cancel();"><img src="/i/corp/screening/buttonCancel.gif" alt="Cancel"/></a>
                <td>
            </tr>
        </table>
        <script language="javascript" src="/js/techassess.js"></script>
        <script language="javascript">
            <% DataType[] arguments = prob.getComponent(0).getParamTypes();%>
            var numArgs = <%=arguments.length%>;
            var displayTypes = new Array(<%=arguments.length%>);
            var argTypes = new Array(<%=arguments.length%>);
            <% for (int i=0; i<arguments.length; i++) { %>
                argTypes[<%=i%>] = "<%=arguments[i].getDescription()%>";
                displayTypes[<%=i%>] = "<%=new DataTypeRenderer(arguments[i]).toPlainText(language)%>";
            <% } %>

            var windowHandle = null;

            <%--startup, load variables from the parent--%>

            for(var i = 0; i < numArgs; i++) {
                if (argTypes[i].indexOf('[]')>0) {
                    if(getValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i) != "") {
                        setModify("<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i);
                        putValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, getValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i));
                    }
                } else {
                    putValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i,getValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i));
                }
            }

<%--
            function show() {
                  <ci:argumentIterator problem="<%=prob%>" language="language">
                    alert(document.frmTesting.<%=CodingInterfaceConstants.TEST_ARGUMENT+argumentIndex%>.value);
                  </ci:argumentIterator>
            }
--%>


            function setExample(idx) {
              switch(idx) {
                <% for (int i=0; i<testCases.length; i++) { %>
                    case <%=i%>:
                    <%  String[] args = testCases[i].getInput();%>
                        <%--we're using the argument iterator to make it easier to get the dimension.
                        if for some reason the test case and the problem arguments don't line up, we'll have a problem--%>
                        <ci:argumentIterator problem="<%=prob%>" language="language">
                            <%-- set the value in this form, then set the value in the parent
                                 because that's where the array input screen reads it from
                                 and finally mark it as being modified --%>
                            <% int j= Integer.parseInt(argumentIndex); %>
                            <% String arg = args[j].startsWith("{")&&args[j].endsWith("}")?args[j].substring(1, args[j].length()-1):args[j];%>
<%--
                            first we replacing the +'s that java puts in for spaces with spaces, the javascript decoder doesn't do this.
                            this is safe because java encodes +'s, so they won't be in the string unless they were spaces.  then we remove newlines
--%>
                            document.frmTesting.<%=CodingInterfaceConstants.TEST_ARGUMENT+j%>.value=decodeURIComponent("<%=URLEncoder.encode(arg, "UTF-8")%>".replace(/\+/g, " ")).replace(/\n/g,"");
                            putValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT+j%>", decodeURIComponent("<%=URLEncoder.encode(arg, "UTF-8")%>".replace(/\+/g, " ")).replace(/\n/g,""));
                            <% if (argumentDimension.equals("0")) { %>
                                document.frmTesting.<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT+j%>.value=<%=arg%>;
                            <% } %>
                            setModify("<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT+ j%>");
                        </ci:argumentIterator>
                        break;
                <% } %>
                    default:
                        break;
              }
            }

            function setModify(name) {
                putAttrib("document.frmTesting", name, "src", "/i/corp/screening/buttonModify.gif");
            }

            function launchArray(id) {
                if(windowHandle && !windowHandle.closed) {
                    windowHandle.focus();
                    return;
                }
                var w = 350;
                var h = 300;
                var left = (screen.availWidth - w) / 2;
                var top = (screen.availHeight - h) / 2;

                putValue("document.frmTesting", "arrayArg", id);
                putValue("document.frmTesting", "arrayArgType", argTypes[id]);
                putValue("document.frmTesting", "arrayDisplayArgType", displayTypes[id]);

                windowHandle = window.open("arrayEntry.jsp", "", "statusbars=no,menubar=no,scrollbars=yes,resizable=yes,status=no,toolbar=no,width=" + w + ",height=" + h + ",screenX=" + left + ",screenY=" + top);
            }

            function ok() {
                <%--validate--%>
                for(var i = 0; i < numArgs; i++) {
                    var val = getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i);
                    switch(argTypes[i]) {
                        case "String[]":
                            break;
                        case "int":
                        case "long":
                            if(val == "" || isNaN(parseInt(val))) {
                                alert("Argument " + (i+1) + " must be a valid integer.");
                                doFocus("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i);
                                return;
                            }
                            break;

                        case "double":
                            if(val == "" || isNaN(parseFloat(val))) {
                                alert("Argument " + (i+1) + " must be a valid double.");
                                doFocus("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i);
                                return;
                            }
                            break;
                        case "boolean":
                            if(val.toLowerCase() != "true" && val.toLowerCase() != "false") {
                                alert("Argument " + (i+1) + " must be either true or false.");
                                doFocus("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i);
                                return;
                            }
                            break;
                        default:
                            //assume string like object
                            break;
                    }
                }

<%--
                put values in hidden fields
                we put it in the parent so that they can close the testing window and still have the values around.
--%>
                for(var i = 0; i < numArgs; i++) {
                        switch(argTypes[i]) {
                            case "String[]":
                            case "int[]":
                            case "long[]":
                            case "double[]":
                                break;
                            case "int":
                            case "long":
                                putValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, parseInt(getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i)));
                                putValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, parseInt(getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i)));
                                break;
                            case "double":
                                putValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, parseFloat(getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i)));
                                putValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, parseFloat(getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i)));
                                break;
                            case "boolean":
                                putValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i));
                                putValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i));
                                break;
                            default:
                                putValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i));
                                putValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + i, getValue("document.frmTesting", "<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + i));
                                break;
                        }
                }

<%--
                window.close();
                window.opener.focus();
--%>
                window.document.frmTesting.submit();
            }
            function cancel() {
                window.close();
                window.opener.focus();
            }
            function submitEnter(e) {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if (keycode == 13) {
                    window.document.frmTesting.submit();
                    return false;
                } else return true;
            }
        </script>
        </form>
  </body>
</html>
