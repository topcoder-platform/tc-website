/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.request;

import java.sql.Connection;
import java.util.Arrays;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.screening.EJBHelper;
import com.topcoder.apps.screening.PermissionHelper;
import com.topcoder.apps.screening.application.AppSpecification;
import com.topcoder.apps.screening.application.ApplicationSpecification;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

/**
 * <strong>Purpose</strong>:
 * A processor to give an entry point to upload application specifications to be screened.
 *
 * @author pulky
 * @version 1.0.0
 */
public class UploadApplicationSpecification extends BaseProcessor {

    /**
     * Process the dr upload application specification request.
     * Validates user to be an admin or have special specification submit permission
     */
    protected void businessProcessing() throws TCWebException {
        Connection conn = null;
        try {
            setNextPage("/applications/specification_upload.jsp");
            setIsNextPageInContext(true);
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {
                if (!PermissionHelper.isAdmin(getUser())
                        && !PermissionHelper.hasSpecificationSubmitPermission(getUser())) {
                    throw new NavigationException("You are not authorized to view this page");
                }

                conn = Common.getDataSource().getConnection();
                AppSpecification appSpecification = EJBHelper.getAppSpecification();

                ApplicationSpecification[] oldSpecs =
                    appSpecification.getSpecifications(conn, getUser().getId());

                log.debug("oldSpecs.length: " + oldSpecs.length);
                getRequest().setAttribute("old_specs", Arrays.asList(oldSpecs));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        } finally {
            Common.close(conn);
        }
    }
}
