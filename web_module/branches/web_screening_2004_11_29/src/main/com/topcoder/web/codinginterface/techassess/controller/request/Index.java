package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.netCommon.screening.request.ScreeningGetProblemSetsRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningGetProblemSetsResponse;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.VBLanguage;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Index extends Base {


    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            ScreeningGetProblemSetsRequest request = new ScreeningGetProblemSetsRequest();
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage(buildProcessorRequestString(Constants.RP_INDEX_RESPONSE,
                    new String[] {Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));

            ScreeningGetProblemSetsResponse response = (ScreeningGetProblemSetsResponse)receive(5000);

            ScreeningProblemSet[] problemSets = response.getProblemSets();
            ArrayList sets = new ArrayList();
            for (int i=0; i<problemSets.length; i++) {
                sets.add(problemSets[i]);
            }
            log.debug("there are " + sets.size() + " problem sets");

            getRequest().getSession().setAttribute(Constants.PROBLEM_SETS, sets);
            getRequest().getSession().setAttribute(Constants.LANGUAGES, getLanguages(response));

            closeProcessingPage();

        }

    }


    private ArrayList getLanguages(ScreeningGetProblemSetsResponse response) {
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
