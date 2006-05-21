package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.DemographicAnswer;
import com.topcoder.web.reg.model.DemographicQuestion;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface DemographicAnswerDAO {
    DemographicAnswer find(Long id);
    DemographicAnswer findDecline(DemographicQuestion dq);
    DemographicAnswer findFreeForm(DemographicQuestion dq);
}
