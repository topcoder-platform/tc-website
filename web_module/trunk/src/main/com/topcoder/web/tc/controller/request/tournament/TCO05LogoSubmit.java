package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.servlet.request.UploadedFile;

import java.io.FileOutputStream;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public class TCO05LogoSubmit extends Base {
    private static final String IMAGE_PATH = ApplicationServer.BASE_DIR + "images/tco05logo/";

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            MultipartRequest request = (MultipartRequest) getRequest();
            UploadedFile file = request.getUploadedFile(Constants.LOGO);
            if (file != null) {
                log.debug("got file " + file.getFile());
                FileOutputStream fos = new FileOutputStream(IMAGE_PATH + file.getFile().getName());
                log.debug("write that file to " + IMAGE_PATH + file.getFile().getName());
                byte[] bytes = new byte[(int) file.getSize()];
                file.getInputStream().read(bytes);
                fos.write(bytes);
                //create record in image table
                //create record in coder image xref table
                setNextPage("/tournaments/tco05/logo_success.jsp");
                setIsNextPageInContext(true);
            }
        }
    }
}

