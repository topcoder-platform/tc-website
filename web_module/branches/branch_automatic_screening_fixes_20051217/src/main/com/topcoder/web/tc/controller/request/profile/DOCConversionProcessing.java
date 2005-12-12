/*
 * DOCConversionProcessing.java
 *
 * Created on December 6, 2004, 2:12 PM
 */

package com.topcoder.web.tc.controller.request.profile;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import com.topcoder.web.ejb.fileconversion.*;
import com.topcoder.shared.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.web.common.MultipartRequest;
import com.topcoder.servlet.request.*;

import javax.servlet.ServletOutputStream;
import java.io.*;
/**
 *
 * @author rfairfax
 */
public class DOCConversionProcessing extends BaseProcessor {
    
    protected void setNextPage() {
        //setNextPage(Constants.PROFILE_DOC_CONVERTOR_PAGE); 
        setIsNextPageInContext(false);
    }

    protected void businessProcessing() throws TCWebException {
        InitialContext ctx = null;

        try {
            //prefs
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.FILE_CONVERSION_PROVIDER_URL);
            
            FileConversion filebean = (FileConversion)createEJB(ctx, FileConversion.class);
            
            //get file
            if(getRequest() instanceof MultipartRequest) {
                MultipartRequest req = (MultipartRequest)getRequest();
                UploadedFile file = req.getUploadedFile("file"); 

                if (file != null && file.getContentType() != null) {
                    //get byte array
                    byte[] b = new byte[(int)file.getSize()];
                    file.getInputStream().read(b);
                    file.getInputStream().close();
                    
                    byte[] result = filebean.convertDoc(b, "doc");
                    getResponse().setContentType("application/pdf");
                    ServletOutputStream sos = getResponse().getOutputStream();
                    sos.write(result);
                    sos.flush();
                    sos.close();
                    
                    getResponse().flushBuffer();
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
            
    }
}
