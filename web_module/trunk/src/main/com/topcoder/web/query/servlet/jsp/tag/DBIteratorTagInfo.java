package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class DBIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.query.common.DataBaseBean",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

