package com.topcoder.web.corp.view.testing.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class ProblemInfoIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.corp.model.ProblemInfo",
                    true,
                    VariableInfo.NESTED)
        };
    }

}
