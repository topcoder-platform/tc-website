package com.topcoder.web.tces.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class TrailIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.tces.bean.TrailItem",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

