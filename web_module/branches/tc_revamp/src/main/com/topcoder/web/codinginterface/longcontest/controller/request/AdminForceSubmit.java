package com.topcoder.web.codinginterface.longcontest.controller.request;


import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;

import java.util.Enumeration;

/**
 * @author dok
 * @version $Revision: 65524 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 2, 2006
 */
public class AdminForceSubmit extends Base {

    protected void longContestProcessing() throws Exception {
        //get all the submissions that need to be submited and do so

        //need to have: user id, component id, round_id, contest_id, language_id
        //then lookup the code, and submit it

        if (!SecurityHelper.hasPermission(getAuthentication().getUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        } else {
            String name;
            StringBuffer buf = new StringBuffer(1000);
            int count = 0;
            String message;
            boolean example = Integer.parseInt(getRequest().getParameter(Constants.EXAMPLE_FLAG)) != 0;
            for (Enumeration enm = getRequest().getParameterNames(); enm.hasMoreElements();) {
                name = (String) enm.nextElement();
                log.debug(name);
                if (name.startsWith(Constants.SUBMISSION_PREFIX) && "on".equals(getRequest().getParameter(name))) {
                    String[] ids = name.substring(Constants.SUBMISSION_PREFIX.length()).split(",");
                    long coderId = Long.parseLong(ids[0]);
                    long componentId = Long.parseLong(ids[1]);
                    long roundId = Long.parseLong(ids[2]);
                    long contestId = Long.parseLong(ids[3]);
                    int languageId = Integer.parseInt(ids[4]);
                    int subNum = Integer.parseInt(ids[5]);

                    try {
                        submit(coderId, componentId, roundId, contestId, languageId, getCode(coderId, componentId, roundId, subNum, example), example);
                        message = "submitted successfully";
                    } catch (Exception e) {
                        message = e.getMessage();
                        if (log.isDebugEnabled()) {
                            log.debug(e,e);
                        }
                    }
                    count++;
                    buf.append(coderId).append(",").append(componentId);
                    buf.append(" ").append(message).append("\n");
                }
            }
            buf.insert(0, count + " submissions made\n\n");
            getRequest().setAttribute(Constants.MESSAGE, buf.toString());
            setNextPage("/admin/results.jsp");
            setIsNextPageInContext(true);
        }
    }

    private String getCode(long coderId, long componentId, long roundId, int subNum, boolean example) throws Exception {
        Request r = new Request();
        r.setContentHandle("long_contest_submission_text");
        r.setProperty(Constants.CODER_ID, String.valueOf(coderId));
        r.setProperty(Constants.COMPONENT_ID, String.valueOf(componentId));
        r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        r.setProperty(Constants.SUBMISSION_NUMBER, String.valueOf(subNum));
        r.setProperty(Constants.EXAMPLE_FLAG, example ? "1" : "0");
        return ((ResultSetContainer) getDataAccess().getData(r).get("long_contest_submission_text")).getStringItem(0, "submission_text");
    }

    private LongCompileResponse submit(long coderId, long componentId, long roundId, long contestId, int languageId, String code, boolean example) throws Exception {
        log.debug("submit: " + coderId + " " + componentId + " " + roundId + " " + contestId + " " + languageId);
        LongCompileRequest lcr = new LongCompileRequest(coderId, componentId, roundId, contestId,
                languageId, ApplicationServer.WEB_SERVER_ID, code, example);
        try {
            lock();
            try {
                return LongContestServicesLocator.getService().adminSubmitLong(lcr);
            } finally {
                unlock();
            }
        } catch (ServerBusyException sbe) {
            throw new NavigationException("A submit request is already being processed.");
        }
    }
}