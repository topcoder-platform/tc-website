package com.topcoder.web.screening.request;

import javax.servlet.ServletRequest;

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
        String candId = request.getParameter("candidateId");
        if(request.getAttribute("candidateInfo") == null 
           && candId != null) {
            CandidateInfo info = new CandidateInfo();
            long candidateId = Long.parseLong(candId);

            //do some kind of db lookup
            //InitialContext context = new InitialContext();
            //CoderHome cHome = context.lookup("coderHomeJNDIname thingY");
            //Coder coder = cHome.create();
            
            //will throw exception or return null?
            info.setCandidateId(new Long(candidateId));
            //info.setEmailAddress(coder.getEmailAddress(candidateId));
            //info.setPassword(coder.getPassword(candidateId));

            request.setAttribute("candidateInfo", info);
        }

        setNextPage("/context/candidate/candidateSetup.jsp");
        setNextPageInContext(true);
    }
}
