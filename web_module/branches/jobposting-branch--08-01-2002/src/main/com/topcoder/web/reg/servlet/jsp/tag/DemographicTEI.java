package com.topcoder.web.reg.servlet.jsp.tag;

import javax.servlet.jsp.tagext.*;

public class DemographicTEI
        extends TagExtraInfo {
    public VariableInfo[] getVariableInfo(TagData data) {
        VariableInfo[] variableInfo = new VariableInfo[]
        {
            new VariableInfo(Demographic.QUESTION_ID, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Demographic.QUESTION, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(Demographic.ANSWER, String.class.getName(), true, VariableInfo.NESTED)
        };

        return variableInfo;
    }
}
