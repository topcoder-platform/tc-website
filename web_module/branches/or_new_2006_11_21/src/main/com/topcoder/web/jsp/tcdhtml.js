function updateDivOrSpan(root, name, text) {
    if (root.getElementById) {
        if (root.getElementById(name))
            root.getElementById(name).innerHTML = text;
        //else alert("root " + root + " name " + name + " text + " + text);
    } else {
        //alert("FIX ME");
    }
}


function replace(string, text, by) {
    var strLength = string.length, txtLength = text.length;
    if ((strLength == 0) || (txtLength == 0)) return string;

    var i = string.indexOf(text);
    if ((!i) && (text != string.substring(0, txtLength))) return string;
    if (i == -1) return string;

    var newstr = string.substring(0, i) + by;

    if (i + txtLength < strLength)
        newstr += replace(string.substring(i + txtLength, strLength), text, by);

    return newstr;
}

function trim(sString) {
    return trimLeading(trimTrailing(sString));
}
function trimLeading(sString) {
    if (sString && sString != "") {
        var strchar = sString.charAt(0);
        while (strchar == ' ') {
            sString = sString.substr(1);
            strchar = sString.charAt(0);
        }
    }
    return sString;
}
function trimTrailing(sString) {
    if (sString && sString != "") {
        var strchar = sString.charAt(sString.length - 1);
        while (strchar == ' ') {
            sString = sString.substr(0, sString.length - 1);
            strchar = sString.charAt(sString.length - 1);
        }
    }
    return sString;
}

function getSelectedOption(root, name) {
    for (var i = getLength(root, name + ".options") - 1; i >= 0; i--) {
        if (getSelected(root, name, i)) {
            return getOption(root, name, i);
        }
    }
    return null;
}

function setSelectedOption(root, name, val) {
    for (var i = getLength(root, name + ".options") - 1; i >= 0; i--) {
        var opt =getOption(root, name, i);
        if (opt.value==val) {
            opt.selected=true;
        }
    }
}

function getSelected(root, name, option) {
    return getAttrib(root, name, "options[" + option + "].selected");
}

function getLength(root, name) {
    return getAttrib(root, name, "length");
}

function getOption(root, name, option) {
    return getAttrib(root, name, "options[" + option + "]");
}

function putOption(root, name, option, value) {
    putAttrib(root, name, "options[" + option + "]", value);
}

function putValue(root, name, newValue) {
    putAttrib(root, name, "value", newValue);
}

function putInnerHTML(root, name, newValue) {
    putAttrib(root, name, "innerHTML", newValue);
}

function putAttrib(root, name, attrib, newValue) {
    if (eval(root + ".getElementById")) {
        eval(root + ".getElementById('" + name + "')." + attrib + " = newValue;");
    } else if (eval(root + ".all")) {
        eval(root + ".all." + name + "." + attrib + " = newValue;");
    } else {
        eval(root + "." + name + "." + attrib + " = newValue;");
    }
}

function getValue(root, name) {
    return getAttrib(root, name, "value");
}

function getAttrib(root, name, attribute) {
    if (eval(root + ".getElementById")) {
        return eval(root + ".getElementById('" + name + "')." + attribute + ";");
    } else if (eval(root + ".all")) {
        return eval(root + ".all." + name + "." + attribute + ";");
    } else {
        return eval(root + "." + name + "." + attribute + ";");
    }
}

function doFocus(root, name) {
    if (eval(root + ".getElementById")) {
        eval(root + ".getElementById('" + name + "').focus();");
    } else if (eval(root + ".all")) {
        eval(root + ".all." + name + ".focus();");
    } else {

    }
}