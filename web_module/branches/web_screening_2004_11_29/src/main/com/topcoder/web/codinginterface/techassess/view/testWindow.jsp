<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.StringUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/codinginterface.tld" prefix="ci" %>
<tc-webtag:useBean id="prob" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.problem.Problem" toScope="page" property="problem"/>
<tc-webtag:useBean id="problemInfo" name="<%=Constants.PROBLEM%>" type="com.topcoder.web.codinginterface.techassess.model.ProblemInfo" toScope="page" />
<tc-webtag:useBean id="language" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.language.Language" toScope="page" property="language"/>


<html>
  <head>
    <title></title>
  </head>
  <body>
        Debug boxes:
        <form name=frmTesting>
        <input type=hidden name=arrayArg value=0 />
        <input type=hidden name=arrayArgType value="" />
        <input type=hidden name=arrayDisplayArgType value="" />
        <!-- this will be dynamically written out by the backend for this page -->
        <table border=0 width="100%">
            <ci:argumentIterator problem="prob" language="language">
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
                    <input type=button value="OK" onclick="ok();" />
                    <input type=button value="Cancel" onclick="cancel();" />
                <td>
            </tr>
        </table>
        <script language="javascript" src="/js/techassess.js"></script>
        <script language="javascript">
            //written to page by backend
            var numArgs = 2;
            var argTypes = new Array();
            argTypes[0] = "String[]";
            argTypes[1] = "int";

            var displayTypes = new Array();
            displayTypes[0] = "vector&lt;string&gt;";
            displayTypes[1] = "int";

            //arg types are expected to be in java, arg display types can be anything

            //startup, load variables from the parent
            for(var i = 0; i < numArgs; i++) {
                switch(argTypes[i]) {
                    case "String[]":
                        if(getValue("window.opener.document.forms[0]", "arg" + i) != "") {
                            putValue("document.frmTesting", "arg" + i + "input", "modify");
                        }
                        break;
                    case "int":
                        putValue("document.frmTesting", "arg" + i + "input", getValue("window.opener.document.forms[0]", "arg" + i));
                        break;

                    default:
                        break;
                }
            }

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
                            putValue("window.opener.document.forms[0]", "arg" + i, parseInt(getValue("document.frmTesting", "arg" + i + "input")));
                            break;
                        case "double":
                            putValue("window.opener.document.forms[0]", "arg" + i, parseFloat(getValue("document.frmTesting", "arg" + i + "input")));
                            break;
                        case "boolean":
                            putValue("window.opener.document.forms[0]", "arg" + i, getValue("document.frmTesting", "arg" + i + "input"));
                        default:
                            putValue("window.opener.document.forms[0]", "arg" + i, getValue("document.frmTesting", "arg" + i + "input").toLowerCase());
                            break;
                    }
                }

                window.close();
                window.opener.focus();
            }
            function cancel() {
                window.close();
                window.opener.focus();
            }
        </script>
        </form>
  </body>
</html>
