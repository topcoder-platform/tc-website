package com.topcoder.web.tces.servlet.jsp.tag;


import javax.servlet.jsp.tagext.*;


public class MapIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "java.util.Map",
                    true,
                    VariableInfo.NESTED)
        };
    }

}

