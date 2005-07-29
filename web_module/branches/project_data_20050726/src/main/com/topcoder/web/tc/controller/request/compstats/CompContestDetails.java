/*
 * CompContestDetails.java
 *
 * Created on July 27, 2005
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author cucu
 */
public class CompContestDetails extends Base {

    private ResultSetContainer findProjects(String compId, String versId, String phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("find_projects");

        // Find all the projects that match with the component id, version and phase
        r.setProperty("compid", compId);
        r.setProperty("vr", versId);
        r.setProperty("pi", phaseId);

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        return (ResultSetContainer) result.get("find_projects");
    }


    protected void businessProcessing() throws TCWebException {
        try {
            String projId;
            String compId;
            String versId;
            String phaseId;


            ResultSetContainer dates = null;

            // 1. if there is comp, vers and type, use the winning project
            // 2. if there is comp,vers,type and pid use that project
            // 3. if there is just pid, use that project and find out its comp+vers+type
            if (hasParameter("compid")) {
                if (!hasParameter("pi")) {
                    throw new TCWebException("parameter 'pi' expected when 'compid' is specified");
                }
                if (!hasParameter("vr")) {
                    throw new TCWebException("parameter 'vers' expected when 'compid' is specified");
                }

                compId = getRequest().getParameter("compid");
                versId = getRequest().getParameter("vr");
                phaseId = getRequest().getParameter("pi");

                dates = findProjects(compId, versId, phaseId);

                if (dates.size() == 0) {
                    throw new TCWebException("component with compId=" + compId + ", vr= " + versId + ", pi=" + phaseId + " not found.");
                }


                if (hasParameter("pj")) {
                    // if the project was passed as a parameter, use it.
                    projId = getRequest().getParameter("pj");
                } else {

                    // the project wasn't passed as a parameter, so the "best" project must be found:
                    // - if there is a closed project (with status=4), choose it
                    // - if not, choose the one that has the later date (the last, because they're ordered)
                    for (int i=0; i < dates.size(); i++) {
                        projId = dates.getStringItem(i, "project_id");
                        if (dates.getIntItem(i,"status_id") == 4) {
                            break;
                        }
                    }
                }

            } else {
                if(!hasParameter("pj")) {
                    throw new TCWebException("either comp+vr+pi or pj expected as parameters");
                }


                projId = getRequest().getParameter("pj");
/*
                Request r = new Request();
                r.setContentHandle("comp_contest_details");
                r.setProperty("project_id", projId);

                DataAccessInt dai = getDataAccess(true);
                Map result = dai.getData(r);
                ResultSetContainer rsc = (ResultSetContainer) result.get("???");

                //select component_id, version_id, phase from project where project_id = 'projectId'
                if(rsc.size() == 0) {
                }
                //compId =
*/
            }

            Request r = new Request();
            r.setContentHandle("comp_contest_details");

            r.setProperty("pj", projId);

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);


            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("pid", Long.decode(projId));
            getRequest().setAttribute("dates", dates);


            setNextPage("/compstats/compContestDetails.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
