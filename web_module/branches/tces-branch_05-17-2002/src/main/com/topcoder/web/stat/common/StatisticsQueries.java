package com.topcoder.web.stat.common;


/** 
 * This interface represents tokens used throughout the DW access objects
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.2  2002/05/09 03:15:28  steveb
 *           Added STRING data type constant
 *           SB
 *
 *           Revision 1.1.1.1  2002/04/02 17:20:38  steveb
 *           initial web load into cvs
 *
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
 *           Revision 1.4  2002/02/06 11:58:29  dpecora
 *           Got the EJB running successfully.  Also updated the scripts to put the
 *           data in the various query tables, in response to various table structure
 *           changes and column renaming.
 *
 *           Revision 1.3  2002/02/06 07:50:55  tbone
 *           moved common stuff to token interface
 *
 *           Revision 1.2  2002/02/06 06:53:56  tbone
 *           added contest id -  Feel free to change the token if you like
 *
 *
 */
public interface StatisticsQueries extends StatisticsTokens {
    // Specifies which set of queries to run
    public static final String COMMAND_ID = StatisticsTokens.CONTENT_ID;
    
    // Various query set inputs.  Constants should be limited
    // to at most 5 characters, per the input_code field of the
    // DW table query_inputs.  Do not change these without updating
    // the data warehouse query table.
	
//TCB	moved this into parent-class since it's not really DW specific.
/*	public static final String CONTEST_ID = "ct";
    public static final String ROUND_ID = "rd";
    public static final String ROOM_ID = "rm";
    public static final String CODER_ID = "cr";
    public static final String PROBLEM_ID = "pm";
    public static final String START_DATE = "sd"; // Currently unused
    public static final String END_DATE = "ed";
    public static final String NUMBER_RECORDS = "nr";
    public static final String START_RANK = "sr";
    public static final String END_RANK = "er";
    public static final String CONTEST_ID = "ct";
    public static final String END_RANK = "er"; */

    // Query input data types.  Should not be confused with
    // TCResultItem output data types.  Numbered starting from
    // 1001 to avoid conflicts with the other users of the
    // data_type table (specifically, the problem table).
    public static final int INTEGER_INPUT = 1001;
    public static final int DECIMAL_INPUT = 1002;
    public static final int DATE_INPUT = 1003;
    public static final int SORT_DIRECTION_INPUT = 1004;
    public static final int STRING_INPUT = 1005;

    // Other query set items.  Do not change without updating the
    // data warehouse query table.
    public static final char INPUT_DELIMITER = '@';
    public static final char SPECIAL_DEFAULT_MARKER = '$';
    public static final String DEFAULT_TODAY = SPECIAL_DEFAULT_MARKER + "TODAY";
}

