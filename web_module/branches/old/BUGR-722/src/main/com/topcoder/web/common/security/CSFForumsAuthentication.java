package com.topcoder.web.common.security;

import com.topcoder.shared.security.Persistor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 8, 2007
 */
public class CSFForumsAuthentication extends BasicAuthentication {
    public CSFForumsAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        super(userPersistor, request, response, BasicAuthentication.CSF_SITE);
    }

    public CSFForumsAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, String dataSource) throws Exception {
        super(userPersistor, request, response, BasicAuthentication.CSF_SITE, dataSource);
    }

}
