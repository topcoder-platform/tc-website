<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.shared.problem.DataType,
                 com.topcoder.web.common.render.DataTypeRenderer,
                 com.topcoder.web.codinginterface.CodingInterfaceConstants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/codinginterface.tld" prefix="ci" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<tc-webtag:useBean id="prob" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.problem.Problem" toScope="page" property="problem"/>
<tc-webtag:useBean id="problemInfo" name="<%=Constants.PROBLEM%>" type="com.topcoder.web.codinginterface.techassess.model.ProblemInfo" toScope="page" />
<tc-webtag:useBean id="language" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.language.Language" toScope="page" property="language"/>


<html>
  <head>
    <title></title>
  </head>
  <body>
        <form name="frmTesting" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post">
          <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
          <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="<%=Constants.RP_TEST%>"/>
          <tc-webtag:hiddenInput name="<%=Constants.COMPONENT_ID%>" value="<%=String.valueOf(problemInfo.getComponentId())%>"/>
          <tc-webtag:hiddenInput name="<%=Constants.PROBLEM_TYPE_ID%>" value="<%=String.valueOf(problemInfo.getProblemTypeId())%>"/>
          <ci:argumentIterator problem="prob" language="language">
            <input type="hidden" name="<%=CodingInterfaceConstants.TEST_ARGUMENT+argumentIndex%>" value="" />
            <input type="hidden" name="<%=CodingInterfaceConstants.TEST_ARGUMENT_DIMENSION+argumentIndex%>" value="<%=argumentDimension%>" />
          </ci:argumentIterator>
          <input type="hidden" name="arrayArg" value=0 />
          <input type="hidden" name="arrayArgType" value="" />
          <input type="hidden" name="arrayDisplayArgType" value="" />
        <!-- this will be dynamically written out by the backend for this page -->
        <table border=0 width="100%">
            <ci:argumentIterator problem="prob" language="language">
                <input type="hidden" name="arg<%=argumentIndex%>input" value="" />
                <tr>
                    <td>
                        <%=StringUtils.htmlEncode(argument)%>
                    </td>
                    <td>
                        <%=inputElement%>
                    </td>
                </tr>
            </ci:argumentIterator>
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
            //written to page by backend
            <% DataType[] arguments = prob.getComponent(0).getParamTypes();%>
            var numArgs = <%=arguments.length%>;
            var displayTypes = new Array(<%=arguments.length%>);
            var argTypes = new Array(<%=arguments.length%>);
            <% for (int i=0; i<arguments.length; i++) { %>
                argTypes[<%=i%>] = "<%=arguments[i].getDescription()%>";
                displayTypes[<%=i%>] = "<%=new DataTypeRenderer(arguments[i]).toPlainText(language)%>";
            <% } %>

            var windowHandle = null;

            function launchArray(id) {
                if(windowHandle && !windowHandle.closed) {
                    windowHandle.focus();
                    return;
                }
                var w = 350;
                var h = 250;
                var left = (screen.availWidth - w) / 2;
                var top = (screen.availHeight - h) / 2;

                putValue("document.frmTesting", "arrayArg", id);
                putValue("document.frmTesting", "arrayArgType", argTypes[id]);
                putValue("document.frmTesting", "arrayDisplayArgType", displayTypes[id]);

                windowHandle = window.open("arrayEntry.jsp", "", "statusbars=no,menubar=no,status=no,toolbar=no,width=" + w + ",height=" + h + ",screenX=" + left + ",screenY=" + top);
            }

            function ok() {
                //validate
                for(var i = 0; i < numArgs; i++) {
                    var val = getValue("document.frmTesting", "arg" + i + "input");
                    switch(argTypes[i]) {
                        case "String[]":
                            break;
                        case "int":
                        case "long":
                            if(val == "" || isNaN(parseInt(val))) {
                                alert("Argument " + (i+1) + " must be a valid integer.");
                                doFocus("document.frmTesting", "arg" + i + "input");
                                return;
                            }
                            break;

                        case "double":
                            if(val == "" || isNaN(parseFloat(val))) {
                                alert("Argument " + (i+1) + " must be a valid double.");
                                doFocus("document.frmTesting", "arg" + i + "input");
                                return;
                            }
                            break;
                        case "boolean":
                            if(val.toLowerCase() != "true" && val.toLowerCase() != "false") {
                                alert("Argument " + (i+1) + " must be either true or false.");
                                doFocus("document.frmTesting", "arg" + i + "input");
                                return;
                            }
                            break;
                        default:
                            //assume string like object
                            break;
                    }
                }

                //put values in hidden fields
                for(var i = 0; i < numArgs; i++) {
                    switch(argTypes[i]) {
                        case "String[]":
                        case "int[]":
                        case "long[]":
                        case "double[]":
                            break;
                        case "int":
                        case "long":
                            putValue("window.document.forms[0]", "arg" + i, parseInt(getValue("document.frmTesting", "arg" + i + "input")));
                            break;
                        case "double":
                            putValue("window.document.forms[0]", "arg" + i, parseFloat(getValue("document.frmTesting", "arg" + i + "input")));
                            break;
                        case "boolean":
                            putValue("window.document.forms[0]", "arg" + i, getValue("document.frmTesting", "arg" + i + "input"));
                        default:
                            putValue("window.document.forms[0]", "arg" + i, getValue("document.frmTesting", "arg" + i + "input").toLowerCase());
                            break;
                    }
                }

                //window.close();
                //window.opener.focus();
                window.document.frmTesting.submit();
            }
            function cancel() {
                window.close();
                window.opener.focus();
            }
        </script>
        </form>
  </body>
</html>
