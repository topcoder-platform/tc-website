package com.topcoder.web.screening.request;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;

import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.CandidateInfo;

/** 
 * <p>
 * This preprocesses the CandidateSetup page so that if an existing candidate
 * is being edited, the information for that candidate will be loaded.
 * </p>
 *
 * <p>
 * Checks the request for an existing <code>CandidateInfo</code>
 * object.  If it does not exist, checks to see if there is a candidate 
 * id in the parameter list of the request.  If so, then it lookups
 * up the CandidateInfo for that id.
 * </p>
 *
 * @author Dan Tomalesky (grim@xynesis.com)
 * @version 1.0
 */
public class PopulateCandidate extends BaseProcessor {
    public void process() throws Exception {
        ServletRequest request = getRequest();
        String uId = request.getParameter(Constants.USER_ID);
        if(request.getAttribute(Constants.CANDIDATE_INFO) == null 
           && uId != null) {
            CandidateInfo info = new CandidateInfo();
            info.setIsNew(false);
            long userId = Long.parseLong(uId);

            //do some kind of db lookup
            InitialContext context = new InitialContext();
            EmailHome eHome = (EmailHome)PortableRemoteObject.narrow(
                    context.lookup(EmailHome.class.getName()),
                    EmailHome.class);
            Email email = eHome.create();
            
            //will throw exception or return null?
            info.setUserId(new Long(userId));

            long emailId = email.getPrimaryForUser(userId);
            info.setEmailAddress(email.getAddress(emailId, userId));
            //info.setPassword(coder.getPassword(candidateId));

            request.setAttribute(Constants.CANDIDATE_INFO, info);
        }

        setNextPage(Constants.CANDIDATE_SETUP_PAGE);
        setNextPageInContext(true);
    }
}
