/*
 * Copyright (C) 2004 - 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * This class used to retreive the reliability details for a given user in a specific track.
 * </p>
 *
 * <p>
 *   Version 1.1 (Member Profile Enhancement 1.0) Change notes:
 *   <ol>
 *     <li>
 *     Added support for retrieving reliability details for the newly
 *     added tracks (conceptualization, specification, architecture, assembly,
 *     and application testing).
 *     </li>
 *   </ol>
 *
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *   </ol>
 *
 *   Version 1.3 Change notes:
 *   <ol>
 *     <li>Added support for the Test Scenarios, UI Prototype and RIA Build tracks.</li>
 *   </ol> 
 * </p>
 *
 * @author dok, pulky, VolodymyrK
 * @version 1.3
 */
public class ReliabilityDetail extends Base {

    /**
     * <p>
     * Process the reliability detail information, retrieve the information
     * and forward to reliabilityDetail.jsp page, and this method
     * support all tracks.
     * </p>
     *
     * @since Member Profile Enhancement assembly.
     */
    protected void businessProcessing() throws Exception {
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        int projectTypeId = getProjectTypeId();
        if (!hasParameter(Constants.CODER_ID)) {
            throw new TCWebException("parameter " + Constants.CODER_ID + " expected.");
        }
        
        Request r = new Request();
        r.setContentHandle("reliability_detail");
        r.setProperty(Constants.PROJECT_TYPE_ID, String.valueOf(projectTypeId));
        r.setProperty(Constants.USER_ID, getRequest().getParameter(Constants.CODER_ID));
        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        // sets attributes for the jsp
        getRequest().setAttribute("contests", dai.getData(r).get("reliability_detail"));

        getRequest().setAttribute(Constants.TYPE_KEY, getHandleType(projectTypeId));
        getRequest().setAttribute(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

        setNextPage(Constants.VIEW_RELIABILITY_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }
}
