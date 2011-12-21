/*
 * Copyright (C) 2002-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import java.util.Map;

/**
 * <p>A controller for handling the requests for viewing the list of <code>Digital Run</code> tracks which can be
 * presented to <code>PACTS Administrators</code> for generating the payments.</p>
 *
 * <p>As of version 2.0 the controller has been totally re-written to switch to latest <code>Digital Run</code> schema.
 * </p>
 *
 * @author cucu, isv
 * @version 2.0
 */
public class ViewGenerateDRPayments extends BaseProcessor implements PactsConstants {

    /**
     * <p>A <code>String</code> providing the name for the query to be used for getting the list of all finished
     * <code>Digital Run</code> tracks.</p>
     */
    private static final String DR_FINISHED_TRACKS_QUERY = "dr_all_finished_tracks_list";

    /**
     * <p>Constructs new <code>ViewGenerateDRPayments</code> instance. This implementation does nothing.</p>
     *
     * @since 2.0
     */
    public ViewGenerateDRPayments() {
    }

    /**
     * <p>Implements the business logic for processing the incoming request. Retrieves the list of <code>Digital Run
     * </code> tracks available for payment generation and binds it to request to make accessible to sub-seuquent view.
     * </p>
     *
     * @throws TCWebException if an unexpected error occurs while accessing the persistent data store.
     */
    protected void businessProcessing() throws TCWebException {
        try {
            ResultSetContainer tracks = getAllTracks();
            getRequest().setAttribute("tracks" , tracks);
            setNextPage(INTERNAL_VIEW_GENERATE_DR_PAYMENTS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>Gets the list of all <code>Digital Run</code> tracks.</p>
     *
     * @return a <code>ResultSetContainer</code> providing the details for all <code>Digital Run</code> tracks which
     *         are either completed or active but do not have pending projects.
     * @throws Exception if an unexpected error occurs.
     */
    protected ResultSetContainer getAllTracks() throws Exception {
        Request r = new Request();
        r.setContentHandle(DR_FINISHED_TRACKS_QUERY);
        DataAccessInt dai = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        try {
            Map m = dai.getData(r);
            return (ResultSetContainer) m.get(DR_FINISHED_TRACKS_QUERY);
        } catch (Exception e) {
            throw new TCWebException("Command " + DR_FINISHED_TRACKS_QUERY + " failed.");
        }
    }
}

