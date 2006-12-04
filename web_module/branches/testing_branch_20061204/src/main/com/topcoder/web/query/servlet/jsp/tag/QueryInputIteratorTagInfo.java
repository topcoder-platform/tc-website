package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class QueryInputIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.query.bean.QueryInputBean",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

