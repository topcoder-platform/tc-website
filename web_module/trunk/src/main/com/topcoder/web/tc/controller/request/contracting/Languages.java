/*
 * Languages.java
 *
 * Created on October 5, 2004, 2:18 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;

/**
 *
 * @author  rfairfax
 */
public class Languages extends ContractingBase {
    

    protected void contractingProcessing() throws TCWebException {
    }

    protected void setNextPage() {
        setNextPage(Constants.CONTRACTING_LANGUAGES_PAGE); 
        setIsNextPageInContext(true);
    }
    
}
