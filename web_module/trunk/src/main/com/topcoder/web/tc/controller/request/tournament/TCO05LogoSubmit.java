package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
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
            MultipartRequest request = (MultipartRequest)getRequest();
            UploadedFile[] files = request.getAllUploadedFiles();
            log.debug("got " + files.length + " files");
            for (int i=0; i<files.length; i++) {
                log.debug("got file " + files[i].getFile());
                FileOutputStream fos = new FileOutputStream(IMAGE_PATH + files[i].getFile().getName());
                log.debug("write that file to " + IMAGE_PATH + files[i].getFile().getName());
                byte[] bytes = new byte[(int)files[i].getSize()];
                files[i].getInputStream().read(bytes);
                fos.write(bytes);
                //create record in image table
                //create record in coder image xref table
                setNextPage("/tournaments/tco05/logo_success.jsp");
                setIsNextPageInContext(true);
            }
        }
    }
}
