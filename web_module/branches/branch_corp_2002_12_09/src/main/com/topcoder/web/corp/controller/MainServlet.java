package com.topcoder.web.corp.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RequestProcessor;

/**
 * The servlet to handle requests to corporate site. For now it is a stub only.
 * It is supposed, that all requests to corporate site will go thru it.
 * It implements next simple logic. Request is valid if URI has next
 * representation: /portal/?N where n is number from 1 to 2. Any other requests
 * supposed to be invalid and will result as 404 not found. What content wiil
 * send to user is defined by web.xml.
 * 
 * @author Greg Paul , modified by djFD
 * @version $Revision$
 *
 */
public class MainServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);
    
    private RequestProcessor proc1 = null;
    private RequestProcessor proc2 = null;

    /**
     * Initializes the servlet. What content will be feed is defined from
     * servlet config accepted
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        //com.topcoder.web.query.common.Constants.init(getServletConfig());
        try {
            proc1 = (RequestProcessor)Class.forName(config.getInitParameter("processor-1")).newInstance();
            log.debug("destination 1 ok");
        }
        catch (Exception e) {
            log.error("destination1 disabled ("+e.getMessage()+")");
        }

        try {
            proc2 = (RequestProcessor)Class.forName(config.getInitParameter("processor-2")).newInstance();
            log.debug("destination 2 ok");
        }
        catch (Exception e) {
            log.error("destination2 disabled ("+e.getMessage()+")");
        }
    }

    /**
     * Returns -1 when URI specified is invalid (look at class description to
     * see what requests are valid). 
     * @param req request to the content
     * @return int destination: eiter 1 or two when URI is valid, otherwise -1
     */
    private int getDestination(HttpServletRequest req) {
        int n = req.getContextPath().trim().length();
        String reqRelURI = req.getRequestURI().trim().substring(n);
        if( ! "/".equals(reqRelURI) ) {
            return -1;
        }
        try {
            int dest = Integer.parseInt(req.getQueryString());
            if( dest == 1 || dest ==2 ) {
                return dest;
            }
        }
        catch(Exception e) {
        }
        return -1;
    }

    /**
     * First of all checks if URI is valid. If it is not, then responds by HTTP
     * 404 not found. When request is valid, method process it with either of
     * two supplied request processors (if they were successfuly instantiated at
     * init stage, else same 404 not found). If processor fails to process
     * request, 404 not found returned again.
     * 
     * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest, HttpServletResponse)
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int destination = 0;
        if( (destination=getDestination(request)) < 0 ) {
            log.debug("invalid uri: "+request.getRequestURI()+"?"+request.getQueryString());
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        RequestProcessor currentProc = null;
        // so uri is valid
        switch (destination) {
            case 1 :
                log.debug("uri1 received");
                if( proc1 == null ) {
                    log.debug("processor for given uri not found: "+request.getRequestURI()+"?"+request.getQueryString());
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                else {
                    currentProc = proc1;
                }
                break;

            default :
                log.debug("uri2 received");
                if( proc2 == null ) {
                    log.debug("processor for given uri not found: "+request.getRequestURI()+"?"+request.getQueryString());
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                else {
                    currentProc = proc2;
                }
                break;
        }

        currentProc.prepare(request, response);
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
        
        //well, request has processed 
        //stub implementations of RequestProcessor will set
        //'where-to-go' attribute of request. So we will return to user same jsp page.
        //It is template.jsp and it will fill responese with real content using that tag
        getServletContext().getRequestDispatcher("/content.jsp").forward(request, response);
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




