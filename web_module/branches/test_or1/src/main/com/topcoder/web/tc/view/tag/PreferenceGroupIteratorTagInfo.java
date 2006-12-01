/*
 * PreferenceGroupIteratorTagInfo.java
 *
 * Created on October 1, 2004, 2:48 PM
 */

package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

/**
 *
 * @author  rfairfax
 */
public class PreferenceGroupIteratorTagInfo extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.tc.model.PreferenceGroup",
                    true,
                    VariableInfo.NESTED)
        };
    }

}
