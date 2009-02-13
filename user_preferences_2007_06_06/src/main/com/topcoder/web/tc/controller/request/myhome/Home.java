/*
* Home
*
* Created Jun 14, 2007
*/
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
        Request dataRequest = new Request();
        //we'll sacrifice here a little by using the same command as statistics.
        //this gives us WAY more data than we need, but it means that we can
        //use the cache both for the home page and the member profile page
        dataRequest.setContentHandle("member_profile");
        dataRequest.setProperty("cr", String.valueOf(getUser().getId()));
        getRequest().setAttribute("member_info", dwDai.getData(dataRequest).get("Coder_Data"));

        setNextPage("/my_home/index.jsp");
        setIsNextPageInContext(true);
    }
}
