package com.topcoder.web.corp.request;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import javax.servlet.ServletRequest;

import com.topcoder.web.common.RequestProcessor;

/**
 * Base abstract class for RequestProcessor implementors.
 * For now it is a skeleton only. It is supposed that will contain a lot of
 * usefull helper methods to work with request. At least there will be methods
 * for transparent setting/quering cookies, request/session attributes
 * management. Probably instantiation of TCSubject based on user ig will be
 * performed here as well. Feel free to ask implement some helper methods not
 * mentioned above.
 * 
 * @author djFD molc@mail.ru, modified by swif0ne
 * @version 1.02
 *
 */
public abstract class BaseProcessor implements RequestProcessor {
    protected HttpServletRequest request;
    protected boolean pageInContext = false;
    
    // form based processors must set it to new HashMap() inside
    // constructor, while others are allowed leave it as is
    protected HashMap formErrors = null;
    // same for form defaults
	protected HashMap formDefaults = null;
    
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

//    /**
//     * Returns the next page to go to.  just a placeholder for now and should 
//     * be overridden by exteneded classes.  Not sure if null is a good default
//     * to return.  (will Check into this)
//     */
//    public String getNextPage() {
//        return null;
//    }

	/**
	 * @see com.topcoder.web.common.RequestProcessor#isNextPageInContext()
	 */
	public boolean isNextPageInContext() {
		return isNextPageInContext();
	}

//
//    protected void setIsNextPageInContext(boolean flag) {
//        pageInContext = flag;
//    }

    /**
     * Stores given request inside for further processing
     */
    public void setRequest(ServletRequest req) {
        request = (HttpServletRequest)req;
        if( formErrors != null ) { // in case if it is form based processor
        	formErrors.clear(); 
        }
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
