package com.topcoder.web.email.servlet.jsp.tag;


import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;


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