package com.topcoder.web.corp.request;


/**
 * Dumb RequestProcessor implementation intended to get things running. 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class ContentFetcherB extends AbstractRequestProcessor {
    
    /**
     * @see com.topcoder.web.common.AbstractRequestProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        // the only thin that is processor does is definition
        // of real content page location
        setContentTag("about/index.jsp");  
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
     * @see com.topcoder.web.common.RequestProcessor#hasNextPageSameContext()
     */
    public boolean hasNextPageSameContext() {
        return false;
    }
}
