package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;

import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 26, 2005
 */
public class TourneyInfo extends Static {


    protected void businessProcessing() throws Exception {

            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new SimpleResource("TCCC04Terms"));
            } else {
                DataAccess dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
                Request dataRequest = new Request();

                dataRequest.setContentHandle("affidavit_info");
                dataRequest.setProperty("cr", "" + getUser().getId());
                dataRequest.setProperty("mid", "" + getUser().getId());
                getRequest().setAttribute("info", dai.getData(dataRequest));
            }
            super.businessProcessing();

    }



}
