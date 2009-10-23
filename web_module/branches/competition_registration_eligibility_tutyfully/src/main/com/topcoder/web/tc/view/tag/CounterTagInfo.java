package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class CounterTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(), String.class.getName(), true, VariableInfo.NESTED)
        };
    }

}
