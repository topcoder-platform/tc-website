package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.tagext.*;


public class CommandInputIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {

        return new VariableInfo[]{

            new VariableInfo(data.getId(),

                    "com.topcoder.web.email.bean.CommandInput",

                    true,

                    VariableInfo.NESTED)

        };

    }

}