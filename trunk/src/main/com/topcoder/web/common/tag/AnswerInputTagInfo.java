package com.topcoder.web.common.tag;

import com.topcoder.web.common.tag.AnswerInput;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;


public class AnswerInputTagInfo
        extends TagExtraInfo {
    public VariableInfo[] getVariableInfo(TagData data) {
        VariableInfo[] variableInfo = new VariableInfo[]
        {
            new VariableInfo(data.getId(), String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(AnswerInput.ANSWER_TEXT, String.class.getName(), true, VariableInfo.NESTED)
        };
        return variableInfo;
    }
}

