package com.topcoder.web.corp.request;


/**
 * Dumb RequestProcessor implementation intended to get things running. 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class ContentFetcherA extends AbstractRequestProcessor {
    
    /**
     * @see com.topcoder.web.common.AbstractRequestProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        // the only thin that is processor does is definition
        // of real content page location
        setContentTag("index.jsp");  
    }
    
    /**
     * not implemented.
     * @see com.topcoder.web.common.RequestProcessor#getNextPage()
     */
    public String getNextPage() {
        return null;
    }
    
	/**
     * not implemented.
	 * @see com.topcoder.web.common.RequestProcessor#isNextPageInContext()
	 */
	public boolean isNextPageInContext() {
		return false;
	}
}
