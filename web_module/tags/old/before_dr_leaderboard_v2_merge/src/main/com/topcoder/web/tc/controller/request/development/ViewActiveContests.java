package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 4, 2006
 */
public class ViewActiveContests extends Base {
    private String PHASE_ID_KEY = Constants.PHASE_ID;
    
    protected void developmentProcessing() throws TCWebException {
        try {
            int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(PHASE_ID_KEY)));
            if (!(phase_id == SoftwareComponent.DESIGN_PHASE || phase_id == SoftwareComponent.DEV_PHASE)) {
                throw new TCWebException("Missing or invalid phase_id parameter (" + PHASE_ID_KEY + ") expected)");
            }
            getRequest().setAttribute("phase_id_is_design", new Boolean(phase_id == SoftwareComponent.DESIGN_PHASE));
            
            Request r = new Request();
            r.setContentHandle("active_contests");
            getRequest().setAttribute("resultMap", getDataAccess().getData(r));
            setNextPage("/dev/activeContests.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
