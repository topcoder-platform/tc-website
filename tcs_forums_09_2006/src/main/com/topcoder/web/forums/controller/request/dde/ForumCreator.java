/*
 * Created on May 2, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request.dde;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.database.DbForumCategory;
import com.jivesoftware.forum.database.DbForumFactory;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author billy
 * 
 * Creates a new Jive forum based on the "old" forum ID
 * (assuming that one is automatically generated
 * when a new component is created)
 */
public class ForumCreator {

	private static final String GET_COMPONENT_INFO_PS =
			"select c.component_name, c.short_desc, c.status_id, v.comp_vers_id, v.version_text, v.phase_id "
		+ " from comp_versions v, comp_catalog c "
		+ " where v.component_id = c.component_id and c.component_id=?";
	
	private static final String GET_TECH_TYPE_PS =
			"select tech.technology_type_id "
		+ " from comp_forum_xref f, comp_technology tech "
		+ " where f.forum_id = ? and f.comp_vers_id = tech.comp_vers_id";
	
	private static final int ROOT_CATEGORY_ID = 1;
	
	private long componentId;
	private String componentName;
	private String shortDescription;
	private long statusId;
	private long versionId;
	private String versionText;
	private long phaseId;
	
	//private ForumMaster forumToAdd;
	private String technologyTypeProperty;
	private DbForumCategory devCategory;
	private DbForumCategory custCategory;
	
	/**
	 * Makes a ForumCreator based on the component ID
	 * @param componentId The component ID of the forums to be created
	 */
	public ForumCreator(long componentId) {
		this.componentId = componentId;
	}
	
	/**
	 * Adds customer and developer forums to Jive
	 * 
	 * @return The category IDs for the new forums, in the format [customer forum ID, developer forum ID]
	 * @throws Exception
	 */
	public long[] addForums() throws Exception {
		getForumDataFromTC();
		addForumToJive();
		addCategoriesToCustomerForum();
		addCategoriesToDeveloperForum();
		return new long[]{custCategory.getID(), devCategory.getID()};
	}
	
	/**
	 * Queries TC database to get information
	 * on the component which is saved in Jive
	 * 
	 * @throws Exception
	 */
	private void getForumDataFromTC() throws Exception {
		// get forums from FORUM_MASTER table
		Connection tcConnection = null;
		PreparedStatement forumPS = null;
		PreparedStatement techPS = null;
		ResultSet rs = null;
		
		try {
			tcConnection = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
	        forumPS = tcConnection.prepareStatement(GET_COMPONENT_INFO_PS);
	        forumPS.setLong(1, componentId);
	        
	        rs = forumPS.executeQuery();
	        if(rs.next()) {
	        	componentName = rs.getString(1);
	        	shortDescription = rs.getString(2);
	        	statusId = rs.getLong(3);
	        	versionId = rs.getLong(4);
	        	versionText = rs.getString(5);
	        	phaseId = rs.getLong(6);
	        } else {
	        	throw new Exception("Component ID not found in TC database");
	        }
	        rs.close();
	        
	        // get technology types for this category
	        techPS = tcConnection.prepareStatement(GET_TECH_TYPE_PS);
	        techPS.setLong(1, componentId);
	        // holds list of technology types in form "1,5,15"
	        StringBuffer techTypeList = new StringBuffer();
	        rs = techPS.executeQuery();
	        while(rs.next()) {
	        	if(techTypeList.length() > 0) {
	        		techTypeList.append(",");
	        	}
	        	techTypeList.append(rs.getLong(1));
	        }
	        technologyTypeProperty = techTypeList.toString();
	        rs.close();
		} finally {        
			DBMS.close(tcConnection, forumPS, rs);
		}
	}
	
	/**
	 * Adds the customer and developer forums for the component
	 * 
	 * @throws ForumCategoryNotFoundException If the root category is not found
	 */
	private void addForumToJive() throws ForumCategoryNotFoundException {
		DbForumCategory root = new DbForumCategory(ROOT_CATEGORY_ID);
		Date curTime = new Date();
		
        // customer category
        custCategory = (DbForumCategory) root.createCategory(componentName, shortDescription);
        custCategory.setCreationDate(curTime);
        custCategory.setModificationDate(curTime);
        custCategory.setProperty("status", "active");           
        custCategory.setProperty("componentStatus", statusId + "");
        custCategory.setProperty("compVersId", versionId + "");
        custCategory.setProperty("forumType", ForumConstants.CUSTOMER_FORUM);
        custCategory.setProperty("versionText", versionText);
        custCategory.setProperty("technologyType", technologyTypeProperty);
        
        // developer category
        devCategory = (DbForumCategory) root.createCategory(componentName, shortDescription);
        devCategory.setCreationDate(curTime);
        devCategory.setModificationDate(curTime);
        devCategory.setProperty("status", "active");           
        devCategory.setProperty("componentStatus", statusId + "");
        devCategory.setProperty("compVersId", versionId + "");
        devCategory.setProperty("forumType", ForumConstants.DEVELOPER_FORUM);
        devCategory.setProperty("versionText", versionText);
        devCategory.setProperty("technologyType", technologyTypeProperty);
	}
	
	/**
	 * Add default (sub)categories to customer forum
	 *
	 */
	private void addCategoriesToCustomerForum() {
		String[][] subforumsToAdd = {
			{"Scope", "Describe the specific functional requirements of a new component or request a component enhancement."},
			{"Component Interface Requirements", "Explain the graphical, internal or external interfaces for the component."},
			{"Example of Software Usage", "An example that steps through the required process flow for the problem to be solved."},
			{"GUI Requirements", "Graphical User Interface, if applicable."},
			{"Environment Requirements", "Software and hardware interfaces."},
			{"User Requirements", "Describe who will be using the component."},
			{"External Interfaces", "Describe the required external interfaces for the component."},
			{"Logic Requirements", "What problems does the software solve? What advantage will the software provide? What will the software replace?"}
		};
		
		DbForumFactory forumFactory = DbForumFactory.getInstance();
		for (int i=0; i < subforumsToAdd.length; i++) {
			forumFactory.createForum(subforumsToAdd[i][0], subforumsToAdd[i][1], custCategory);
		}
	}
	
	/**
	 * Add default (sub)categories to developer forum
	 *
	 */
	private void addCategoriesToDeveloperForum() {
		String[][] subforumsToAdd = {
			{"Design Phase Documents", "Documents for design projects"},
			{"Design Phase Questions", "Development questions and answers"},
			{"Development Phase Documents", "Documents for development projects"},
			{"Development Phase Questions", "Development questions and answers"}
		};
		
		DbForumFactory forumFactory = DbForumFactory.getInstance();
		for (int i=0; i < subforumsToAdd.length; i++) {
			forumFactory.createForum(subforumsToAdd[i][0], subforumsToAdd[i][1], devCategory);
		}
	}
}