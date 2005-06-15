package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;

import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.common.ServicesConstants;
import com.topcoder.shared.common.TCContext;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.screening.common.ScreeningContext;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.codinginterface.messaging.WebResponsePool;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.netCommon.screening.response.ScreeningBaseResponse;
import com.topcoder.shared.netCommon.screening.response.ScreeningTimeExpiredResponse;

public class Submit extends Base {
    private static final Set waiting = new HashSet();

    protected void businessProcessing() throws TCWebException {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        long uid = getUser().getId();
        int pid = 0, rid = 0, cid = 0, language;
        try {
            pid = Integer.parseInt(getRequest().getParameter(Constants.COMPONENT_ID));
        } catch (Exception e) {
            throw new TCWebException("Error parsing "+Constants.COMPONENT_ID+": " + getRequest().getParameter(Constants.COMPONENT_ID));
        }
        try {
            rid = Integer.parseInt(getRequest().getParameter(Constants.ROUND_ID));
        } catch (Exception e) {
            throw new TCWebException("Error parsing "+Constants.ROUND_ID+": " + getRequest().getParameter(Constants.ROUND_ID));
        }
        try {
            cid = Integer.parseInt(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (Exception e) {
            throw new TCWebException("Error parsing "+Constants.CONTEST_ID+": " + getRequest().getParameter(Constants.CONTEST_ID));
        }
        String code = StringUtils.checkNull(getRequest().getParameter(Constants.CODE));
        if(code.length()==0){
            setNextPage(Constants.JSP_ADDR + Constants.SUBMISSION_JSP);
            return;
        }
        try {
            language = Integer.parseInt(getRequest().getParameter(Constants.LANGUAGE_ID));
        } catch (Exception e) {
            throw new TCWebException("Error parsing "+Constants.LANGUAGE_ID+": " + getRequest().getParameter(Constants.LANGUAGE_ID));
        }
        LongCompileRequest lcr = new LongCompileRequest((int)uid,pid,rid,cid,language,ApplicationServer.WEB_SERVER_ID,code);

        synchronized(waiting){
            if(!waiting.add(new Long(uid)))throw new TCWebException("A submit request is already being processed.");
        }
        
        send(lcr);

        try{
        	showProcessingPage("Compiling...");

            LongCompileResponse res = receive(30*1000,uid,pid);
            synchronized(waiting){
        	    waiting.remove(new Long(uid));
            }
        //send errors and stuff
            getRequest().getSession().setAttribute(Constants.CODE, code);
            getRequest().getSession().setAttribute(Constants.COMPILE_STATUS, new Boolean(res.getCompileStatus()));
            getRequest().getSession().setAttribute(Constants.COMPILE_MESSAGE, res.getCompileError());
            
            closeProcessingPage(buildProcessorRequestString("Submit",
                    new String[]{Constants.ROUND_ID,Constants.CONTEST_ID,Constants.COMPONENT_ID,Constants.LANGUAGE_ID},
                    new String[]{String.valueOf(rid),String.valueOf(cid),String.valueOf(pid),String.valueOf(language)}));
        }catch(TimeOutException e){
            throw new TCWebException("Your code compilation timed out.");
        }catch(IOException e){
        	e.printStackTrace();
            throw new TCWebException("An error occurred while compiling your code");
        }

    }
}
