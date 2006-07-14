/*
 * PlacementProfileSearchResultInfo.java
 *
 * Created on December 9, 2004, 12:00 PM
 */

package com.topcoder.web.tc.view.tag;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;



/**
 *
 * @author rfairfax
 */
public class PlacementProfileSearchResultInfo  extends TagExtraInfo {
    
    public VariableInfo[] getVariableInfo(TagData data) {
        return new VariableInfo[]{
            new VariableInfo(data.getId(),
                    "com.topcoder.web.tc.model.PlacementProfileSearchResult",
                    true,
                    VariableInfo.NESTED)
        };
    } 
    
}
