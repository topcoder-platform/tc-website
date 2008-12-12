package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;


public class IteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {

        return new VariableInfo[]{

            new VariableInfo(data.getId(),

                    "java.lang.Object",

                    true,

                    VariableInfo.NESTED)

        };

    }

}