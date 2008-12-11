package com.topcoder.web.csf.dao;


import com.topcoder.web.csf.model.ReviewStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public interface ReviewStatusDAO {
    ReviewStatus find(Integer id);

    List getReviewStatuses();
}
