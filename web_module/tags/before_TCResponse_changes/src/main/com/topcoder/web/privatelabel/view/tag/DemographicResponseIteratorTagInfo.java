package com.topcoder.web.privatelabel.view.tag;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;
import javax.servlet.jsp.tagext.TagData;

public class DemographicResponseIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.privatelabel.model.DemographicResponse",
                    true,
                    VariableInfo.NESTED)
        };
    }

}


