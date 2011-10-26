package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.DemographicAnswer;
import com.topcoder.web.common.model.DemographicQuestion;


/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface DemographicAnswerDAO {
    DemographicAnswer find(Long id);

    DemographicAnswer findDecline(DemographicQuestion dq);

    DemographicAnswer findFreeForm(DemographicQuestion dq);
}
