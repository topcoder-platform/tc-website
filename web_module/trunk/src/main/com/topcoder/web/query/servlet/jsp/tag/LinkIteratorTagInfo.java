package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class LinkIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.query.common.Link",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

