package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;
import javax.servlet.jsp.tagext.TagData;

public class ProblemRatingInputTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(), String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(ProblemRatingInput.QUESTION, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(ProblemRatingInput.ID, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(ProblemRatingInput.COUNTER, String.class.getName(), true, VariableInfo.NESTED)
        };
    }

}
