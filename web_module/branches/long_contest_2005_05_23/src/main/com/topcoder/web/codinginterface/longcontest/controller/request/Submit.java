package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.io.IOException;
import java.util.*;

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
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCRequest;

public class Submit extends Base {
    private static final Set waiting = new HashSet();

    protected void businessProcessing() throws TCWebException {
        TCRequest request = getRequest();

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        long uid = getUser().getId();
        int pid = 0, rid = 0, cid = 0, language;
        try {
            pid = Integer.parseInt(request.getParameter(Constants.COMPONENT_ID));
            rid = Integer.parseInt(request.getParameter(Constants.ROUND_ID));
            cid = Integer.parseInt(request.getParameter(Constants.CONTEST_ID));
            Request r = new Request();
            r.setContentHandle("long_submission");
            r.setProperty(Constants.CODER_ID,String.valueOf(uid));
            r.setProperty(Constants.COMPONENT_ID,String.valueOf(cid));
            r.setProperty(Constants.ROUND_ID,String.valueOf(rid));
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            ResultSetContainer lang = (ResultSetContainer)m.get("long_languages");
            request.setAttribute(Constants.LANGUAGES, lang);

            String code = StringUtils.checkNull(request.getParameter(Constants.CODE));
            if(code.length()==0){
                ResultSetContainer rsc = (ResultSetContainer)m.get("long_recent_submission");
                if(rsc.size() > 0){
                    code = rsc.getStringItem(0,"submission_text");
                    language = rsc.getIntItem(0,"language_id");
                    request.setAttribute(Constants.CODE, code);
                    request.setAttribute(Constants.SELECTED_LANGUAGE, new Integer(language));
                }else{
                    request.setAttribute(Constants.CODE, "");
                    request.setAttribute(Constants.SELECTED_LANGUAGE, -1);
                }
                setNextPage(Constants.SUBMISSION_JSP);
                setIsNextPageInContext(true);
                return;
            }
            language = Integer.parseInt(request.getParameter(Constants.LANGUAGE_ID));
            LongCompileRequest lcr = new LongCompileRequest((int)uid,pid,rid,cid,language,ApplicationServer.WEB_SERVER_ID,code);

            synchronized(waiting){
                if(!waiting.add(new Long(uid)))throw new TCWebException("A submit request.is already being processed.");
            }

            send(lcr);

            showProcessingPage("Compiling...");

            LongCompileResponse res = receive(30*1000,uid,pid);
            //send errors and stuff
            request.setAttribute(Constants.CODE, code);
            request.setAttribute(Constants.SELECTED_LANGUAGE, new Integer(language));
            request.setAttribute(Constants.COMPILE_STATUS, new Boolean(res.getCompileStatus()));
            request.setAttribute(Constants.COMPILE_MESSAGE, res.getCompileError());

            closeProcessingPage(buildProcessorRequestString("Submit",
                        new String[]{Constants.ROUND_ID,Constants.CONTEST_ID,Constants.COMPONENT_ID,Constants.LANGUAGE_ID},
                        new String[]{String.valueOf(rid),String.valueOf(cid),String.valueOf(pid),String.valueOf(language)}));
        }catch(TimeOutException e){
            synchronized(waiting){
                waiting.remove(new Long(uid));
            }
            throw new TCWebException("Your code compilation timed out.");
        } catch (Exception e) {
            synchronized(waiting){
                waiting.remove(new Long(uid));
            }
            e.printStackTrace();
            throw new TCWebException("An error occurred while compiling your code");
        }
        synchronized(waiting){
            waiting.remove(new Long(uid));
        }
    }
}
