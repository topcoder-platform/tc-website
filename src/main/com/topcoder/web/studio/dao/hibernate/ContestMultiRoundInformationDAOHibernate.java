/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.studio.dao.ContestMultiRoundInformationDAO;
import com.topcoder.web.studio.model.ContestMultiRoundInformation;

/**
 * <p>This class implements the hibernate DAO to be used for accessing/managing the data for existing contest
 * Multi Round information in persistent data store.</p>
 *
 * @author pulky
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class ContestMultiRoundInformationDAOHibernate extends GenericBase<ContestMultiRoundInformation, Long>
    implements ContestMultiRoundInformationDAO {
}
