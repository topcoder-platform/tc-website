package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Demog extends FullRegDemog {
    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.BROOKS_REG_PAGE);
        } else {
            setNextPage(Constants.BROOKS_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }


    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
        
        //remove handle error
        removeError(Constants.HANDLE);
        
        //generate handle
        String handle = info.getFirstName().substring(0,1) + info.getLastName();
        
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
        
        log.info("CHOSEN HANDLE IS " + handle);
        
        info.setHandle(handle);
        setDefault(Constants.HANDLE, info.getHandle());
        
        /*if (!StringUtils.containsOnly(info.getHandle(), Constants.HANDLE_ALPHABET, false)) {
            addError(Constants.HANDLE,
                    "Please limit the characters in your handle to letter, numbers and common punctuation symbols.");
        }*/
        
        //we're not bothering with an email confirmation field, so don't require it 
        removeError(Constants.EMAIL_CONFIRM);
    }
}
