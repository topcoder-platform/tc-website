package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class ResultSetItemTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.TCResultItem",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

