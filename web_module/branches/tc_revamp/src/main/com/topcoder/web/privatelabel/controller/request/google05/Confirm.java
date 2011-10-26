package com.topcoder.web.privatelabel.controller.request.google05;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;

import java.util.Calendar;
import java.util.Date;

/**
 * @author  dok
 * @version  $Revision: 43007 $ $Date$
 * Create Date: Jul 7, 2005
 */
public class Confirm extends FullRegConfirm {
    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.AUGUST, 19, 17, 0);
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        beginning.set(2004, Calendar.JULY, 9, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (now.before(beginning) || now.after(end)) {
            setNextPage(Constants.GOOGLE05_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE05_REG_DEMOG_PAGE);
            } else {
                setNextPage(Constants.GOOGLE05_REG_CONFIRM_PAGE);
            }
            setIsNextPageInContext(true);
        }

    }

/*
    protected SimpleRegInfo makeRegInfo() throws Exception {
        FullRegInfo info;
        info = (FullRegInfo) super.makeRegInfo();

        if (!(info instanceof ResumeRegInfo)) {
            info = new ResumeRegInfo(info);
        }

        MultipartRequest req = (MultipartRequest) getRequest();
        UploadedFile file = req.getUploadedFile(Constants.RESUME);

        if (file != null && file.getContentType() != null) {
            log.debug("FOUND RESUME");
            ((ResumeRegInfo) info).setUploadedFile(file);
        }

        return info;
    }
*/

/*
    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        try {
            //validate uploaded file, if applicable
            ResumeRegInfo rinfo = (ResumeRegInfo) info;
            if (rinfo.getUploadedFile() != null) {
                byte[] fileBytes = null;

                fileBytes = new byte[(int) rinfo.getUploadedFile().getSize()];
                rinfo.getUploadedFile().getInputStream().read(fileBytes);
                if (fileBytes == null || fileBytes.length == 0)
                    addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
                else {
                    //fileType = Integer.parseInt(file.getParameter("fileType"));
                    Map types = getFileTypes(transDb);
                    if (!types.containsKey(rinfo.getUploadedFile().getContentType())) {
                        log.debug("DID NOT FIND TYPE " + rinfo.getUploadedFile().getContentType());
                        addError(Constants.FILE, "Unsupported file type (" + rinfo.getUploadedFile().getContentType() + ")");
                    }
                }
            }


        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
*/


}