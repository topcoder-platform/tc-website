package com.topcoder.common.web.constant;

import java.util.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.data.stat.coder.*;


public class Sort {


  public static final int             DEFAULT_REFERRAL_SORT_KEY    = com.topcoder.common.web.data.stat.coder.Coder.MEMBER_SINCE;
  public static final char            DEFAULT_REFERRAL_SORT_DIR    = 'D';

  public static final int             DEFAULT_CODER_RANK_SORT_KEY  = com.topcoder.common.web.data.stat.coder.Rank.RANK;
  public static final char            DEFAULT_CODER_RANK_SORT_DIR  = 'A';

  public static final int             DEFAULT_CODER_STAT_SORT_KEY  = com.topcoder.common.web.data.stat.contest.RoomResult.USER_NAME;
  public static final char            DEFAULT_CODER_STAT_SORT_DIR  = 'D';

  public static final int             DEFAULT_RATINGS_HISTORY_SORT_KEY = com.topcoder.common.web.data.stat.coder.Rating.EVENT_DATE;
  public static final char            DEFAULT_RATINGS_HISTORY_SORT_DIR = 'D';

  public static final int             DEFAULT_EARNINGS_HISTORY_SORT_KEY = com.topcoder.common.web.data.stat.coder.Earning.EVENT_DATE;
  public static final char            DEFAULT_EARNINGS_HISTORY_SORT_DIR = 'D';


}
