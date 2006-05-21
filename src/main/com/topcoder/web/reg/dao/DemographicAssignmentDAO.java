package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.CoderType;
import com.topcoder.web.reg.model.State;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public interface DemographicAssignmentDAO {

    List getAssignments(CoderType ct, State s, Set regTypes);

}
