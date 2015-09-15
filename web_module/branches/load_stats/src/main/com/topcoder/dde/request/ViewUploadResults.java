/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.request;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.screening.PermissionHelper;
import com.topcoder.apps.screening.QueryInterface;
import com.topcoder.apps.screening.ScreeningResponse;
import com.topcoder.apps.screening.ScreeningTool;
import com.topcoder.dde.util.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

/**
 * <strong>Purpose</strong>:
 * A processor to show the application specification screening results.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ViewUploadResults extends BaseProcessor {

    /**
     * Process the dr upload application specification request.
     * Validates user to be an admin or have special specification submit permission and queries the DB
     * to search for the screening results.
     *
     * @throws TCWebException when errors occur.
     */
    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {
                if (!PermissionHelper.isAdmin(getUser())
                        && !PermissionHelper.hasSpecificationSubmitPermission(getUser())) {
                    throw new NavigationException("You are not authorized to view this page");
                }

                // validates request's parameters.
                if (!hasParameter(Constants.SPECIFICATION_KEY)) {
                    throw new TCWebException("Parameter " + Constants.SPECIFICATION_KEY + " expected.");
                }

                long specId = -1;
                try {
                    specId = Long.parseLong(getRequest().getParameter(Constants.SPECIFICATION_KEY));
                } catch (NumberFormatException nfe) {
                    throw new TCWebException("Invalid " + Constants.SPECIFICATION_KEY + " value.");
                }

                // queries the DB for the screening results.
                getScreeningResults(specId);

                getRequest().setAttribute(Constants.SPECIFICATION_KEY, String.valueOf(
                    StringUtils.htmlEncode(getRequest().getParameter(Constants.SPECIFICATION_KEY))));
                setNextPage("/applications/screening_results.jsp");
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * Retrieves screening results
     *
     * Gets the screening responses for a particular specification from the DB.
     *
     * @param specId The specification's ID to be retrieved.
     *
     * @throws TCWebException when errors occur.
     */
    private void getScreeningResults(long specId) throws TCWebException {
        Connection conn = null;
        QueryInterface query = null;
        ScreeningResponse[] responses = null;
        try {
            conn = Common.getDataSource().getConnection();

            query = ScreeningTool.createQuery();
            responses = query.getSpecificationDetails(specId, conn);

        } catch (SQLException sqle) {
            throw new TCWebException("Internal error. Please inform TC.", sqle);
        } finally {
            Common.close(conn);
        }

        // populates warnings, fatal errors and success messages.
        List warnings = new ArrayList();
        List fatalErrors = new ArrayList();
        List success = new ArrayList();
        for (int i = 0; i < responses.length; ++i) {
            if ("Warning".equals(responses[i].getSeverity())) {
                warnings.add(responses[i]);
            } else if ("Fatal Error".equals(responses[i].getSeverity())) {
                fatalErrors.add(responses[i]);
            } else if ("Success".equals(responses[i].getSeverity())) {
                success.add(responses[i]);
            }
        }

        log.debug("success.size(): " + success.size());
        log.debug("warnings.size(): " + warnings.size());
        log.debug("fatalErrors.size(): " + fatalErrors.size());

        getRequest().setAttribute(Constants.SUCCESS_KEY, success);
        getRequest().setAttribute(Constants.WARNINGS_KEY, warnings);
        getRequest().setAttribute(Constants.ERRORS_KEY, fatalErrors);
    }
}
