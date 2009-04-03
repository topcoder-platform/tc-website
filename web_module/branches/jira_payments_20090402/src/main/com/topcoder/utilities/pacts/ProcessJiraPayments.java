/**
 * 
 */
package com.topcoder.utilities.pacts;

import java.io.File;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.rpc.ServiceException;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;

import com.atlassian.jira.rpc.soap.beans.RemoteComment;
import com.atlassian.jira.rpc.soap.beans.RemoteCustomFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssueType;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapService;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapServiceServiceLocator;

/**
 * @author ivern
 */
/**
 * @author Javier
 *
 */
public class ProcessJiraPayments extends DBUtility {
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;
    
    // TODO: Get these from configuration.
	private static final String JIRA_PAYMENTS_USER = "jira_payments";
	private static final String JIRA_PAYMENTS_PASSWORD = "t0pc0der76";
	private static final String JIRA_PAYMENTS_FILTER = "10634";
	
	private static final String JIRA_PAYMENT_STATUS_FIELD_KEY = "customfield_10030";
	private static final String JIRA_PAYMENT_AMOUNT_FIELD_ID = "customfield_10012";
	private static final String JIRA_PAYEE_FIELD_ID = "customfield_10040";
	private static final String JIRA_CLIENT_NICKNAME_FIELD_ID = "customfield_10074";
	private static final String JIRA_PROJECT_ID_FIELD_ID = "customfield_10090";
	private static final String JIRA_STUDIO_ID_FIELD_ID = "customfield_10091";
	
	private static final String QUERY_USER_ID_BY_HANDLE = "SELECT user_id FROM user WHERE handle = ?";
	
	private static final String QUERY_TOPCODER_PROJECT_INFO_BY_ID =
		"SELECT pi_name.value AS name" +
		"     , pi_version.value AS version" +
		"  FROM tcs_catalog:project_info pi_name" +
		"     , tcs_catalog:project_info pi_version" +
		" WHERE pi_name.project_id = ?" +
		"   AND pi_name.project_info_type_id = 6" +
		"   AND pi_version.project_id = pi_name.project_id" +
		"   AND pi_version.project_info_type_id = 7";
	
	private PreparedStatement queryUserIdByHandle = null;
	private PreparedStatement queryTopCoderProjectInfoById = null;
	
	private Map<String, String> clients = null;
	private Map<String, String> types = null;
	private Map<String, String> jiraIssueTypes = null;
	
	private DateFormat dateFormat = null;
	
	public ProcessJiraPayments() {
		super();
		
		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * @throws RuntimeException
	 */
	private void initializeDatabase() throws SQLException {
		// TODO: Nicer exception handling.
		queryUserIdByHandle = prepareStatement("informixoltp", QUERY_USER_ID_BY_HANDLE);
		queryTopCoderProjectInfoById = prepareStatement("informixoltp", QUERY_TOPCODER_PROJECT_INFO_BY_ID);
	}
	
	@Override
	protected void runUtility() throws Exception {
		try {
			initializeDatabase();
			
			PactsClientServices ejb = (PactsClientServices) createEJB();
			
			JiraSoapService jira = new JiraSoapServiceServiceLocator().getJirasoapserviceV2();
			
			String token = jira.login(JIRA_PAYMENTS_USER, JIRA_PAYMENTS_PASSWORD);
			
			initializeJiraIssueTypes(jira, token);
			
			RemoteIssue[] issuesToPay = jira.getIssuesFromFilter(token, JIRA_PAYMENTS_FILTER);
			
			for (RemoteIssue issue : issuesToPay) {				
				try {
					boolean reject = false;
					
					String type = getIssueType(issue);
					if (type == null) {
						reject = true;
						type = jiraIssueTypes.get(issue.getType());
					}
					
					String amountStr = getCustomFieldValueById(issue, JIRA_PAYMENT_AMOUNT_FIELD_ID);
					String payee = getCustomFieldValueById(issue, JIRA_PAYEE_FIELD_ID);
					String clientNickname = getCustomFieldValueById(issue, JIRA_CLIENT_NICKNAME_FIELD_ID);
					String projectId = getCustomFieldValueById(issue, JIRA_PROJECT_ID_FIELD_ID);
					String studioId = getCustomFieldValueById(issue, JIRA_STUDIO_ID_FIELD_ID);
				
					if (isNullOrEmpty(type) || isNullOrEmpty(amountStr) || isNullOrEmpty(payee)
							|| isNullOrEmpty(clientNickname)) {
						// TODO: Nice error message here.
						continue;
					}
					
					String projectType = null;
					long referenceId;
					String projectInfo = null;
					/*if (!(isNullOrEmpty(projectId) ^ isNullOrEmpty(studioId))) {
						// TODO: Nice error message here.
						continue;
					} else if (!isNullOrEmpty(projectId)) {*/
						projectType = "TopCoder";
//						referenceId = Long.parseLong(projectId);
						referenceId = 12345L;
						projectInfo = getTopCoderProjectInfoById(30006283);
/*					} else {
						projectType = "Studio";
						referenceId = Long.parseLong(studioId);
					}*/
					// FIXME: check that the reference id exists.  If it doesn't, this doesn't go.
					
					// Check for null, etc.
					String client = getClientName(clientNickname);
					if (client == null) {
						reject = true;
						client = clientNickname;
					}
					
					long userId = getUserIdByHandle(payee);
					
					double amount = Double.parseDouble(amountStr);
					
					String summary = "[" + issue.getKey() + "] - " + projectInfo;
					
					log.info("runUtility: [" + (reject ? "REJECTED" : "ACCEPTED") + "] - (payment type: " + type
							+ ", project type: " + projectType + ", reference id: " + referenceId + ", user id: "
							+ userId + ", client: "	+ client + ", amount: " + amount + ", description: " + summary
							+ ")");
					
					if (onlyAnalyze.equalsIgnoreCase("false")) {
						if (reject) {
							// TODO: Insert a detailed reasoning of why the payment failed into Jira.
							// Update Jira.
							/*
							jira.updateIssue(token, issue.getId(), new RemoteFieldValue[] {
								new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { "Payment On Hold" })
							});
							*/
						} else {
							// TODO: FOR NOW IGNORE STUDIO, WE DON'T HAVE THE NECESSARY PAYMENT TYPES.
	/*						if ("Studio".equals(projectType)) {
								// TODO: Nice error message here.
								continue;
							}
							
							// Insert the payment into PACTS
							BasePayment payment = null;
							
							if ("Bug Fix".equals(type)) {
								payment = new BugFixesPayment(userId, amount, client, referenceId);
							} else {
								payment = new ComponentEnhancementsPayment(userId, amount, client, referenceId);
							}
							payment.setNetAmount(amount);
							payment.setDescription(description);
							// TODO: Set status according to dubiousness?
							
							ejb.addPayment(payment);
	
							// Update Jira.
							jira.updateIssue(token, issue.getId(), new RemoteFieldValue[] {
								new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { "Paid" })
							});
							final RemoteComment comment = new RemoteComment(); 
							comment.setBody("Payment processed on " + dateFormat.format(new Date()));
							jira.addComment(token, issue.getId(), comment);
							*/
						}
					}
				} catch (Exception e) {
					// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.
					e.printStackTrace();
				}
			}
		} catch (RemoteException re) {
			// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.
			re.printStackTrace();
		} catch (ServiceException se) {
			// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.
			se.printStackTrace();
		}
	}

	private void initializeJiraIssueTypes(JiraSoapService jira, String token) throws Exception {
		RemoteIssueType[] issueTypes = jira.getIssueTypes(token);
		for (RemoteIssueType issueType : issueTypes) {
			jiraIssueTypes.put(issueType.getId(), issueType.getName());
		}
	}

	/**
	 * Looks up a member's user id by handle.
	 * 
	 * @param handle the handle of the member to look up.
	 * @return the member's user id.
	 * @throws SQLException if there is a SQL error.
	 * @throws RuntimeException if the user does not exist.
	 */
	private long getUserIdByHandle(String handle) throws SQLException, RuntimeException {
		ResultSet rs = null;
		long userId;
		
		try {
			queryUserIdByHandle.setString(1, handle);
			rs = queryUserIdByHandle.executeQuery();
			
			if (rs.next()) {
				userId = rs.getLong("user_id");
			} else {
				// TODO: Prettier.
				throw new RuntimeException("User not found: " + handle);
			}
		} finally {
			close(rs);
		}
		
		return userId;
	}
	
	/**
	 * Looks up a TopCoder project's name and version by project id.
	 * 
	 * @param projectId the id of the project to look up.
	 * @return a <code>String</code> containing the name and version of the project.
	 * @throws SQLException if there is a SQL error.
	 * @throws RuntimeException if the project does not exist.
	 */
	private String getTopCoderProjectInfoById(long projectId) throws SQLException, RuntimeException {
		ResultSet rs = null;
		StringBuffer projectInfo = new StringBuffer(80);
		
		try {
			queryTopCoderProjectInfoById.setLong(1, projectId);
			rs = queryTopCoderProjectInfoById.executeQuery();
			
			if (rs.next()) {
				projectInfo.append(rs.getString("name"));
				projectInfo.append(" ");
				projectInfo.append(rs.getString("version"));
			} else {
				// TODO: Prettier.
				throw new RuntimeException("TopCoder project not found: " + projectId);
			}
		} finally {
			close(rs);
		}
		
		return projectInfo.toString();
	}

	/**
	 * Returns the PACTS payment type for a Jira issue type.
	 * 
	 * @param issue the Jira issue.
	 * @return the PACTS payment type for the Jira issue.
	 */
	private String getIssueType(RemoteIssue issue) {
		// TODO: straighten out the mess with build payments.
		if (types.containsKey(issue.getType())) {
			return types.get(issue.getType());
		}
		
		return null;
	}
	
	/**
	 * Checks whether its parameter is a null or empty <code>String</code>.
	 * 
	 * @param s the <code>String</code> to check.
	 * @return <code>true</code> if the string is <code>null</code> or empty, <code>false</code> otherwise.
	 */
	private boolean isNullOrEmpty(String s) {
		return (s == null) || s.equals("");
	}
	
	/**
	 * Retrieves the value of an issue's custom field by id.  Assumes the field has only one value, so it
	 * trims and then returns the first element of the value array.
	 *  
	 * @param issue the issue to retrieve the value from.
	 * @param id the custom field's id.
	 * @return the trimmed first value in the custom field, or <code>null</code> if it doesn't exist.
	 */
	private String getCustomFieldValueById(RemoteIssue issue, String id) {
		for (RemoteCustomFieldValue field : issue.getCustomFieldValues()) {
			if (field.getCustomfieldId().equals(id)) {
				return (field.getValues() != null) ? field.getValues()[0].trim() : null;
			}
		}
		return null;
	}
	
	/**
	 * Retrieves a client's real name by their Greek nickname.  The comparison is not case sensitive.  If the search
	 * fails, an attempt is made to get a match with the real name just in case that is what was entered.
	 * 
	 * @param nickname the client's Greek nickname.
	 * @return the client's real name.
	 */
	private String getClientName(String nickname) {
		String canonicalNickname = canonicalize(nickname);
		
		if (clients.containsKey(canonicalNickname)) {
			return clients.get(canonicalNickname);
		}
		
		for (String name : clients.values()) {
			if (canonicalNickname.equals(canonicalize(name))) {
				return name;
			}
		}
		
		return null;
	}
	
    /**
     * Returns a canonical representation of a string (trimmed, and lower case).
     * 
     * @param s the string to canonicalize.
     * @return the input string, trimmed and converted to lower case.
     */
    private String canonicalize(String s) {
    	return s.trim().toLowerCase();
	}

	/**
	 * Helper method to create a PACTS service EJB home object.
	 * 
	 * @return a configured PACTS service EJB home object.
	 * @throws Exception if errors occur while creating the EJB home object.
	 */
	public static Object createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home =
        		(PactsClientServicesHome) PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return home.create();
    }
    
	
    /**
     * Helper method to close a JDBC ResultSet.
     * 
     * @param rs the ResultSet to close.
     */
    private void close(ResultSet rs) {
    	try {
    		if (rs != null) {
    			rs.close();
    		}
    	} catch (SQLException e) {
    		// Ignore.
    	}
    }
    
    /**
     * Process and validate the parameters.
     */
    /* (non-Javadoc)
     * @see com.topcoder.shared.util.sql.DBUtility#processParams()
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");
        
        log.debug("onlyAnalyze: " + onlyAnalyze);

        String clientNamingFilename = (String) params.get("clientNamingFilename");
        try {
            if (clientNamingFilename == null || clientNamingFilename.trim().length() == 0) {
                throw new Exception("Invalid or non-existent parameter [clientNamingFilename].");
            }
            parseClientNamingConfiguration(clientNamingFilename);
        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of client naming configuration XML file failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error(ex);
        }
        params.remove("clientNamingFilename");
        
        String issueTypesFilename = (String) params.get("issueTypesFilename");
        try {
            if (issueTypesFilename == null || issueTypesFilename.trim().length() == 0) {
                throw new Exception("Invalid or non-existent parameter [issueTypesFilename].");
            }
            parseIssueTypesConfiguration(issueTypesFilename);
        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of issue types configuration XML file failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error(ex);
        }
        params.remove("issueTypesFilename");
    }

	/**
	 * Reads the mapping of client nicknames to client names from an XML configuration file.  The nicknames are then
	 * canonicalized and used as keys in the <code>clients</code> map.
	 * 
	 * @param configurationFilename the name of the XML configuration file to read.
	 */
	private void parseClientNamingConfiguration(String clientNamingFilename) throws Exception {
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(clientNamingFilename));
        doc.getDocumentElement().normalize();
        
        NodeList clientList = doc.getElementsByTagName("client");
		clients = new HashMap<String, String>();
		
        for (int i = 0; i < clientList.getLength(); ++i) {
        	NamedNodeMap attr = clientList.item(i).getAttributes();
        	
        	String nickName = attr.getNamedItem("nickName").getNodeValue();
        	String realName = attr.getNamedItem("realName").getNodeValue();
        	
        	// TODO: Check for errors such as duplicate nicknames.
        	
            clients.put(canonicalize(nickName), realName);
            
            log.debug("parseClientNamingConfiguration: read client (nickName: " + nickName + ", realName: " + realName
            		+ ")");
        }
	}
	
	/**
	 * Reads the mapping of Jira issue types to PACTS payment types.  The mappings are then loaded into the
	 * <code>types</code> map.
	 * 
	 * @param configurationFilename the name of the XML configuration file to read.
	 */
	private void parseIssueTypesConfiguration(String issueTypesFilename) throws Exception {
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(issueTypesFilename));
        doc.getDocumentElement().normalize();
        
        NodeList issueTypeList = doc.getElementsByTagName("issueType");
		types = new HashMap<String, String>();
		
        for (int i = 0; i < issueTypeList.getLength(); ++i) {
        	NamedNodeMap attr = issueTypeList.item(i).getAttributes();
        	
        	String jiraType = attr.getNamedItem("jira").getNodeValue();
        	String pactsType = attr.getNamedItem("pacts").getNodeValue();
        	
        	// TODO: Check for errors such as duplicate Jira types.
        	
            types.put(jiraType, pactsType);
            
            log.debug("parseIssueTypesConfiguration: read issue type (jira: " + jiraType + ", pacts: " + pactsType
            		+ ")");
        }
	}

	/**
	 * Show usage of the ProcessJiraPayments utility.
	 * 
	 * @param msg the error message
	 */
	@Override
	protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ProcessJiraPayments:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        fatal_error();
	}

}
