package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningTestRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningTestResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.common.NavigationException;

import java.util.ArrayList;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:41 AM
 */
public class Test extends Base {

    protected void techAssessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {


            long componentId = 0;
            int problemTypeId = 0;

            if (hasParameter(Constants.COMPONENT_ID)) {
                componentId = Long.parseLong(getRequest().getParameter(Constants.COMPONENT_ID).trim());
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            if (hasParameter(Constants.PROBLEM_TYPE_ID)) {
                problemTypeId = Integer.parseInt(getRequest().getParameter(Constants.PROBLEM_TYPE_ID).trim());
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            ArrayList arguments = new ArrayList();


            String arg = null;
            String dim = null;
            for (int i = 0; (arg = getRequest().getParameter(CodingInterfaceConstants.TEST_ARGUMENT + i)) != null; i++) {
                dim = getRequest().getParameter(CodingInterfaceConstants.TEST_ARGUMENT_DIMENSION + i);
                //log.debug("arg " + i + " dimension is " + dim + " content is " + arg);
                if (dim != null && dim.trim().length() > 0 && Integer.parseInt(dim) > 0) {
                    arguments.add(parseArrayInput(arg));
                } else {
                    arguments.add(arg);
                }
            }

            //log.debug("args" + arguments);

            ScreeningTestRequest request = new ScreeningTestRequest(arguments, componentId, problemTypeId);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            try {
                send(request);
            } catch (ServerBusyException e) {
                setNextPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM,
                        new String[]{Constants.PROBLEM_TYPE_ID, Constants.COMPONENT_ID},
                        new String[]{getRequest().getParameter(Constants.PROBLEM_TYPE_ID),
                                     getRequest().getParameter(Constants.COMPONENT_ID)}));
                setIsNextPageInContext(false);
                return;
            }

            showProcessingPage(Constants.SHORT_CONTENT);

            ScreeningTestResponse response = (ScreeningTestResponse) receive(5000);

            setDefault(Constants.MESSAGE, response.getMessage());
            //setDefault(CodingInterfaceConstants.SUCCESS_FLAG, String.valueOf(response.getStatus()));

            closeProcessingPage(buildProcessorRequestString(Constants.RP_TEST_RESPONSE,
                    new String[]{Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));

        }


    }

    private final int START = 0;
    private final int IN_QUOTE = 1;
    private final int ESCAPE = 2;


    /**
     * This we ripped off from <code>com.topcoder.client.screening.tool.view.frames.ArrayListInputDialog</code>
     * @param text
     */
    private ArrayList parseArrayInput(String text) {
        ArrayList ret = new ArrayList();

        text = text.trim();
        if (text.length() == 0)
            return ret;
        if (text.charAt(0) == '{')
            text = text.substring(1);
        if (text.charAt(text.length() - 1) == '}')
            text = text.substring(0, text.length() - 1);
        int state = START;
        StringBuffer buf = new StringBuffer(50);
        for (int i = 0; i < text.length(); i++) {
            char ch = text.charAt(i);
            switch (state) {
                case ESCAPE:
                    switch (ch) {
                        case '\\':
                            buf.append('\\');
                            break;
                        case '"':
                            buf.append('"');
                            break;
                        default : //we'll just assume it was a mistake, problems really should not use tabs, line feeds, etc.
                            buf.append('\\');
                            buf.append(ch);
                    }
                    state = IN_QUOTE;
                    break;
                case IN_QUOTE:
                    switch (ch) {
                        case '\\':
                            state = ESCAPE;
                            break;
                        case '"':
                            String param = buf.toString();
                            buf.delete(0, buf.length());
                            state = START;
                            if (param.length() > 50 || param.length() == 0) {
                                continue;
                            }
                            ret.add(param);
                            break;
                        default :
                            buf.append(ch);
                            break;
                    }
                    break;
                case START:
                    if (Character.isWhitespace(ch)) {
                        if (buf.length() > 0) {
                            String param = buf.toString().trim();
                            buf.delete(0, buf.length());
                            if (param.length() > 50) {
                                continue;
                            }
                            ret.add(param);
                        }
                        continue;
                    }
                    switch (ch) {
                        case '"':
                            if (buf.length() > 0) {
                                buf.append('"');
                            } else {
                                state = IN_QUOTE;
                            }
                            break;
                        case ',':
                            if (buf.length() > 0) {
                                String param = buf.toString().trim();
                                buf.delete(0, buf.length());
                                if (param.length() > 50) {
                                    continue;
                                }
                                ret.add(param);
                            }
                            break;
                        default :
                            buf.append(ch);
                    }
            }
        }
        if (buf.length() > 0) {
            String param = buf.toString().trim();
            buf.delete(0, buf.length());
            if (param.length() > 50) {
            } else {
                ret.add(param);
            }
        }
        return ret;
    }


}


