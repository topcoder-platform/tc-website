package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningLoginResponse;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.VBLanguage;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Login extends Base {

    protected static Logger log = Logger.getLogger(Login.class);

    protected void businessProcessing() throws Exception {

        String handle = null;
        String password = null;
        long companyId = 0;

        if (hasParameter(Constants.COMPANY_ID)) {
            companyId = Long.parseLong(getRequest().getParameter(Constants.COMPANY_ID));
            setDefault(Constants.COMPANY_ID, new Long(companyId));
        } else {
            throw new NavigationException("Invalid request, missing required parameter.");
        }

        if (hasParameter(Constants.HANDLE)) {
            handle = getRequest().getParameter(Constants.HANDLE);
            setDefault(Constants.HANDLE, handle);

            if (hasParameter(Constants.PASSWORD)) {
                password = getRequest().getParameter(Constants.PASSWORD);
            } else {
                addError(Constants.PASSWORD, "Please enter your password");
            }

            if (hasErrors()) {
                setNextPage(Constants.PAGE_LOGIN);
                setIsNextPageInContext(true);
            } else {
                ScreeningLoginRequest request = new ScreeningLoginRequest(handle, password, companyId);
                request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
                String messageId = send(request);
                receive(5000, messageId);
            }
        } else {
            setNextPage(Constants.PAGE_LOGIN);
            setIsNextPageInContext(true);
        }

    }

    protected void postProcessing(Message resp) throws Exception {
        ScreeningLoginResponse response = (ScreeningLoginResponse)resp;
        if (response.isSuccess()) {
            getAuthentication().login(new SimpleUser(response.getUserID(), "", ""));
            ScreeningProblemSet[] problemSets = response.getProblemSets();

            ArrayList examples = new ArrayList();
            ArrayList testSetA = new ArrayList();
            ArrayList testSetB = new ArrayList();

            for (int i=0; i<problemSets.length; i++) {
                if (problemSets[i].getType().intValue()==Constants.TEST_SET_A_ID) {
                    testSetA.add(problemSets[i]);
                } else if (problemSets[i].getType().intValue()==Constants.TEST_SET_B_ID) {
                    testSetB.add(problemSets[i]);
                } else if (problemSets[i].getType().intValue()==Constants.EXAMPLE_ID) {
                    examples.add(problemSets[i]);
                }
            }

            getRequest().getSession().setAttribute(Constants.EXAMPLES, examples);
            getRequest().getSession().setAttribute(Constants.TEST_SET_A, testSetA);
            getRequest().getSession().setAttribute(Constants.TEST_SET_B, testSetB);
            getRequest().getSession().setAttribute(Constants.LANGUAGES, getLanguages(response));

            SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            //go to the default after login
            setNextPage(info.getServletPath());

        } else {
            addError(Constants.HANDLE, response.getMessage());
            setNextPage(Constants.PAGE_LOGIN);
            setIsNextPageInContext(true);
        }
    }

    private ArrayList getLanguages(ScreeningLoginResponse response) {
        ArrayList languageIds= response.getAllowedLanguages();
        ArrayList languages = new ArrayList(languageIds.size());
        for (Iterator it = languageIds.iterator(); it.hasNext();) {
            switch (((Integer)it.next()).intValue()) {
                case JavaLanguage.ID : {
                    languages.add(JavaLanguage.JAVA_LANGUAGE);
                    break;
                }

                case CPPLanguage.ID : {
                    languages.add(CPPLanguage.CPP_LANGUAGE);
                    break;
                }

                case CSharpLanguage.ID : {
                    languages.add(CSharpLanguage.CSHARP_LANGUAGE);
                    break;
                }

                case VBLanguage.ID : {
                    languages.add(VBLanguage.VB_LANGUAGE);
                    break;
                }
            }
        }
        return languages;
    }

}
