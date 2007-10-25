/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.algo.ProblemSet;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewProblemSet extends ShortBase {

    private static Logger log = Logger.getLogger(ViewProblemSet.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            
            Integer problemSetId = getProblemSetParam();

            ProblemSet ps = null;
            if (problemSetId != null) {
                ps = getFactory().getProblemSetDAO().find(problemSetId);
            }
            
            if (ps == null) {
                throw new TCWebException("Couldn't find problem set");
            }
            
            getRequest().setAttribute("problem_set", ps);
            
            setNextPage("/problemSetDescription.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
    
    private Integer getProblemSetParam() throws TCWebException {
        String problemSetId = StringUtils.checkNull(getRequest().getParameter(Constants.PROBLEM_SET_ID));
        
        if (problemSetId.equals("")) {
            throw new TCWebException("Invalid problem set id");
        }

        Integer id;
        try {
            id = Integer.parseInt(problemSetId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid problem set id");
        }
        
        return id;
    }


}
