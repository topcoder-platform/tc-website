package com.topcoder.web.privatelabel.controller.request.amazon;

import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.model.*;
import com.topcoder.web.privatelabel.Constants;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;

import java.util.*;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.servlet.request.*;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Confirm extends FullRegConfirm {
    protected static Logger log = Logger.getLogger(Confirm.class);
    
    protected void setNextPage() {

        if (hasErrors()) {
            setNextPage(Constants.AMAZON_REG_PAGE);
        } else {
            setNextPage(Constants.AMAZON_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        FullRegInfo info;
        info = (FullRegInfo)super.makeRegInfo();
        
        if(!(info instanceof ResumeRegInfo))
        {
            info = new ResumeRegInfo(info);
        }
        
        MultipartRequest req = (MultipartRequest)getRequest();
        UploadedFile file = req.getUploadedFile(Constants.RESUME);
        
        if (file != null && file.getContentType() != null) {
                log.debug("FOUND RESUME");
                ((ResumeRegInfo)info).setUploadedFile(file);
            }
        
        return info;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);    
        
        ((FullRegInfo)info).setCoderType(Constants.PROFESSIONAL);
        
        //remove handle error
        removeError(Constants.HANDLE);
        //state is not required
        removeError(Constants.STATE_CODE);
        
        //generate handle
        String handle = "";
        if(info.getFirstName().length() != 0)
        {
            handle = info.getFirstName().substring(0,1) + info.getLastName();
        }
        else
        {
            handle = info.getLastName();
        }
        
        if(handle.length() < Constants.MIN_HANDLE_LENGTH)
        {
            //pad handle with zeroes
            while(handle.length() < Constants.MIN_HANDLE_LENGTH)
            {
                handle = handle + "0";
            }
        }
        if(handle.length() > Constants.MAX_HANDLE_LENGTH)
        {
            handle = handle.substring(0, Constants.MAX_HANDLE_LENGTH);
        }
        
        handle = handle.toLowerCase();
        String baseHandle = handle;
        
        try {
            int num = 0;
            while (info.isNew() && userExists(handle)) {
                //add a number
                num++;
                if(baseHandle.length() + String.valueOf(num).length() > Constants.MAX_HANDLE_LENGTH)
                {
                   //trim to make number fit
                   handle = baseHandle.substring(0, Constants.MAX_HANDLE_LENGTH - String.valueOf(num).length()) + num;
                }
                else
                    handle = baseHandle + num;
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }        
        
        log.debug("CHOSEN HANDLE IS " + handle);
        
        info.setHandle(handle);
        setDefault(Constants.HANDLE, info.getHandle());
        
        //generate password
        removeError(Constants.PASSWORD);
        removeError(Constants.PASSWORD_CONFIRM);
        
        info.setPassword(generatePassword());
        info.setPasswordConfirm(info.getPassword());
        
        log.debug("CHOSEN PASSWORD IS " + info.getPassword());
        
        //we're not bothering with an email confirmation field, so don't require it 
        removeError(Constants.EMAIL_CONFIRM);
        removeError(Constants.ADDRESS1);
        removeError(Constants.CITY);
        
        try
        {
            //validate uploaded file, if applicable
            ResumeRegInfo rinfo = (ResumeRegInfo)info;
            if(rinfo.getUploadedFile() != null)
            {
                byte[] fileBytes = null;   

                fileBytes = new byte[(int) rinfo.getUploadedFile().getSize()];
                rinfo.getUploadedFile().getInputStream().read(fileBytes);
                if (fileBytes == null || fileBytes.length == 0)
                    addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
                else {
                    //fileType = Integer.parseInt(file.getParameter("fileType"));
                    Map types = getFileTypes(transDb);
                    if(!types.containsKey(rinfo.getUploadedFile().getContentType()) )
                    {
                        log.debug("DID NOT FIND TYPE " + rinfo.getUploadedFile().getContentType());
                        addError(Constants.FILE, "Unsupported file type (" + rinfo.getUploadedFile().getContentType() + ")");
                    }
                }
            }
            
            DemographicResponse r = null;
            DemographicQuestion q = null;
            int count = 0;
/*            for (Iterator it = ((FullRegInfo) info).getResponses().iterator(); it.hasNext();) {
                r = (DemographicResponse) it.next();
                if(r.getQuestionId() == Long.parseLong(Constants.BROOKS_REFERRAL_QUESTION_ID))
                {
                    count++;
                }
            }
            
            if(count != 0 && count > 3)
            {
                addError(Constants.DEMOG_PREFIX + Constants.BROOKS_REFERRAL_QUESTION_ID, "Please choose a maximum of three answers.");
            }*/
        
        }
        catch(Exception e)
        {
            throw new TCWebException(e);
        }
    }
    
    protected Map getFileTypes(String db) throws Exception {
        Request r = new Request();
        r.setContentHandle("file_types");
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("file_types");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret.put(row.getStringItem("mime_type"), new Long( row.getLongItem("file_type_id")) );
        }
        return ret;
    }
    
    private String generatePassword() {
        StringBuffer newPass = new StringBuffer();
        for (int i = 0; i < Constants.MAX_PASSWORD_LENGTH; ++i) {
            newPass.append( 
                    Constants.VALID_PASS_CHAR_LIST.charAt(
                            rand(Constants.VALID_PASS_CHAR_LIST.length()))); 
        }

        return newPass.toString();
    }
    
    private int rand(int max) {
        return (int) Math.floor(Math.random() * max);
    }
}
