package com.topcoder.web.corp.request;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import javax.servlet.ServletRequest;

import com.topcoder.shared.security.User;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.tag.BaseTag;
import com.topcoder.web.corp.stub.UserStub;

/**
 * Base abstract class for RequestProcessor implementors.
 * For now it is a skeleton only. It is supposed that will contain a lot of
 * usefull helper methods to work with request. At least there will be methods
 * for transparent setting/quering cookies, request/session attributes
 * management. Probably instantiation of TCSubject based on user ig will be
 * performed here as well. Feel free to ask implement some helper methods not
 * mentioned above.
 * 
 * If requested by caller, HttpSession is searched for any persistant objects
 * (for now it is SessionPersistor objects) which in turn store various security
 * stuff as user authenticity token, etc.
 * 
 * @author djFD molc@mail.ru, modified by swif0ne
 * @version 1.02
 *
 */
public abstract class BaseProcessor implements RequestProcessor {
    protected HttpServletRequest request;
    protected boolean pageInContext = false;
    protected String nextPage = null;
    
    // form based processors must set it to new HashMap() inside
    // constructor, while others are allowed leave it as is
    private HashMap formErrors = null;
    // same for form defaults
	private HashMap formDefaults = null;
    
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

        // if it is form, then place default values of form fields and possible errors into request
        if( formDefaults != null ) {
            request.setAttribute(BaseTag.CONTAINER_NAME_FOR_DEFAULTS, formDefaults);
        }  
        if( formErrors != null ) {
            request.setAttribute(BaseTag.CONTAINER_NAME_FOR_ERRORS, formErrors);
        }
    }

    /**
     * Subclass responsibility is to set explicitely protected variable nextPage
     * to desired value.
     */
    public final String getNextPage() {
        return nextPage;
    }

	/**
     * The only subclass responsibility is to set explicitely protected variable
     * pageInContext
     * @see com.topcoder.web.common.RequestProcessor#isNextPageInContext()
	 */
	public final boolean isNextPageInContext() {
		return pageInContext;
	}

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
    
    /**
     * Set default value for field of form. Intended to be used in form
     * processors.
     * @param fieldKey name of the form field
     * @param value its deefault value
     */
    protected void setFormFieldDefault(String fieldKey, Object value) {
        if( formDefaults == null ) {
            formDefaults = new HashMap();
        }
        formDefaults.put(fieldKey, value);
    }
    
    /**
     * Marks form field as invalid.
     * @param fieldKey name of field to be marked as invalid
     */
    protected void markFormFieldAsInvalid(String fieldKey) {
        if(formErrors == null) {
            formErrors = new HashMap();
        }
        formErrors.put(fieldKey, new Object());
    }
    
    /**
     * For request being proccessed returns user's authenticity token. Anonymous
     * users (Guests) are authentic always forever by definition however
     * there is not the way to get them logged in neither via cookies nor via
     * login page.
     *
     * @return BasicAuthentication
     */
    protected BasicAuthentication getAuthenticityToken() throws Exception {
        SessionPersistor store = SessionPersistor.getInstance(request);
        return new BasicAuthentication(store, request.getCookies());
    }
    
    /**
     * Lookup user by ID given. DB related - implemented as stub
     *
     * @param userID id of user to be found
     * @return User User matching gived ID or null if user with ID given was not
     * found
     * @throws Exception some errors occured when working with DB
     */
    protected User lookupUserByID(long userID) throws Exception {
        return UserStub.getInstance(userID);
    }
    
    /**
     * Lookup user by handle given. DB related - implemented as stub
     *
     * @param userHandle id of user to be found
     * @return User User matching gived handle or null if user with ID given was
     * not found
     * @throws Exception some errors occured when working with DB
     */
    protected User lookupUserByHandle(String userHandle) throws Exception {
        return UserStub.getInstance(userHandle);
    }
}
