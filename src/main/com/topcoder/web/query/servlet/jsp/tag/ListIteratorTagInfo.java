package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class SetIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "java.util.List",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

