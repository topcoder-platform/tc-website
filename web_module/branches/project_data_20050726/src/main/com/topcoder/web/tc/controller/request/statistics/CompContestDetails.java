/*
 * CompContestDetails.java
 *
 * Created on July 27, 2005
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.statistics;

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

    protected void businessProcessing() throws TCWebException {
        try {
            String projId;
            String compId;
            String versId;
            String type;

            Request r = new Request();
            r.setContentHandle("find_projects");
//                        select project_id from project where component_id = 'compId'
//                        and version_id = 'versId'
//                        and phase_id = ('type == 1'? 112 : 113)
//                        and status_id in (4,5,6)
//                        order by posting_date
// x
            DataAccessInt dai;
            Map result;
            ResultSetContainer rsc;


            // 1. if there is comp, vers and type, use the winning project
            // 2. if there is comp,vers,type and pid use that project
            // 3. if there is just pid, use that project and find out its comp+vers+type
            if(hasParameter("comp")) {
                if(!hasParameter("type")) {
                    throw new TCWebException("parameter 'type' expected when 'comp' is specified");
                }
                if(!hasParameter("vers")) {
                    throw new TCWebException("parameter 'vers' expected when 'comp' is specified");
                }

                compId = getRequest().getParameter("comp");
                type = getRequest().getParameter("type");
                versId = getRequest().getParameter("versId");


                if(hasParameter("pid")) {
                    projId = getRequest().getParameter("pid");
                } else {
                    // get the winning project

                    r.setProperty("component_id", compId);
                    r.setProperty("version_id", versId);
                    r.setProperty("phase_id", type == "1" ? "112" : "113");

                    dai = getDataAccess(true);
                    result = dai.getData(r);
                    rsc = (ResultSetContainer) result.get("find_projects");

                    if(rsc.size() == 0) {
//                        select project_id from project where component_id = 'compId'
//                        and version_id = 'versId'
//                        and phase_id = ('type == 1'? 112 : 113)
//                        and status_id = 4

                    }
                    if(rsc.size() > 1) {
                        throw new TCWebException("more than one winner found for that component; this shouldn't happen!");
                    }

                    projId = rsc.getStringItem(0, "project_id");

                }

            } else {
                if(!hasParameter("pid")) {
                    throw new TCWebException("either comp+vers+type or pid expected as parameters");
                }

                    dai = getDataAccess(true);
                    result = dai.getData(r);
                    rsc = (ResultSetContainer) result.get("find_projects");

/*                projId = getRequest().getParameter("pid");

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










            getRequest().setAttribute("resultMap", result);


            setNextPage("/statistics/compContestDetails.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
