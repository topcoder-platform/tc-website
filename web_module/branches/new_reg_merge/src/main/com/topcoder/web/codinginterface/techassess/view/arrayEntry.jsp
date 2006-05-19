<%@ page import="com.topcoder.web.codinginterface.CodingInterfaceConstants"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>Test Arguments</title>
   <link type="text/css" rel="stylesheet" href="/css/screening.css" >
  </head>
  <body>
        <form name="frmArray" onsubmit="return false;">
        <table border=0 width="100%">
            <tr><td class="testWinTitle">Test Arguments</td></tr>
            <tr>
                <td>
                    <span id=countSpan></span>
                </td>
            </tr>
            <tr>
                <td>
                    <select multiple=multiple id=listBox size=5 style="width:96%">
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                     <%--autocomplete = off just to stop a javascript bug in mozilla/firefox--%>
                    <input type=text id="inputText" autocomplete="OFF" style="width:96%" onKeyPress="submitEnter(event)"/>
                </td>
            </tr>
            <tr>
                <td align=center>
                    <input type=button id="moveUpButton" value="^" onclick="moveUp();" />
                    <input type=button id="moveDownButton" value="v" onclick="moveDown();"/>
                    <input type=button id="addSingleButton" value="+" onclick="addSingle();" />
                    <input type=button id="addPlusPlusButton" value="++" onclick="addPlusPlus();" />
                    <input type=button id="deleteButton" value="-" onclick="doDelete();"/>
                    <input type=button id="addBracketsButton" value="{}" onclick="addBrackets();" />
                    <input type=button id="clearButton" value="C" onclick="clearList();" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align=center>
                    <a href="Javascript:ok();"><img src="/i/corp/screening/buttonOK.gif" alt="OK"/></a>
                    <a href="Javascript:cancel();"><img src="/i/corp/screening/buttonCancel.gif" alt="Cancel"/></a>
                </td>
            </tr>
        </table>
        <!-- this will be dynamically written out by the backend for this page -->
        <script language="javascript" src="/js/techassess.js"></script>
        <script language="javascript">
            var arg = 0;
            var argType = "";
            var displayArgType = "";

            //load arg / arg type
            arg = getValue("window.opener.document.frmTesting", "arrayArg");
            argType = getValue("window.opener.document.frmTesting", "arrayArgType");
            displayArgType = getValue("window.opener.document.frmTesting", "arrayDisplayArgType");

            //load data
            var tmpVal = getValue("window.opener.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + arg);
            document.frmArray.inputText.value = tmpVal;
            addBrackets();

            //updateCountSpan();

            function ok() {
                //build string from array
                var arr = "";

                for(var i = 0; i < getLength("document.frmArray", "listBox.options") ; i++) {
                    var val = getOption("document.frmArray", "listBox", i).text;
                    val = replace(val, "\\", "\\\\");
                    val = replace(val, "\"", "\\\"");
                    arr = arr + "\"" + val + "\",";
                }

                arr = arr.substring(0, arr.length-1);

                putValue("window.opener.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + arg, arr);
                putValue("window.opener.document.forms[0]", "<%=CodingInterfaceConstants.TEST_ARGUMENT%>" + arg, arr);
                window.opener.setModify("<%=CodingInterfaceConstants.TEST_ARGUMENT_INPUT%>" + arg);

                window.close();
                window.opener.focus();
            }

            function cancel() {
                window.close();
                window.opener.focus();
            }

            function addBrackets() {
                var val = getValue("document.frmArray", "inputText");
                val = trim(val);

                if (val.length > 0 && val.charAt(0) == '{') val = val.substr(1);
                if (val.length > 0 && val.charAt(val.length - 1) == '}') val = val.substring(0, val.length - 1);

                if(val.length != 0)
                {
                    var state = "S";
                    var ignored = false;
                    var buf = "";

                    for (var i = 0; i < val.length; i++) {
                        var ch = val.charAt(i);
                        switch (state) {
                        case "E":
                            switch (ch) {
                            case '\\':
                                buf = buf + '\\';
                                break;
                            case '"':
                                buf = buf + '"';
                                break;
                            default:
                                buf = buf + '\\';
                                buf = buf + ch;
                            }
                            state = "I";
                            break;
                        case "I":
                            switch (ch) {
                            case '\\':
                                state = "E";
                                break;
                            case '"':
                                state = "S";

                                if (buf.length > 50) {
                                    ignored = true;
                                    continue;
                                }

                                if(validateArg(buf)) {
                                    //valid, now add
                                    putOption("document.frmArray", "listBox", getLength("document.frmArray", "listBox.options"), new Option(buf));
                                } else {
                                    return;
                                }

                                buf = "";
                                break;
                            default:
                                buf = buf + ch;
                                break;
                            }
                            break;
                        case "S":
                            if (trim(ch) == "") {
                                if (buf.length > 0) {

                                    if (buf.length > 50) {
                                        ignored = true;
                                        continue;
                                    }
                                    if(validateArg(buf)) {
                                        //valid, now add
                                        putOption("document.frmArray", "listBox", getLength("document.frmArray", "listBox.options"), new Option(buf));
                                    } else {
                                        return;
                                    }

                                    buf = "";
                                }
                                continue;
                            }
                            switch (ch) {
                            case '"':
                                if (buf.length > 0) {
                                    buf = buf + '"';
                                } else {
                                    state = "I";
                                }
                                break;
                            case ',':
                                if (buf.length > 0 || (i == 0) || (i > 0 && val.charAt(i - 1) == ',')) {

                                    if (buf.length > 50) {
                                        ignored = true;
                                        continue;
                                    }
                                    if(validateArg(buf)) {
                                        //valid, now add
                                        putOption("document.frmArray", "listBox", getLength("document.frmArray", "listBox.options"), new Option(buf));
                                    } else {
                                        return;
                                    }

                                    buf = "";
                                }
                                break;
                            default:
                                buf = buf + ch;
                            }
                        }
                    }
                    if (buf.length > 0 || val.charAt(val.length - 1) == ',') {
                        buf = trim(buf);
                        if (buf.length > 50) {
                            ignored = true;
                        } else {
                            if(validateArg(buf)) {
                                //valid, now add
                                putOption("document.frmArray", "listBox", getLength("document.frmArray", "listBox.options"), new Option(buf));
                            } else {
                                return;
                            }
                        }

                        buf = "";
                    }
                    if (ignored) {
                        alert("One or more entries were ignored because they were either empty (blank) or had a size greater than 50..");
                    }
                }

                clearInput();
                updateCountSpan();
                document.frmArray.inputText.focus();
            }

            function addPlusPlus() {
                var val = getValue("document.frmArray", "inputText").split(",");
                for(var i = 0; i < val.length; i++) {
                    if(validateArg(val[i])) {
                        //valid, now add
                        putOption("document.frmArray", "listBox", getLength("document.frmArray", "listBox.options"), new Option(val[i]));
                    } else {
                        return;
                    }
                }

                clearInput();
                updateCountSpan();
                document.frmArray.inputText.focus();

            }

            function moveDown() {
                //special case: if index n is selected, must wait for break
                var foundBreak = true;
                for(var i = getLength("document.frmArray", "listBox.options") - 1; i >= 0; i--) {
                    if(getSelected("document.frmArray", "listBox", i)) {
                        if(i == (getLength("document.frmArray", "listBox.options")-1)) {
                            //special case, look for break;
                            foundBreak = false;
                        } else {
                            if(foundBreak) {
                                //move up
                                var temp = getOption("document.frmArray", "listBox", i+1).text;
                                var tempSelected = getOption("document.frmArray", "listBox", i+1).selected;

                                var newVal = getOption("document.frmArray", "listBox", i).text;
                                var newSelected = getOption("document.frmArray", "listBox", i).selected;

                                putOption("document.frmArray", "listBox", i+1, new Option(newVal, newVal, newSelected,newSelected));
                                putOption("document.frmArray", "listBox", i, new Option(temp, temp, tempSelected,tempSelected));
                            }
                        }
                    } else {
                        foundBreak = true;
                    }
                }

            }

            function moveUp() {
                //special case: if index 0 is selected, must wait for break
                var foundBreak = true;
                for(var i = 0; i < getLength("document.frmArray", "listBox.options"); i++) {
                    if(getSelected("document.frmArray", "listBox", i)) {
                        if(i == 0) {
                            //special case, look for break;
                            foundBreak = false;
                        } else {
                            if(foundBreak) {
                                //move up
                                var temp = getOption("document.frmArray", "listBox", i-1).text;
                                var tempSelected = getOption("document.frmArray", "listBox", i-1).selected;

                                var newVal = getOption("document.frmArray", "listBox", i).text;
                                var newSelected = getOption("document.frmArray", "listBox", i).selected;

                                putOption("document.frmArray", "listBox", i-1, new Option(newVal, newVal, newSelected,newSelected));
                                putOption("document.frmArray", "listBox", i, new Option(temp, temp, tempSelected,tempSelected));
                            }
                        }
                    } else {
                        foundBreak = true;
                    }
                }

            }

            function doDelete() {
                var i = 0;
                while(i < getLength("document.frmArray", "listBox.options")) {
                    if(getSelected("document.frmArray", "listBox", i)) {
                        putOption("document.frmArray", "listBox", i, null);
                    } else {
                        i++;
                    }
                }

                updateCountSpan();
                document.frmArray.inputText.focus();
            }

            function clearList() {
                for(var i = getLength("document.frmArray", "listBox.options") -1 ; i >= 0; i--) {
                    putOption("document.frmArray", "listBox", i, null);
                }
                clearInput();
                updateCountSpan();
                document.frmArray.inputText.focus();
            }

            function addSingle() {
                var val = getValue("document.frmArray", "inputText");
                if(validateArg(val)) {
                    //valid, now add
                    putOption("document.frmArray", "listBox", getLength("document.frmArray", "listBox.options"), new Option(val));
                    clearInput();
                    updateCountSpan();
                }
                document.frmArray.inputText.focus();
            }

            function clearInput() {
                putValue("document.frmArray", "inputText", "");
            }

            function validateArg(val) {
                switch(argType) {
                    case "String[]":
                        //anything is valid
                        break;
                    case "int[]":
                    case "long[]":
                        if(val == "" || isNaN(parseInt(val))) {
                            alert("Argument " + val + " is not a valid integer.");
                            return false;
                        }
                        break;
                    case "double[]":
                        if(val == "" || isNaN(parseFloat(val))) {
                            alert("Argument " + val + " is not a valid double.");
                            return false;
                        }
                        break;
                    default:
                        //assume string like object
                        break;
                }

                return true;
            }

            function updateCountSpan() {
                putInnerHTML("document", "countSpan", displayArgType + " -- " + getLength("document.frmArray", "listBox.options"));
            }

            function submitEnter(e) {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if (keycode == 13) {
                    addSingle();
                    return false;
                } else return true;
            }

        </script>
        </form>
  </body>
</html>
