package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;
import javax.servlet.jsp.tagext.TagData;

public class ProblemRatingDistributionInfo extends TagExtraInfo {

        public VariableInfo[] getVariableInfo(TagData data) {
            return new VariableInfo[]{
                new VariableInfo(data.getId(),
                        "com.topcoder.web.tc.model.ProblemRatingDistribution",
                        true,
                        VariableInfo.NESTED)
            };
        }

    }


