package com.topcoder.web.corp.controller;

import java.io.IOException;
//import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RequestProcessor;

/** STUB ONLY FOR TESTING.
 * For Testing Only - A Servlet Stub to test Static requestProcessor
 * It just sets up the Static requestProcessor so it can determine where 
 * to go and then forwards the user to that static location.
 * 
 * @author Greg Paul , djFD , swif0ne
 * @version $Revision$
 *
 */
public class MainServletStub extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServletStub.class);
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                                   throws ServletException, IOException {
        log.debug("URI Request received: "+request.getRequestURI() + "?" +
                   request.getQueryString());
        RequestProcessor currentProc = new com.topcoder.web.corp.request.Static();
        currentProc.setRequest(request);
        try {
            currentProc.process();
        }
        catch (Exception e) {
            // failed to process
            log.debug("uri received failed to process: "+e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        /* request has processed forward user to stub implementations of 
         * RequestProcessor will set 'where-to-go' attribute of request. So 
         * we will return to user same jsp page.  It is template.jsp and it 
         * will fill responese with real content using that tag */
        String whereToGo = currentProc.getNextPage();
        getServletContext().getRequestDispatcher(whereToGo).forward(request, response);
        return;
    }

    /**
     * For now it is just synonym for doGet.
     *
     * @param request the servlet request object
     * @param  response the servlet response object
     *
     * @throws ServletException
     * @throws IOException
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     *
     * */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doDelete(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doDelete(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doDelete(arg0, arg1);
    }

    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doOptions(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doOptions(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doOptions(arg0, arg1);
    }

    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doPut(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doPut(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doPut(arg0, arg1);
    }

    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doTrace(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doTrace(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doTrace(arg0, arg1);
    }
}




