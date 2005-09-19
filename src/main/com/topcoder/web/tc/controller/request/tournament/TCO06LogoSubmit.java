package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.image.Image;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.servlet.request.UploadedFile;

import javax.transaction.TransactionManager;
import javax.transaction.Status;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Sept 19, 2005
 */
public class TCO06LogoSubmit extends Base {
    private static final String IMAGE_PATH = ApplicationServer.BASE_DIR + "images/tco06logo/";
    private static final int PATH_ID = 19;
    private static final int IMAGE_TYPE = 14;
    private static final int MAX_SUBMISSIONS = 3;

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            //check if they agreed to terms, no back doors here buddy!
            UserTermsOfUse ut = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);
            CoderImage coderImage = (CoderImage)createEJB(getInitialContext(), CoderImage.class);
            if (ut.hasTermsOfUse(getUser().getId(), Constants.TCO06_LOGO_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME)) {
                MultipartRequest request = (MultipartRequest) getRequest();
                UploadedFile file = request.getUploadedFile(Constants.LOGO);
                int submissionCount = coderImage.getImages(getUser().getId(), IMAGE_TYPE, DBMS.OLTP_DATASOURCE_NAME).size();
                if (submissionCount >= MAX_SUBMISSIONS) {
                    throw new NavigationException("Sorry, you can not submit again, you have already submitted " + MAX_SUBMISSIONS + " times.");
                } else if (file != null) {
                    log.debug("got file " + file.getFile());
                    StringBuffer fileName = new StringBuffer(100);
                    fileName.append(getUser().getId()).append("_");
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(new Date());
                    fileName.append(cal.get(Calendar.YEAR)).append("_");
                    fileName.append(cal.get(Calendar.MONTH+1)).append("_");
                    fileName.append(cal.get(Calendar.DAY_OF_MONTH)).append("_");
                    fileName.append(cal.get(Calendar.HOUR_OF_DAY)).append("_");
                    fileName.append(cal.get(Calendar.MINUTE)).append("_");
                    fileName.append(cal.get(Calendar.SECOND)).append("_");
                    fileName.append(cal.get(Calendar.MILLISECOND)).append("_s");
                    fileName.append(submissionCount+1);
                    int idx = file.getRemoteFileName().lastIndexOf('.');
                    if (idx >= 0) {
                        fileName.append(file.getRemoteFileName().substring(file.getRemoteFileName().lastIndexOf('.')));
                    }
                    log.debug("filename built is " + fileName.toString());
                    FileOutputStream fos = new FileOutputStream(IMAGE_PATH+fileName.toString());
                    log.debug("write that file to " + fileName.toString());
                    byte[] bytes = new byte[(int) file.getSize()];
                    file.getInputStream().read(bytes);
                    file.getInputStream().close();
                    fos.write(bytes);
                    fos.close();

                    TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                    try {
                        tm.begin();
                        Image image = (Image)createEJB(getInitialContext(), Image.class);
                        //just double check, in case they're hitting it really hard
                        if (coderImage.getImages(getUser().getId(), IMAGE_TYPE, DBMS.OLTP_DATASOURCE_NAME).size()>=MAX_SUBMISSIONS) {
                            throw new NavigationException("Sorry, you can not submit again, you have already submitted " + MAX_SUBMISSIONS + " times.");
                        }

                        long imageId = image.createImage(fileName.toString(), IMAGE_TYPE, PATH_ID,
                                DBMS.JTS_OLTP_DATASOURCE_NAME);
                        log.debug("created image " + imageId);
                        coderImage.createCoderImage(getUser().getId(), imageId, false, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        tm.commit();
                        setNextPage("/tournaments/tco06/logo_success.jsp");
                        setIsNextPageInContext(true);
                    } catch (Exception e) {
                        if (tm!=null && tm.getStatus()==Status.STATUS_ACTIVE) {
                            log.warn("rolling back");
                            tm.rollback();
                        }
                        throw e;
                    }
                }
            } else {
                //go to the terms of use processor
                setNextPage("/tc?module=TCO06LogoTerms");
                setIsNextPageInContext(false);

            }



        }
    }
}

