package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.tagext.*;


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

