package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.web.ejb.image.Image;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 2, 2006
 */
abstract class BaseLogoSubmit extends Base {

    protected abstract int getPathId();

    protected abstract int getImageTypeId();

    protected abstract int getTermsId();

    protected abstract String getSuccessPage();

    protected abstract String getTermsProcessor();

    public abstract int getMaxSubmissions();

    //todo this can be done better, figure out the path from the db.
    protected abstract String getPath();

    protected void businessProcessing() throws Exception {

        if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getLoggedInUser(), new SimpleResource(this.getClass().getName()));
        } else {
            //check if they agreed to terms, no back doors here buddy!
            UserTermsOfUse ut = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
            CoderImage coderImage = (CoderImage) createEJB(getInitialContext(), CoderImage.class);
            if (ut.hasTermsOfUse(getUser().getId(), getTermsId(), DBMS.OLTP_DATASOURCE_NAME)) {
                MultipartRequest request = (MultipartRequest) getRequest();
                UploadedFile file = request.getUploadedFile(Constants.LOGO);
                int submissionCount = coderImage.getImages(getUser().getId(), getImageTypeId(), DBMS.OLTP_DATASOURCE_NAME).size();
                if (submissionCount >= getMaxSubmissions()) {
                    throw new NavigationException("Sorry, you can not submit again, you have already submitted " + getMaxSubmissions() + " times.");
                } else if (file != null) {
                    StringBuffer fileName = new StringBuffer(100);
                    fileName.append(getUser().getId()).append("_");
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(new Date());
                    fileName.append(cal.get(Calendar.YEAR)).append("_");
                    fileName.append(cal.get(Calendar.MONTH) + 1).append("_");
                    fileName.append(cal.get(Calendar.DAY_OF_MONTH)).append("_");
                    fileName.append(cal.get(Calendar.HOUR_OF_DAY)).append("_");
                    fileName.append(cal.get(Calendar.MINUTE)).append("_");
                    fileName.append(cal.get(Calendar.SECOND)).append("_");
                    fileName.append(cal.get(Calendar.MILLISECOND)).append("_");
                    fileName.append("s").append(submissionCount + 1);
                    int idx = file.getRemoteFileName().lastIndexOf('.');
                    if (idx >= 0) {
                        fileName.append(file.getRemoteFileName().substring(file.getRemoteFileName().lastIndexOf('.')));
                    }
                    if (log.isDebugEnabled()) {
                        log.debug("filename built is " + fileName.toString());
                    }
                    FileOutputStream fos = new FileOutputStream(getPath() + fileName.toString());
                    if (log.isDebugEnabled()) {
                        log.debug("write that file to " + fileName.toString());
                    }
                    byte[] bytes = new byte[(int) file.getSize()];
                    file.getInputStream().read(bytes);
                    file.getInputStream().close();
                    fos.write(bytes);
                    fos.close();

                    TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                    try {
                        tm.begin();
                        Image image = (Image) createEJB(getInitialContext(), Image.class);
                        //just double check, in case they're hitting it really hard
                        if (coderImage.getImages(getUser().getId(), getImageTypeId(), DBMS.OLTP_DATASOURCE_NAME).size() >= getMaxSubmissions()) {
                            throw new NavigationException("Sorry, you can not submit again, you have already submitted " + getMaxSubmissions() + " times.");
                        }

                        long imageId = image.createImage(fileName.toString(), getImageTypeId(), getPathId(),
                                DBMS.JTS_OLTP_DATASOURCE_NAME);
                        if (log.isDebugEnabled()) {
                            log.debug("created image " + imageId);
                        }
                        coderImage.createCoderImage(getUser().getId(), imageId, false, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        tm.commit();
                        setNextPage(getSuccessPage());
                        setIsNextPageInContext(true);
                    } catch (Exception e) {
                        if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                            log.warn("rolling back");
                            tm.rollback();
                        }
                        throw e;
                    }
                }
            } else {
                //go to the terms of use processor
                setNextPage("/tc?module=" + getTermsProcessor());
                setIsNextPageInContext(false);

            }


        }
    }
}
