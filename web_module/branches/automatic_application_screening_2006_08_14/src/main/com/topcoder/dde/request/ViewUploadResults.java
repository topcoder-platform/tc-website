package com.topcoder.dde.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.apps.review.ConfigHelper;
import com.topcoder.apps.review.Constants;
import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.screening.ProjectType;
import com.topcoder.apps.screening.QueryInterface;
import com.topcoder.apps.screening.ScreeningJob;
import com.topcoder.apps.screening.ScreeningResponse;
import com.topcoder.apps.screening.ScreeningTool;
import com.topcoder.apps.screening.SpecificationScreeningRequest;
import com.topcoder.apps.screening.application.AppSpecification;
import com.topcoder.apps.screening.application.ApplicationSpecification;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

public class ViewUploadResults extends BaseProcessor {

    private static Logger log = Logger.getLogger(ViewUploadResults.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {

                if (!hasParameter("spec_id")) {
                    throw new TCWebException("parameter " + "spec_id" + " expected.");
                }

                Connection conn = Common.getDataSource().getConnection();

                QueryInterface query = ScreeningTool.createQuery();

                ScreeningResponse[] responses = query.getSpecificationDetails(
                        Long.parseLong(getRequest().getParameter("spec_id")), conn);

                List warnings = new ArrayList();
                List fatalErrors = new ArrayList();
                for (int i = 0; i < responses.length; ++i) {
                    if ("Warning".equals(responses[i].getSeverity())) {
                        warnings.add(responses[i]);
                    } else if ("Fatal Error".equals(responses[i].getSeverity())) {
                        fatalErrors.add(responses[i]);
                    }
                }

                ScreeningResponse[] warArr = (ScreeningResponse[]) warnings.toArray(new ScreeningResponse[warnings.size()]);
                ScreeningResponse[] fatArr = (ScreeningResponse[]) fatalErrors.toArray(new ScreeningResponse[fatalErrors.size()]);

                log.info("warArr.length: " + warArr.length);
                log.info("fatArr.length: " + fatArr.length);

                if (warArr.length > 0) {
                    getRequest().setAttribute(Constants.WARNING_LIST_KEY, warArr);
                }
                if (fatArr.length > 0) {
                    getRequest().setAttribute(Constants.ERROR_LIST_KEY, fatArr);
                }

                getRequest().setAttribute("spec_id", String.valueOf(
                        StringUtils.htmlEncode(getRequest().getParameter("spec_id"))));
                setNextPage("/applications/upload_results.jsp");
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
