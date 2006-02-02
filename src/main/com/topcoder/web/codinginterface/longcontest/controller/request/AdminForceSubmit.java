package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;

import java.util.Enumeration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2006
 */
public class AdminForceSubmit extends Base {

    protected void longContestProcessing() throws Exception {
        //get all the submissions that need to be submited and do so

        //need to have: user id, component id, round_id, contest_id, language_id
        //then lookup the code, and submit it

        if (getSessionInfo().isAdmin()) {
            throw new NavigationException("Shame on you, you're no admin.");
        } else {
            String name;
            StringBuffer buf = new StringBuffer(1000);
            int count = 0;
            String message;
            for (Enumeration enum = getRequest().getParameterNames(); enum.hasMoreElements();) {
                name = (String)enum.nextElement();
                log.debug(name);
                if (name.startsWith(Constants.SUBMISSION_PREFIX) && "on".equals(getRequest().getParameter(name))) {
                    String[] ids = name.substring(Constants.SUBMISSION_PREFIX.length()-1).split(",");
                    long coderId = Long.parseLong(ids[0]);
                    long componentId = Long.parseLong(ids[1]);
                    long roundId = Long.parseLong(ids[2]);
                    long contestId = Long.parseLong(ids[3]);
                    int languageId = Integer.parseInt(ids[4]);
                    int subNum = Integer.parseInt(ids[5]);

                    try {
                        submit(coderId, componentId, roundId, contestId, languageId, getCode(coderId, componentId, roundId, subNum));
                        message = "submitted successfully";
                    } catch (Exception e) {
                        message = e.getMessage();
                        if (log.isDebugEnabled()) {
                            e.printStackTrace();
                        }
                    }
                    count++;
                    buf.append(coderId).append(",").append(componentId);
                    buf.append(" ").append(message).append("\n");
                }
            }
            buf.insert(0, count+" submissions made\n\n");
            getRequest().setAttribute(Constants.MESSAGE, buf.toString());
            setNextPage("/admin/results.jsp");
            setIsNextPageInContext(true);
        }
    }

    private String getCode(long coderId, long componentId, long roundId, int subNum) throws Exception {
        Request r= new Request();
        r.setContentHandle("long_contest_submission_text");
        r.setProperty(Constants.CODER_ID, String.valueOf(coderId));
        r.setProperty(Constants.COMPONENT_ID, String.valueOf(componentId));
        r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        r.setProperty(Constants.SUBMISSION_NUMBER, String.valueOf(subNum));
        return ((ResultSetContainer)getDataAccess().getData(r).get("long_contest_submission_text")).getStringItem(0, "submission_text");
    }

    private void submit(long coderId, long componentId, long roundId, long contestId, int languageId, String code) throws TCWebException {
        log.debug("submit: " + coderId + " " + componentId + " " + roundId + " " + contestId + " " + languageId);
        LongCompileRequest lcr = new LongCompileRequest((int) coderId, (int)componentId, (int)roundId, (int)contestId,
        languageId, ApplicationServer.WEB_SERVER_ID, code);

        try {
            send(lcr);
        } catch (ServerBusyException sbe) {
            throw new NavigationException("A submit request is already being processed.");
        }

        try {
            receive(0, coderId, componentId);
        } catch (TimeOutException e) {
            //ignore...this is supposed to happen.  we don't care about the response, we just
            //want to load up the queue
        }

    }
}
