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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.BugFixesPayment;
import com.topcoder.web.ejb.pacts.ComponentEnhancementsPayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.SpecificationReviewPayment;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapService;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapServiceServiceLocator;

/**
 * @author ivern
 */
/**
 * @author ivern
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
		"SELECT pi_name.value || ' ' || pi_version.value AS info" +
		"  FROM tcs_catalog:project_info pi_name" +
		"     , tcs_catalog:project_info pi_version" +
		" WHERE pi_name.project_id = ?" +
		"   AND pi_name.project_info_type_id = 6" +
		"   AND pi_version.project_id = pi_name.project_id" +
		"   AND pi_version.project_info_type_id = 7";
	
	private static final String QUERY_STUDIO_CONTEST_INFO_BY_ID =
		"SELECT name AS info FROM studio_oltp:contest WHERE contest_id = ?";
	
	private PreparedStatement queryUserIdByHandle = null;
	private PreparedStatement queryTopCoderProjectInfoById = null;
	private PreparedStatement queryStudioContestInfoById = null;
	
	private Map<String, String> clientNicknameTranslation = null;
	private Map<String, String> issueTypeTranslation = null;
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
		queryStudioContestInfoById = prepareStatement("informixoltp", QUERY_STUDIO_CONTEST_INFO_BY_ID);
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
					
					List<String> errors = new ArrayList<String>();
					
					// TODO: Unify the treatment of Jira issue types...id or name?
					String paymentType = getIssueType(issue);
					if (paymentType == null) {
						reject = true;
						paymentType = jiraIssueTypes.get(issue.getType());
					}
					
					String amountStr = getCustomFieldValueById(issue, JIRA_PAYMENT_AMOUNT_FIELD_ID);
					String payee = getCustomFieldValueById(issue, JIRA_PAYEE_FIELD_ID);
					String clientNickname = getCustomFieldValueById(issue, JIRA_CLIENT_NICKNAME_FIELD_ID);
					String projectId = getCustomFieldValueById(issue, JIRA_PROJECT_ID_FIELD_ID);
					String studioId = getCustomFieldValueById(issue, JIRA_STUDIO_ID_FIELD_ID);
				
					if (isNullOrEmpty(paymentType) || isNullOrEmpty(amountStr) || isNullOrEmpty(payee)
							|| isNullOrEmpty(clientNickname)) {
						// TODO: Nice error message here.
						reject = true;
					}
					
					String referenceType = null;
					long referenceId;
					String referenceInfo = null;
					if (!(isNullOrEmpty(projectId) ^ isNullOrEmpty(studioId))) {
						reject = true;
						referenceType = "N/A";
						referenceId = 0L;
						referenceInfo = "N/A";
						errors.add("One exactly of either ProjectID or StudioID must be filled out.");
					} else if (!isNullOrEmpty(projectId)) {
						referenceType = "TopCoder";
						try {
							referenceId = Long.parseLong(projectId);
							referenceInfo = getTopCoderProjectInfoById(referenceId);
							if (referenceInfo == null) {
								reject = true;
								errors.add("Could not find TopCoder project with id " + referenceId);
							}
						} catch (NumberFormatException e) {
							reject = true;
							referenceId = 0L;
							errors.add("ProjectID (" + projectId + ") is not a valid Long number.");
						}
					} else {
						referenceType = "Studio";
						try {
							referenceId = Long.parseLong(studioId);
							referenceInfo = getStudioContestInfoById(referenceId);
							if (referenceInfo == null) {
								reject = true;
								errors.add("Could not find Studio project with id " + referenceId);
							}
						} catch (NumberFormatException e) {
							reject = true;
							referenceId = 0L;
							errors.add("StudioID (" + studioId + ") is not a valid Long number.");
						}
					}
					
					String client = null;
					if (clientNickname != null) {
						client = getClientName(clientNickname);
						if (client == null) {
							reject = true;
							client = clientNickname;
							errors.add("Unknown client nickname " + clientNickname + ".");
						}
					} else {
						reject = true;
						client = "N/A";
						errors.add("The Client Nickname field must not be null.");
					}
					
					// Retrieve the payee's user id.
					long userId = getUserIdByHandle(payee);
					if (userId == 0L) {
						reject = true;
						errors.add("Payee (" + payee + ") must be a valid TopCoder handle.");
					}
					
					// Parse the payment amount.
					double amount;
					try {
						amount = Double.parseDouble(amountStr);
					} catch (NumberFormatException e) {
						reject = true;
						amount = 0.0;
						errors.add("First Place Payment $ (" + amountStr + ") is not a valid Double number.");
					}
					
					// Build a payment description summary.
					String summary = "[" + issue.getKey() + "] - " + referenceInfo;
					
					log.info("[" + (reject ? "REJECTED" : "ACCEPTED") + "] - (payment type: " + paymentType
							+ ", project type: " + referenceType + ", reference id: " + referenceId + ", user id: "
							+ userId + ", client: "	+ client + ", amount: " + amount + ", description: " + summary
							+ ")");
					
					for (String e : errors) {
						log.info("    Reason : " + e);
					}
					
					if (false && onlyAnalyze.equalsIgnoreCase("false")) {
						if (reject) {
							// TODO: Insert a detailed reasoning of why the payment failed into Jira.
							// Update Jira.
							jira.updateIssue(token, issue.getId(), new RemoteFieldValue[] {
								new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { "Payment On Hold" })
							});
						} else {
							// TODO: FOR NOW IGNORE STUDIO, WE DON'T HAVE THE NECESSARY PAYMENT TYPES.
							if ("Studio".equals(referenceType)) {
								// TODO: Nice error message here.
								continue;
							}
							
							// Insert the payment into PACTS
							BasePayment payment = null;
							
							if ("Bug Fix".equals(paymentType)) {
								payment = new BugFixesPayment(userId, amount, client, referenceId);
							} else if ("Enhancement".equals(paymentType)){
								payment = new ComponentEnhancementsPayment(userId, amount, client, referenceId);
							} else if ("Specification Review".equals(paymentType)) {
								payment = new SpecificationReviewPayment(userId, amount, client, referenceId);
							} else {
								throw new RuntimeException("Unknown payment type: " + paymentType);
							}
							payment.setNetAmount(amount);
							payment.setDescription(summary);
							
							ejb.addPayment(payment);
	
							// Update Jira.
							jira.updateIssue(token, issue.getId(), new RemoteFieldValue[] {
								new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { "Paid" })
							});
							final RemoteComment comment = new RemoteComment(); 
							comment.setBody("Payment processed on " + dateFormat.format(new Date()));
							jira.addComment(token, issue.getId(), comment);
						}
					}
				} catch (Exception e) {
					// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.  Use sErrorMsg for stuff!
					e.printStackTrace();
				}
			}
		} catch (RemoteException re) {
			// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.  Use sErrorMsg for stuff!
			re.printStackTrace();
		} catch (ServiceException se) {
			// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.  Use sErrorMsg for stuff!
			se.printStackTrace();
		}
	}

	private void initializeJiraIssueTypes(JiraSoapService jira, String token) throws Exception {
		jiraIssueTypes = new HashMap<String, String>();
		
		RemoteIssueType[] issueTypes = jira.getIssueTypes(token);
		for (RemoteIssueType issueType : issueTypes) {
			jiraIssueTypes.put(issueType.getId(), issueType.getName());
			log.debug("Found Jira issue type (id: " + issueType.getId() + ", name: " + issueType.getName() + ")");
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
				userId = 0L;
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
	 * @return a <code>String</code> containing the name and version of the project, or <code>null</code> if it
	 * 		   doesn't exist.
	 * @throws SQLException if there is a SQL error.
	 */
	private String getTopCoderProjectInfoById(long referenceId) throws SQLException {
		return getReferenceInfoById(queryTopCoderProjectInfoById, referenceId);
	}

	private String getStudioContestInfoById(long referenceId) throws SQLException {
		return getReferenceInfoById(queryStudioContestInfoById, referenceId);
	}
	
	/**
	 * @param referenceId
	 * @return
	 * @throws SQLException
	 * @throws RuntimeException
	 */
	private String getReferenceInfoById(PreparedStatement query, long referenceId) throws SQLException {
		
		ResultSet rs = null;
		
		try {
			query.setLong(1, referenceId);
			rs = query.executeQuery();
			
			if (rs.next()) {
				return rs.getString("info");
			} else {
				return null;
			}
		} finally {
			close(rs);
		}
	}

	/**
	 * Returns the PACTS payment type for a Jira issue type.
	 * 
	 * @param issue the Jira issue.
	 * @return the PACTS payment type for the Jira issue.
	 */
	private String getIssueType(RemoteIssue issue) {
		// TODO: straighten out the mess with build payments.
		if (issueTypeTranslation.containsKey(issue.getType())) {
			return issueTypeTranslation.get(issue.getType());
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
		
		if (clientNicknameTranslation.containsKey(canonicalNickname)) {
			return clientNicknameTranslation.get(canonicalNickname);
		}
		
		for (String name : clientNicknameTranslation.values()) {
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
	 *
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

        clientNicknameTranslation = initializeTranslationFromConfiguration("clientNamingFilename");
        issueTypeTranslation = initializeTranslationFromConfiguration("issueTypesFilename");
    }

    /**
     * Reads a translation mapping from a file specified by a configuration key.
     * 
     * @param configurationKey the configuration key specifying the file to be loaded.
     * @return a <code>Map</code> containing the translation mapping.
     */
    private Map<String, String> initializeTranslationFromConfiguration(String configurationKey) {
        Map<String, String> translationMap = null;
        
        String filename = (String) params.get(configurationKey);
        
        try {
            if (filename == null || filename.trim().length() == 0) {
                throw new Exception("Invalid or non-existent parameter [" + configurationKey + "].");
            }
            translationMap = loadTranslationMap(filename);
        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of XML file for " + configurationKey + " failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error(ex);
        }
        
        params.remove(configurationKey);

        return translationMap;
    }
    
	/**
	 * Reads a translation mapping from an XML configuration file.  The origin words are stored canonicalized, so
	 * the mapping is case insensitive and ignores leading and trailing whitespace.  When using a translation map,
	 * the keys must be canonicalized as well.
	 * 
	 * @param filename the name of the XML translation mapping file to read.
	 */
	private Map<String, String> loadTranslationMap(String filename) throws Exception {
		Map<String, String> translationMap = new HashMap<String, String>();
		
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(filename));
        doc.getDocumentElement().normalize();
        
        NodeList translations = doc.getElementsByTagName("translate");
				
        for (int i = 0; i < translations.getLength(); ++i) {
        	NamedNodeMap attr = translations.item(i).getAttributes();
        	
        	String from = attr.getNamedItem("from").getNodeValue();
        	String to = attr.getNamedItem("to").getNodeValue();
        	
        	// TODO: Check for errors such as duplicate from.
        	
            translationMap.put(canonicalize(from), to);
            
            log.debug("loadTranslationMap: read translation (" + from + " -> " + to + ")");
        }
        
        return translationMap;
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
