package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.view.tag.DemographicInput;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.common.TCWebException;
import com.topcoder.servlet.request.UploadedFile;

import java.util.Iterator;
import java.util.List;

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

        //get the rest from the request
        String sCoderType = getRequestParameter(Constants.CODER_TYPE);
        info.setCoderType(Integer.parseInt(sCoderType==null?"-1":sCoderType));

        return info;
    }

    /**
     * Check the extended type information only.
     * @param info
     * @throws TCWebException
     */
    protected void checkRegInfo(FullRegInfo info) throws TCWebException {
        //TODO check the demo and other input
        if (info.getCoderType() != Constants.STUDENT || info.getCoderType() != Constants.PROFESSIONAL) {
            addError(Constants.CODER_TYPE, "Please choose either Student or Professional.");
        }
    }

    protected void setDefaults(FullRegInfo info) {
        setDefault(Constants.RESUME, info.getFileName());
        setDefault(Constants.FILE_TYPE, String.valueOf(info.getFileType()));
        List responses = info.getResponses();
        DemographicResponse response = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            response = (DemographicResponse)it.next();
            setDefault(DemographicInput.PREFIX+response.getQuestionId(), String.valueOf(response.getAnswerId()));
        }
    }

}
