package com.topcoder.web.tces.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class RowIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

