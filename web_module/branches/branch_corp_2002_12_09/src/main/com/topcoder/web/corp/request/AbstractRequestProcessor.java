package com.topcoder.web.corp.request;

import javax.servlet.http.HttpServletRequest;

import com.topcoder.web.common.RequestProcessor;

/**
 * Base abstract class for get life easier for RequestProcessor implementors.
 * For now it is a skeleton only. It is supposed that will contain a lot of
 * usefull helper methods to work with request. At least there will be methods
 * for transparent setting/quering cookies, request/session attributes
 * management. Probably instantiation of TCSubject based on user ig will be
 * performed here as well. Feel free to ask implement some helper methods not
 * mentioned above.
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public abstract class AbstractRequestProcessor implements RequestProcessor {
    protected HttpServletRequest request;
    
    /**
     * Stores given request inside for further processing
     * @see com.topcoder.web.common.RequestProcessor#setRequest(javax.servlet.http.HttpServletRequest)
     */
    public void setRequest(HttpServletRequest req) {
        request = req;
    }


    /**
     * Populates 'where-to-go' request's attribute with given value. It is only
     * to get stubs working.
     * 
     * @param contentLocation determines where real content file is located
     */
    protected void setContentTag(String contentLocation) {
        request.setAttribute("where-to-go", contentLocation);
    }

    /**
     * Performs generic pre-processing, then calls businessProcessing() method
     * of subclass and, finally does some post processing operations.
     * 
     * @see com.topcoder.web.common.RequestProcessor#process()
     */
    public final void process() throws Exception {
        // perform some preprocessing actions here, then call supplied by subclass
        // businessProcessing() method
        // ..
        //
        
        businessProcessing();
        
        // some request post processing goes here 
        // (may include scrambling of cookies, plain texts, etc)
        // ..
        //
    }
    
    /**
     * Performs busines-processing of request. It is supposed that subclasses
     * will not override process method. Instead they will declare own
     * businessProcessing() method. When signal to process request/response pair
     * arrives there are some pre- and post- processing actions to be performed
     * for every request. It is performed by supplied by
     * AbstractRequestProcessor class process() method. Between these method
     * businessProcessing of will be called. Probably there may be parameters,
     * but at the moment they undefined yet.
     * 
     */
    abstract void businessProcessing() throws Exception;  

}
