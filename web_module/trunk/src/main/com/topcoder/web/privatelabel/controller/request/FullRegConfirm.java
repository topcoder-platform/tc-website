package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.InvalidContentTypeException;
import com.topcoder.servlet.request.UploadedFile;

import java.util.Iterator;

/**
 *
 * @author gpaul 07.07.2003
 */
public class FullRegConfirm extends FullRegBase {

    protected void registrationProcessing() throws TCWebException {

        /*
          check the 2nd page input, no reason to do the first page again
          we got it from the persistor at this point, so we can assume it
          has already been checked.
        */
        checkRegInfo(regInfo);

        if (hasErrors()) {
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
            setDefaults(regInfo);
        } else {
            regInfo.setCountryName(findCountry(regInfo.getCountryCode()));
            regInfo.setStateName(findState(regInfo.getStateCode()));
            setNextPage(Constants.VERIZON_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        //get the main reg info from the session
        FullRegInfo info = (FullRegInfo)getRegInfoFromPersistor();
        if (info==null) {
            throw new Exception("Registration info not found in persistor");
        }

        //get the rest from the request
        info.setCoderType(Integer.parseInt(StringUtils.checkNull(getRequestParameter(Constants.CODER_TYPE))));

        try {
            fu = new FileUpload(getRequest(), false);
        } catch (InvalidContentTypeException ignore) {
            //that's ok, we'll just procede with out
        }
        if (fu!=null) {
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

    /**
     * Check the extended type information only.
     * @param info
     * @throws TCWebException
     */
    protected void checkRegInfo(FullRegInfo info) throws TCWebException {
        //TODO check the demo and other input
    }


}
