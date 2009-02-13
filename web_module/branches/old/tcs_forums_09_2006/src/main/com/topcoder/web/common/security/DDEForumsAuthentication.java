package com.topcoder.web.common.security;

import com.topcoder.shared.security.Persistor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;

/**
 * @author mtong
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 14, 2006
 */
public class DDEForumsAuthentication extends BasicAuthentication {
    public DDEForumsAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        super(userPersistor, request, response, BasicAuthentication.DDE_SITE);
    }

    public DDEForumsAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, String dataSource) throws Exception {
        super(userPersistor, request, response, BasicAuthentication.DDE_SITE, dataSource);
    }

}
