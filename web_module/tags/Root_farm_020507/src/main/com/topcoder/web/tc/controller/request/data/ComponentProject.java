package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.DataResource;

import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 23, 2007
 */
public class ComponentProject extends Base {


    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("dd_project_data");
        r.setProperty(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));

        DataResource resource = new DataResource(r.getContentHandle());
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            //for now we'll assume they're gettin data from the warehouse, perhaps that'll change later
            Map m = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true).getData(r);

        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

//project
    //project_id
    //component name
    //phase desc
    //category desc
    //posting date
    //submit by date
    //complete date
    //rating date
    //status desc
    //version text
    //num submissions passed review
    //num registrations
    //num submissions
    //num_valid submissions
    //winner id
    //winner handle
    //stage
    //digital run?

    //submission
    //handle
    //user id
    //
    //review
    //reviewer
    //user id
    //num appeals
    //num successful appeals
    //final score
    //raw score
    //reviewer responsibility


}
