/*
 * Preferences.java
 *
 * Created on October 1, 2004, 1:49 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
/**
 *
 * @author  rfairfax
 */
public class Preferences extends ContractingBase {
    protected void contractingProcessing() throws TCWebException {
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
