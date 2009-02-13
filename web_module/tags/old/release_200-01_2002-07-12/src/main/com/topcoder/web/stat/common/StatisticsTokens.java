package com.topcoder.web.stat.common;


/** 
 * This interface represents tokens used throughout the system
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.1  2002/03/16 20:18:40  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.5  2002/02/27 10:35:25  dpecora
 *           A number of changes:
 *           - Added support for required input arguments to default input queries
 *           - Added support for data sorting prior to row selection
 *           - Removed exception printout from data retrieval bean; it was a duplicate
 *           of the EJB exception printout info
 *           - Added scrolling by room for round statistics
 *           - Various other query modifications
 *
 *           Revision 1.4  2002/02/19 07:12:53  dpecora
 *           Add sort functionality driven from URL
 *
 *           Revision 1.3  2002/02/13 08:35:22  dpecora
 *           Add javadocs, implement ranklists
 *
 *           Revision 1.2  2002/02/10 11:32:25  dpecora
 *           added division ID
 *
 *           Revision 1.1  2002/02/06 07:50:35  tbone
 *           added to CVS
 *
 *           Revision 1.2  2002/02/06 06:53:56  tbone
 *           added contest id -  Feel free to change the token if you like
 *
 *
 */
public interface StatisticsTokens {
    // Specifies which set of queries to run
    public static final String CONTENT_ID = "c";
    
    // Various query set inputs.  Constants should be limited
    // to at most 5 characters, per the input_code field of the
    // DW table query_inputs.  Do not change these without updating
    // the data warehouse query table.
    public static final String CONTEST_ID = "ct";
    public static final String ROUND_ID = "rd";
    public static final String ROOM_ID = "rm";
    public static final String CODER_ID = "cr";
    public static final String PROBLEM_ID = "pm";
    public static final String START_DATE = "sd"; // Currently unused
    public static final String END_DATE = "ed";
    public static final String NUMBER_RECORDS = "nr";
    public static final String START_RANK = "sr";
    public static final String END_RANK = "er";
    public static final String DIVISION_ID = "dn";
    public static final String SORT_COLUMN = "sc"; // Zero-based sort column
    public static final String SORT_QUERY = "sq"; // Which query to execute sort on (by query name)
    public static final String SORT_DIRECTION = "sd"; // Which direction to sort (asc/desc)
    public static final String BASE_ROOM = "br";
    public static final String START_ROOM = "sm";
    public static final String END_ROOM = "em";
}

