package com.topcoder.web.tc.view.reg.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

public class DemographicTEI
        extends TagExtraInfo {
    public VariableInfo[] getVariableInfo(TagData data) {
        VariableInfo[] variableInfo = new VariableInfo[]
        {
            new VariableInfo(Demographic.QUESTION_ID, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Demographic.QUESTION, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Demographic.ANSWER, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Demographic.DESCRIPTION, String.class.getName(), true, VariableInfo.NESTED)
        };

        return variableInfo;
    }
}
