package com.topcoder.web.common.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class ListIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    Object.class.getName(),
                    true,
                    VariableInfo.NESTED)
        };
    }
    //                    data.getAttribute(data.getId()).getClass().getName(),

}

