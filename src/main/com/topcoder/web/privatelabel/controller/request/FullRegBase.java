package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.InvalidContentTypeException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.Persistor;

import java.util.Iterator;


/**
 * Provides some basic functionality for the different processors
 * involved in a registration process.
 * @author gpaul 06.26.2003
 */
abstract class FullRegBase extends SimpleRegBase {

    private FileUpload fu = null;
    private boolean hasResume;
    protected static Logger log = Logger.getLogger(FullRegBase.class);

    protected abstract void registrationProcessing() throws TCWebException;

    public FullRegBase() {
    }


    protected void setDefaults(FullRegInfo info) {
        super.setDefaults(info);
        setDefault(Constants.CODER_TYPE, String.valueOf(info.getCoderType()));
        setDefault(Constants.RESUME, info.getFileName());
        setDefault(Constants.FILE_TYPE, String.valueOf(info.getFileType()));
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        FullRegInfo info = new FullRegInfo(super.makeRegInfo());
        if (!hasResume) {
            try {
                fu = new FileUpload(getRequest(), false);
                hasResume = true;
            } catch (InvalidContentTypeException ignore) {
                //that's ok, we'll just procede with out
                hasResume = false;
            }
        }
        if (hasResume) {
            Iterator it = fu.getAllUploadedFiles();
            //only need to worry about a single resume
            UploadedFile uf = null;
            byte[] fileBytes = null;
            if (it.hasNext()) { //should only be one file
                uf = (UploadedFile)it.next();
                if (uf != null) {
                    fileBytes = new byte[(int)uf.getSize()];
                    uf.getInputStream().read(fileBytes);
                    info.setFileType(Integer.parseInt(fu.getParameter(Constants.FILE_TYPE)));
                    info.setFileName(uf.getRemoteFileName());
                    info.setResume(fileBytes);
                }
            }
        }
        return info;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
    }

    protected void checkRegInfo(FullRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
    }

    protected String getRequestParameter(String name) throws Exception {
        log.debug("getRequestParameter: " + name);
        String ret = null;
        if (hasResume) {
            ret = fu.getParameter(name);
        } else {
            ret = getRequest().getParameter(name);
        }
        return ret;
    }

    protected boolean hasDemogPageError() {
        boolean ret = false;
        ret |= hasError(Constants.FILE_TYPE);
        ret |= hasError(Constants.CODER_TYPE);
        ret |= hasError(Constants.RESUME);
        return ret;
    }
}
