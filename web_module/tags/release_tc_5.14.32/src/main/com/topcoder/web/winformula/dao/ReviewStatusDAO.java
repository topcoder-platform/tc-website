package com.topcoder.web.winformula.dao;

import com.topcoder.web.winformula.model.ReviewStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public interface ReviewStatusDAO {
    ReviewStatus find(Integer id);

    List getReviewStatuses();
}
