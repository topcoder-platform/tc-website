package com.topcoder.web.tc.view.reg.tag;

import javax.servlet.jsp.tagext.*;

public class GetPropertyTEI extends TagExtraInfo {
    public VariableInfo[] getVariableInfo(TagData data) {
        String idName = (String) data.getAttribute("id");
        if ((idName == null) || (idName.trim().length() == 0)) {
            return null;
        }

        String className = (String) data.getAttribute("type");
        if (className == null) {
            className = GetProperty.DEFAULT_TYPE;
        } else {
            try {
                Class.forName(className);
            } catch (ClassNotFoundException cnfe1) {
                className = GetProperty.DEFAULT_TYPE;
            }
        }

        VariableInfo[] vInfo = new VariableInfo[1];

        vInfo[0] = new VariableInfo(idName, className, true, VariableInfo.AT_BEGIN);

        return vInfo;
    }
}
