/*
 * Preferences.java
 *
 * Created on October 1, 2004, 1:49 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import com.topcoder.web.tc.model.PreferenceGroup;

import java.util.*;
/**
 *
 * @author  rfairfax
 */
public class Preferences extends ContractingBase {
    protected void contractingProcessing() throws TCWebException {
        //load preference groups
        ArrayList groups = new ArrayList();
        
        //TESTING CODE
        PreferenceGroup grp = new PreferenceGroup();
        
        grp.setName("test 2");
        grp.setSortOrder(2);
        
        groups.add(grp);
        
        grp = new PreferenceGroup();
        
        grp.setName("test 1");
        grp.setSortOrder(1);
        
        groups.add(grp);
        //END TESTING CODE
        
        //sort groups by sort order
        Collections.sort(groups); 
        
        //set attribute with groups
        getRequest().setAttribute("groups", groups);
    }

    protected void setDefaults(ContractingInfo info) {
    }

    protected void setNextPage() {
        setNextPage(Constants.CONTRACTING_PREFERENCES_PAGE); 
        setIsNextPageInContext(true);
    }

    protected ContractingInfo updateContractingInfo(ContractingInfo info) {
        return info;
    }
    
    
}
