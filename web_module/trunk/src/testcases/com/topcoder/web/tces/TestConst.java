
/**
 * interface for constants
 * For Node #, view class PageNumTest or "_site_flow.gif" in docs\tces 
 * 
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/20/2002
 *
 */
public interface TestConst{

	public static final String ROOT_URL				= "http://65.112.118.204/tces/tces?";

	public static final String LOGIN_URL			= ROOT_URL + "task=LoginTask";
	public static final String LOGIN_FORM			= "login";
	public static final String USER_FIELD			= "handle";
	public static final String PASSWORD_FIELD		= "password";
	public static final String USER_DATA			= "dok";
	public static final String PASSWORD_DATA		= "password";

//	public static final String MAIN_URL				= ROOT_URL + "task=MainTask";



	public static final String TABLE_ID						= "dataTable";

	// link text
	public static final String VIEW_HIT_LINK_TEXT			= "View Hit Details";
	public static final String VIEW_COL_DEMO_LINK_TEXT		= "View collective demographic info";

	public static final String CODER_DEMO_LINK_TEXT			= "Coder Demographic info";
	public static final String CODER_COMP_HIST_LINK_TEXT	= "Coder Competition History";
	public static final String CODER_PROB_SUBM_LINK_TEXT	= "Coder Problem Submissions";
	public static final String MEMBER_INTEREST_LINK_TEXT	= "View Member Interest";

	public static final String RATING_HIST_GRAPH_LINK_TEXT			= "Rating History Graph";
	public static final String OVERALL_RATING_DIST_GRAPH_LINK_TEXT	= "Overall Rating Distribution Graph";
	
	public static final String PROB_STMT_LINK_TEXT			= "Problem Statement";

	// link href from table
	public static final String PAGE_3_LINK_HREF		= "CampaignDetailTask";
	public static final String PAGE_5_LINK_HREF		= "PositionInterestTask";
	public static final String PAGE_7_LINK_HREF		= "MemberProfileTask";
	public static final String PAGE_13_LINK_HREF	= "CompetitionStatisticsTask";
	public static final String PAGE_14_LINK_HREF	= "ProblemStatisticsTask";



}// end TestConst


