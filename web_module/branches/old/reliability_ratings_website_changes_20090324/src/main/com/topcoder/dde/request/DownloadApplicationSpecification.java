/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.request;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.screening.EJBHelper;
import com.topcoder.apps.screening.PermissionHelper;
import com.topcoder.apps.screening.application.AppSpecification;
import com.topcoder.apps.screening.application.ApplicationSpecification;
import com.topcoder.dde.util.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.sql.Connection;


/**
 * <strong>Purpose</strong>:
 * A processor to give an entry point to upload application specifications to be screened.
 *
 * @author pulky
 * @version 1.0.0
 */
public class DownloadApplicationSpecification extends BaseProcessor {

    /**
     * Process the dr upload application specification request.
     * Validates user to be an admin or have special specification submit permission
     */
    protected void businessProcessing() throws TCWebException {
        Connection conn = null;
        FileInputStream fis = null;
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

                conn = Common.getDataSource().getConnection();
                AppSpecification appSpecification = EJBHelper.getAppSpecification();

                ApplicationSpecification appSpec = appSpecification.getSpecification(conn, specId);

                //stream it out via the response
                getResponse().addHeader("content-disposition", "inline; filename=\"" + appSpec.getRemoteFilename() + "\"");
                ServletOutputStream sos = getResponse().getOutputStream();

                fis = new FileInputStream(appSpec.getSpecificationUrl().getFile());

                int b;
                while ((b = fis.read()) >= 0) {
                    sos.write(b);
                }
                getResponse().setStatus(HttpServletResponse.SC_OK);
                getResponse().flushBuffer();
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        } finally {
            Common.close(conn);
            try {
                fis.close();
            } catch (Exception e) {
            }
        }
    }
}
