package com.topcoder.web.privatelabel.view.tag;

import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;
import javax.servlet.jsp.tagext.TagData;

public class DemographicAnswerIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.privatelabel.model.DemographicAnswer",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

