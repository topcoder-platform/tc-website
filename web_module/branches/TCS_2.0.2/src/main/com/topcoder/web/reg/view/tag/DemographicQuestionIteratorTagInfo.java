package com.topcoder.web.reg.view.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class DemographicQuestionIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
                new VariableInfo(data.getId(),
                        "com.topcoder.web.common.model.DemographicAssignment",
                        true,
                        VariableInfo.NESTED)
        };
    }

}
