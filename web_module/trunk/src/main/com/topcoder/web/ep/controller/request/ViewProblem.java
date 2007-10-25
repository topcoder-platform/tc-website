/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import java.io.StringReader;

import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewProblem extends ShortBase {

    private static Logger log = Logger.getLogger(ViewProblem.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            
            Long ComponentId = getComponentParam();

            Component c = null;
            if (ComponentId != null) {
                c = getFactory().getComponentDAO().find(ComponentId);
            }
            
            if (c == null) {
                throw new TCWebException("Couldn't find Component");
            }
            
            String problemText = c.getComponentText();
            StringReader reader = new StringReader(problemText);
            ProblemComponent pc[] = new ProblemComponent[1];
            pc[0] = new ProblemComponentFactory().buildFromXML(reader, true);
            Problem problem = new Problem();
            problem.setProblemTypeID(Problem.TYPE_SINGLE);
            problem.setProblemComponents(pc);
            getRequest().setAttribute("problem", problem);
            getRequest().setAttribute("language", BaseLanguage.getLanguage(JavaLanguage.ID));

            
            setNextPage("/problemStatement.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
    
    private Long getComponentParam() throws TCWebException {
        String componentId = StringUtils.checkNull(getRequest().getParameter(Constants.COMPONENT_ID));
        
        if (componentId.equals("")) {
            throw new TCWebException("Invalid component id");
        }

        Long id;
        try {
            id = Long.parseLong(componentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid component id");
        }
        
        return id;
    }
}
