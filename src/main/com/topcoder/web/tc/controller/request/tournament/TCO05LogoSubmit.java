package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.servlet.request.UploadedFile;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;

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
                StringBuffer fileLocation = new StringBuffer(100);
                fileLocation.append(IMAGE_PATH);
                fileLocation.append(getUser().getId()).append("_");
                Calendar cal = Calendar.getInstance();
                cal.setTime(new Date());
                fileLocation.append(cal.get(Calendar.YEAR)).append("_");
                fileLocation.append(cal.get(Calendar.MONTH+1)).append("_");
                fileLocation.append(cal.get(Calendar.DAY_OF_MONTH)).append("_");
                fileLocation.append(cal.get(Calendar.HOUR)).append("_");
                fileLocation.append(cal.get(Calendar.MINUTE)).append("_");
                fileLocation.append(cal.get(Calendar.SECOND)).append("_");
                fileLocation.append(cal.get(Calendar.MILLISECOND));
                fileLocation.append(file.getRemoteFileName().substring(file.getRemoteFileName().lastIndexOf('.')));
                log.debug("filename built is " + fileLocation.toString());
                FileOutputStream fos = new FileOutputStream(fileLocation.toString());
                log.debug("write that file to " + fileLocation.toString());
                byte[] bytes = new byte[(int) file.getSize()];
                file.getInputStream().read(bytes);
                file.getInputStream().close();
                fos.write(bytes);
                fos.close();
                //create record in image table
                //create record in coder image xref table
                setNextPage("/tournaments/tco05/logo_success.jsp");
                setIsNextPageInContext(true);
            }
        }
    }
}

