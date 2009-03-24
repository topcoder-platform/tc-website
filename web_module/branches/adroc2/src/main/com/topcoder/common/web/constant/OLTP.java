package com.topcoder.common.web.constant;


/** Constants related to the transactional database
 *  @author Steve Burrows
 *  @version $Revision$
 *
 */
public class OLTP {

    public static final int CODER_USER_TYPE_ID = 1;
    public static final int CODER_GROUP_ID = 10;
    public static final int STAFF_GROUP_ID = 13;
    public static final int MEMBER_REFERRAL = 40;
    public static final int DEFAULT_RATING = 0;
    public static final int JOB_FAIR_REFERRAL_ID = 6;


    public static String[] POSTGRES_ACTIVE_CODER_CRITERIA = {
        " users.status='A'"
        , " LOWER(users.email) NOT LIKE '%topcoder.com'"
        , " group_users.group_id = "
            + CODER_GROUP_ID
        , " NOT EXISTS ( SELECT 1 FROM group_users WHERE group_id = "
            + STAFF_GROUP_ID
            + " AND user_id = coder.coder_id )"

    };


    public static String[] INFORMIX_ACTIVE_CODER_CRITERIA = {
        " user.status='A'"
        , " LOWER(user.email) NOT LIKE '%topcoder.com'"
        , " group_user.group_id = "
            + CODER_GROUP_ID
        , " NOT EXISTS ( SELECT 1 FROM group_user WHERE group_id = "
            + STAFF_GROUP_ID
            + " AND user_id = coder.coder_id )"

    };


}

