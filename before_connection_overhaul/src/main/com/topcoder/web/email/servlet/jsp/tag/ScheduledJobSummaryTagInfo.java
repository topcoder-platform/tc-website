package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.tagext.*;


public class ScheduledJobSummaryTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {

        return new VariableInfo[]{

            new VariableInfo(data.getId(),

                    "com.topcoder.web.email.bean.JobSummary",

                    true,

                    VariableInfo.NESTED)

        };

    }

}

