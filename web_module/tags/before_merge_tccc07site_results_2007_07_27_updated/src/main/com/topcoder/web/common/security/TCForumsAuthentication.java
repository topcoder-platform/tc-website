package com.topcoder.web.common.security;

import com.topcoder.shared.security.Persistor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 8, 2006
 */
public class TCForumsAuthentication extends LightAuthentication {
    public TCForumsAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        super(userPersistor, request, response, BasicAuthentication.MAIN_SITE);
    }
}
