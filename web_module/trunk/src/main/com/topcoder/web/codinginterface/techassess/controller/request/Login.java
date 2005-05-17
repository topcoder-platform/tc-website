package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;
import com.topcoder.shared.netCommon.screening.request.ScreeningTermsRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningLoginResponse;
import com.topcoder.shared.netCommon.screening.response.ScreeningTermsResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.messaging.TimeExpiredException;
import com.topcoder.shared.messaging.TimeOutException;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;

import java.io.IOException;
import java.util.Map;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Login extends Base {

    protected static Logger log = Logger.getLogger(Login.class);

    private static final String QUERY = "select s.session_id" +
                                " from session s" +
                                 " , user u" +
                            "      , session_profile sp" +
                             " where s.user_id = u.user_id" +
                            "    and sp.session_profile_id = s.session_profile_id" +
                            "    and current between s.begin_time and s.end_time" +
                            "    and sp.company_id= @cid@" +
                            "    and u.handle = 'gpaul@topcoder.com'";

    protected void techAssessProcessing() throws Exception {

        String handle = null;
        String password = null;

        setDefault(Constants.COMPANY_ID, new Long(getCompanyId()));
        setDefault(Constants.FRESH_REQUEST, String.valueOf(true));

        if (hasParameter(Constants.SESSION_ID)) {
            try {
                setSessionId(Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)));
            } catch (NumberFormatException e) {
                throw new NavigationException("Request missing required parameter");
            }
        } else {
                try {
                    getSessionId();
                } catch (Exception e) {
                    //look up the session in the db.  this is a temp hoke, remove this once old session have expired.
                    QueryRequest q = new QueryRequest();

                    StringBuffer buf = new StringBuffer(1000);
                    buf.append("select s.session_id");
                    buf.append(" from session s");
                    buf.append(" , user u");
                    buf.append("      , session_profile sp");
                    buf.append(" where s.user_id = u.user_id");
                    buf.append("    and sp.session_profile_id = s.session_profile_id");
                    buf.append("    and current between s.begin_time and s.end_time");
                    buf.append("    and sp.company_id=").append(getCompanyId());
                    buf.append("    and u.handle = '").append(getRequest().getParameter(Constants.HANDLE)).append("'");
                    q.addQuery("main", QUERY);
                    QueryDataAccess qda = new QueryDataAccess(DBMS.SCREENING_OLTP_DATASOURCE_NAME);
                    Map m = qda.getData(q);
                    ResultSetContainer rsc = (ResultSetContainer)m.get("main");
                    if (rsc.isEmpty()) {
                        addError(Constants.HANDLE, "Sorry you do not have an active session at this time.");
                    } else {
                        log.debug("got session " + rsc.getLongItem(0, "session_id"));
                        setSessionId(rsc.getLongItem(0, "session_id"));
                    }

                }

        }
/*
        } else if (!hasParameter(Constants.SESSION_ID)&&getSessionId()<0) {
            throw new NavigationException("Request missing required parameter");
        }
*/

        if (hasParameter(Constants.HANDLE)) {
            handle = getRequest().getParameter(Constants.HANDLE);
            setDefault(Constants.HANDLE, handle);

            if (hasParameter(Constants.PASSWORD)) {
                password = getRequest().getParameter(Constants.PASSWORD);
            } else {
                addError(Constants.PASSWORD, "Please enter your password");
            }

            if (hasErrors()) {
                loadTerms(true);
                closeProcessingPage(buildProcessorRequestString(Constants.RP_LOGIN_RESPONSE,
                        new String[]{Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));
            } else {
                ScreeningLoginRequest request = new ScreeningLoginRequest(handle, password, getCompanyId());
                request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
                request.setSessionID(getSessionId());

                try {
                    send(request);
                } catch (ServerBusyException e) {
                    throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                            "When using this tool, please wait for a response before you attempt to proceed.");
                }

                showProcessingPage();

                ScreeningLoginResponse response = (ScreeningLoginResponse) receive(10000);


                if (response.isSuccess()) {
                    getAuthentication().login(new SimpleUser(response.getUserID(), "", ""));
                    //setSessionId(response.getSessionID());
                } else {
                    loadTerms(false);
                    addError(Constants.HANDLE, response.getMessage());
                }

                /* send them over to the login response page.  we're including the message
                 * id parameter so that we can be sure that we can accurately link the response
                 * and the response together.  we're going over the top for this because it's
                 * possible that they have two browsers logged in in the same session.  if they
                 * submitted two of these requests at the same time, we wouldn't know which response
                 * should go to which browser without the message id.
                 */
                closeProcessingPage(buildProcessorRequestString(Constants.RP_LOGIN_RESPONSE,
                        new String[]{Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));


            }
        } else {
            loadTerms(true);
            closeProcessingPage(buildProcessorRequestString(Constants.RP_LOGIN_RESPONSE,
                    new String[]{Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));
        }

    }

    /**
     * Loads up the terms.  This is just a tad sketchy, cuz we're not going to a processing page
     * but lets hope that things happen fast enough that it's a non-issue.  i wouldn't expect
     * a browser to time out that fast.
     * @throws TCWebException
     * @throws TimeExpiredException
     * @throws TimeOutException
     */
    protected void loadTerms(boolean showProcessing) throws TCWebException, TimeExpiredException, TimeOutException, IOException {
        log.debug("loadTerms() called ...");
        ScreeningTermsRequest termsRequest = new ScreeningTermsRequest(getCompanyId());
        termsRequest.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);

        try {
            send(termsRequest);
        } catch (ServerBusyException e) {
            throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                    "When using this tool, please wait for a response before you attempt to proceed.");
        }
        if (showProcessing) showProcessingPage();
        ScreeningTermsResponse termsResponse = (ScreeningTermsResponse) receive(10000);

        if (termsResponse.getMessage()!=null) {
            //log.debug("terms are " + termsResponse.getMessage());
            setDefault(CodingInterfaceConstants.TERMS, termsResponse.getMessage());
        }



    }


}
