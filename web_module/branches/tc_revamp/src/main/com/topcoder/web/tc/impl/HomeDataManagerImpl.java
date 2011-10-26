/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.HomeDataManager;
import com.topcoder.web.tc.HomeDataManagerException;
import com.topcoder.web.tc.dto.ActiveContestsSummary;
import com.topcoder.web.tc.dto.MemberInfo;
import com.topcoder.web.tc.dto.TopTenDTO;

/**
 * <p>
 * This is the default implementation of HomeDataManager. It connects to the existing methods defined 
 * in Share common package.
 * This Class is used to retrieve data for the following
 * Member Profile
 * Top10 Details
 * ActiveContests Summary  
 * </p>
 * @author kanakarajank
 * @version 1.0
 */
public class HomeDataManagerImpl implements HomeDataManager {

	/**
	 * <p>
	 * Represent the class name.
	 * </p>
	 */
	private static final String CLASS_NAME = HomeDataManagerImpl.class
			.getName();

	/**
	 * <p>
	 * The Logger object used for logging. It's a constant. So it can only be
	 * that constant value It is final and won't change once it is initialized
	 * as part of variable declaration to:
	 * Logger.getLogger(HomeDataManageImpl.class). It is used throughout the
	 * class wherever logging is needed.
	 * </p>
	 */
	private static final Logger LOGGER = Logger
			.getLogger(ActiveContestsManagerImpl.class);

	/**
	 * This function retrieves the Member Details for the given coderId.
	 * 
	 * @param coderId Id of the Coder for which the member details are required
	 * @return MemberInfo  memberInfo instance containing the details of the member
	 */
	public MemberInfo retrieveMemberDetails(long coderId) {
		Helper.checkNotNull("coderId", coderId);
		// Log the entry
		final String signature = CLASS_NAME
				+ ".retrieveActiveContests(String, SortingOrder, int, int, ActiveContestFilter)";
		Helper.logEntrance(LOGGER, signature, new String[] { "coderId" },
				new Object[] { coderId });
		final long startTime = System.currentTimeMillis();
		MemberInfo memberInfo = null;
		try {
			CachedDataAccess dwDai = new CachedDataAccess(
					DBMS.DW_DATASOURCE_NAME);
			Request dataRequest = new Request();
			dataRequest.setContentHandle("member_profile");
			dataRequest.setProperty("cr", String.valueOf(coderId));
			Map<String, ResultSetContainer> map = dwDai.getData(dataRequest);
			ResultSetContainer resultSetContainer = map.get("Coder_Data");
			if (resultSetContainer != null && resultSetContainer.size() > 0) {
				ResultSetRow row = resultSetContainer.get(0);
				memberInfo = new MemberInfo();
				if (row.getItem("handle").getResultData() != null) {
					memberInfo.setHandleId(row.getStringItem("handle"));
				}
				if (row.getItem("coder_id").getResultData() != null) {
					memberInfo.setCoderId(row.getLongItem("coder_id"));
				}
				if (row.getItem("rating").getResultData() != null) {
					memberInfo.setRating(row.getLongItem("rating"));
				}
				if (row.getItem("total_earnings").getResultData() != null) {
					memberInfo.setTotalEarnings(row
							.getDoubleItem("total_earnings"));
				}
				if (row.getItem("design_rating").getResultData() != null) {
					memberInfo
							.setDesignRating(row.getLongItem("design_rating"));
				}
				if (row.getItem("development_rating").getResultData() != null) {
					memberInfo.setDevelopmentRating(row
							.getLongItem("development_rating"));
				}
				if (row.getItem("concept_rating").getResultData() != null) {
					memberInfo.setConceptRating(row
							.getLongItem("concept_rating"));
				}
				if (row.getItem("spec_rating").getResultData() != null) {
					memberInfo.setSpecRating(row.getLongItem("spec_rating"));
				}
				if (row.getItem("arch_rating").getResultData() != null) {
					memberInfo.setArchRating(row.getLongItem("arch_rating"));
				}
				if (row.getItem("assembly_rating").getResultData() != null) {
					memberInfo.setAssemblyRating(row
							.getLongItem("assembly_rating"));
				}
				if (row.getItem("test_rating").getResultData() != null) {
					memberInfo.setTestRating(row.getLongItem("test_rating"));
				}
				if (row.getItem("test_scenarios_rating").getResultData() != null) {
					memberInfo.setTestScenariosRating(row
							.getLongItem("test_scenarios_rating"));
				}
				if (row.getItem("ui_prototype_rating").getResultData() != null) {
					memberInfo.setUiPrototypeRating(row
							.getLongItem("ui_prototype_rating"));
				}
				if (row.getItem("ria_build_rating").getResultData() != null) {
					memberInfo.setRiaBuildRating(row
							.getLongItem("ria_build_rating"));
				}
				if (row.getItem("mm_rating").getResultData() != null) {
					memberInfo.setMmRating(row.getLongItem("mm_rating"));
				}
				if (row.getItem("design_earnings").getResultData() != null) {
					memberInfo.setDesignEarnings(row
							.getDoubleItem("design_earnings"));
				}
				if (row.getItem("development_earnings").getResultData() != null) {
					memberInfo.setDevelopmentEarnings(row
							.getDoubleItem("development_earnings"));
				}
				if (row.getItem("overall_earnings").getResultData() != null) {
					memberInfo.setOverallEarnings(row
							.getDoubleItem("overall_earnings"));
				}
				resultSetContainer = map.get("Current_User_Info");
				if (resultSetContainer != null && resultSetContainer.size() > 0) {
					row = resultSetContainer.get(0);
					if (row.getItem("has_image").getResultData() != null) {
						memberInfo.setHasImage(row.getIntItem("has_image"));
					}
				}
			}
			// log exit
			Helper.logExit(LOGGER, signature, startTime, memberInfo);
			return memberInfo;
		} catch (TCWebException e) {
			Log4jUtility
					.logException(
							LOGGER,
							"loadMemberData()",
							new HomeDataManagerException(
									"TCWebException occured while retrieving Member Data ",
									e));
		} catch (Exception e) {
			Log4jUtility.logException(LOGGER, "loadMemberData()", e);
		}
		return memberInfo;
	}

	/**
	 * This function retrieves the Top10 Details for each contest type from the existing methods defined 
	 * in Shared code.
	 * 
	 * @return Map<String, List<TopTenDTO>> Map of the Top10 category and the corresponding List of the Top 10 details of the category
	 */
	public Map<String, List<TopTenDTO>> retrieveTop10Details() {
		Map<String, List<TopTenDTO>> topTenDetails = new HashMap<String, List<TopTenDTO>>();
		try {
			CachedDataAccess dwDai = new CachedDataAccess(
					DBMS.DW_DATASOURCE_NAME);
			Request dataRequest = new Request();
			dataRequest.setContentHandle("public_home_data");
			dataRequest.setProperty("sr", "1");
			dataRequest.setProperty("er", "10"); // just get the top 10

			Map<String, ResultSetContainer> map = dwDai.getData(dataRequest);
			// Get the coder Ratings
			populateTopTenDetails(topTenDetails, "coderRatings",
					map.get("Coder_Ratings"));
			// Get the Top MM Coders
			populateTopTenDetails(topTenDetails, "topMmCoders",
					map.get("marathon_coder_rank"));
			// Get the School Avg Rating
			populateTopTenDetails(topTenDetails, "schoolAvgRating",
					map.get("School_Avg_Rating"));
			// Get the Country Avg Rating
			populateTopTenDetails(topTenDetails, "countryAvgRating",
					map.get("Country_Avg_Rating"));
			// Get the Top Developers
			populateTopTenDetails(topTenDetails, "topDevelopers",
					map.get("top_developers"));
			// Get the Top Designers
			populateTopTenDetails(topTenDetails, "topDesigners",
					map.get("top_designers"));
			// Get the Top Conceptors
			populateTopTenDetails(topTenDetails, "topConceptors",
					map.get("top_conceptors"));
			// Get the Top Specificators
			populateTopTenDetails(topTenDetails, "topSpecificators",
					map.get("top_specificators"));
			// Get the Top Architects
			populateTopTenDetails(topTenDetails, "topArchitects",
					map.get("top_architects"));
			// Get the Top Assemblers
			populateTopTenDetails(topTenDetails, "topAssemblers",
					map.get("top_assemblers"));
			// Get the Top Testers
			populateTopTenDetails(topTenDetails, "topTesters",
					map.get("top_testers"));
		} catch (TCWebException e) {
			Log4jUtility
					.logException(
							LOGGER,
							"retrieveTop10Details()",
							new HomeDataManagerException(
									"TCWebException occured while retrieving Top 10 Details ",
									e));
		} catch (Exception e) {
			Log4jUtility.logException(LOGGER, "retrieveTop10Details()", e);
		}
		return topTenDetails;
	}

	/**
	 * Utility method to populate the data into TopTenDTO from the resultSetContainer
	 * 
	 * @param topTenDetails Input Map which contains the Category to Top10 Details
	 * @param rsContainer ResultSet Container
	 */
	private void populateTopTenDetails(
			Map<String, List<TopTenDTO>> topTenDetails, String key,
			ResultSetContainer rsContainer) {
		List<TopTenDTO> list = null;
		if (rsContainer != null && rsContainer.size() > 0) {
			list = new ArrayList<TopTenDTO>();
			for (ResultSetRow row : rsContainer) {
				TopTenDTO topTenDto = new TopTenDTO();
				if (row.getItem("coder_id").getResultData() != null) {
					topTenDto.setCoderId(row.getLongItem("coder_id"));
				}
				if (row.getItem("handle").getResultData() != null) {
					topTenDto.setHandle(row.getStringItem("handle"));
				}
				if (row.getItem("rating").getResultData() != null) {
					topTenDto.setRating(row.getLongItem("rating"));
				}
				if (row.getItem("rank").getResultData() != null) {
					topTenDto.setRank(row.getIntItem("rank"));
				}
				if (row.getItem("name").getResultData() != null) {
					topTenDto.setName(row.getStringItem("name"));
				}
				if (row.getItem("avg_rating").getResultData() != null) {
					topTenDto.setAvgRating(row.getDoubleItem("avg_rating"));
				}
				if (row.getItem("country_code").getResultData() != null) {
					topTenDto.setCountryCode(row.getIntItem("country_code"));
				}
				list.add(topTenDto);
			}
			topTenDetails.put(key, list);
		} else {
			// Insert Dummy Data
			list = new ArrayList<TopTenDTO>();
			TopTenDTO topTenDto = new TopTenDTO();
			topTenDto.setCoderId(132456);
			topTenDto.setHandle("heffan");
			topTenDto.setName("School1");
			topTenDto.setRank(1);
			topTenDto.setRating(1234);
			topTenDto.setAvgRating(1234.5);
			list.add(topTenDto);
			topTenDetails.put(key, list);
		}
	}

	/**
	 * Retrieves the ActiveContestsSummary for various Contest Type from the existing methods and 
	 * form a Map with that to be used in the HomeAction.
	 * 
	 * @return  Map<String, ActiveContestsSummary> Map containing the Category and the correspodning ActiveContestSummary Details
	 * 
	 */
	public Map<String, ActiveContestsSummary> retrieveActiveContestsSummary() {
		Map<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
		try {
			CachedDataAccess dai = new CachedDataAccess(
					MaxAge.QUARTER_HOUR.age(), DBMS.TCS_OLTP_DATASOURCE_NAME);
			Request dataRequest = new Request();
			dataRequest.setContentHandle("homepage_active_contest_summary");

			Map<String, ResultSetContainer> dataMap = dai.getData(dataRequest);

			ActiveContestsSummary summary;

			ResultSetContainer dr = dataMap.get("dr_active_contests_summary");
			if (!dr.isEmpty()) {
				ResultSetContainer.ResultSetRow row = dr.get(0);
				LOGGER.debug("dr contests " + row.getIntItem("total_contests"));
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName("Digital Run");
				if (row.getItem("dr_points").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("dr_points"));
				}
				ret.put(HomeDataManager.DR, summary);
			}

			ResultSetContainer arch = dataMap
					.get("architecture_active_contests_summary");
			if (!arch.isEmpty()) {
				ResultSetContainer.ResultSetRow row = arch.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.ARCHITECTURE, summary);
			}

			ResultSetContainer concept = dataMap
					.get("conceptualization_active_contests_summary");
			if (!concept.isEmpty()) {
				ResultSetContainer.ResultSetRow row = concept.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.CONCEPTUALIZATION, summary);
			}

			ResultSetContainer spec = dataMap
					.get("specification_active_contests_summary");
			if (!spec.isEmpty()) {
				ResultSetContainer.ResultSetRow row = spec.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.SPECIFICATION, summary);
			}

			ResultSetContainer uiprototype = dataMap
					.get("ui_prototype_active_contests_summary");
			if (!uiprototype.isEmpty()) {
				ResultSetContainer.ResultSetRow row = uiprototype.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.UI_PROTOTYPE, summary);
			}

			ResultSetContainer riabuild = dataMap
					.get("ria_build_active_contests_summary");
			if (!riabuild.isEmpty()) {
				ResultSetContainer.ResultSetRow row = riabuild.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.RIA_BUILD, summary);
			}

			ResultSetContainer riacomponent = dataMap
					.get("ria_component_active_contests_summary");
			if (!riacomponent.isEmpty()) {
				ResultSetContainer.ResultSetRow row = riacomponent.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.RIA_COMPONENT, summary);
			}

			ResultSetContainer copilotposting = dataMap
					.get("copilot_posting_active_contests_summary");
			if (!copilotposting.isEmpty()) {
				ResultSetContainer.ResultSetRow row = copilotposting.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.COPILOT_POSTING, summary);
			}

			ResultSetContainer contentcreation = dataMap
					.get("content_creation_active_contests_summary");
			if (!contentcreation.isEmpty()) {
				ResultSetContainer.ResultSetRow row = contentcreation.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.CONTENT_CREATION, summary);
			}

			for (ResultSetContainer.ResultSetRow row : dataMap
					.get("homepage_active_contest_summary")) {
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName(row.getStringItem("category_name"));
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}

				switch (row.getIntItem("project_category_id")) {

				case 4: {
					ret.put(HomeDataManager.DESIGN, summary);
					break;
				}
				case 8: {
					ret.put(HomeDataManager.DEVELOPMENT, summary);
					break;
				}
				case 6: {
					ret.put(HomeDataManager.ASSEMBLY, summary);
					break;
				}
				case 7: {
					ret.put(HomeDataManager.TEST_SUITES, summary);
					break;
				}
				case 5: {
					ret.put(HomeDataManager.TEST_SCENARIOS, summary);
					break;
				}
				}
			}

			dai = new CachedDataAccess(MaxAge.QUARTER_HOUR.age(),
					DBMS.STUDIO_DATASOURCE_NAME);
			dataRequest = new Request();
			dataRequest.setContentHandle("active_contests_summary");

			ResultSetContainer rsc = dai.getData(dataRequest).get(
					"active_contests_summary");
			if (!rsc.isEmpty()) {
				ResultSetContainer.ResultSetRow row = rsc.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName("Studio");
				if (rsc.get(0).getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.STUDIO, summary);
			}

			dai = new CachedDataAccess(MaxAge.QUARTER_HOUR.age(),
					DBMS.JIRA_DATASOURCE_NAME);
			dataRequest = new Request();
			dataRequest.setContentHandle("bug_race_active_contests_summary");

			ResultSetContainer bugRace = dai.getData(dataRequest).get(
					"bug_race_active_contests_summary");
			if (!bugRace.isEmpty()) {
				ResultSetContainer.ResultSetRow row = bugRace.get(0);
				summary = new ActiveContestsSummary();
				summary.setContestCount(row.getIntItem("total_contests"));
				summary.setName("Bug Races");
				if (row.getItem("total_prizes").getResultData() != null) {
					summary.setPrizeTotal(row.getFloatItem("total_prizes"));
				}
				ret.put(HomeDataManager.BUGS, summary);
			}
		} catch (TCWebException e) {
			Log4jUtility
					.logException(
							LOGGER,
							"retrieveActiveContestsSummary()",
							new HomeDataManagerException(
									"TCWebException occured while retrieving Active Contests ",
									e));
		} catch (Exception e) {
			Log4jUtility.logException(LOGGER,
					"retrieveActiveContestsSummary()", e);
		}
		return ret;
	}


}
