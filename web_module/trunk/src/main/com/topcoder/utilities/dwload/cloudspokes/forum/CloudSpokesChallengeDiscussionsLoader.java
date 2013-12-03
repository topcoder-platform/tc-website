/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.cloudspokes.forum;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.forums.ForumMessageData;
import com.topcoder.web.ejb.forums.ForumThreadData;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsHome;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.net.URI;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * <p>
 * The loader to load the discussions data of imported CloudSpokes Challenge contest to TopCoder forum.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Module Assembly - CloudSpokes Challenge Discussions Loader Assembly)
 */
public class CloudSpokesChallengeDiscussionsLoader extends TCLoad {

    /**
     * The logger
     */
    private static Logger log = Logger.getLogger(CloudSpokesChallengeDiscussionsLoader.class);

    /**
     * The parameter challenge_id to be replced in CloudSpokes API URL.
     */
    private static final String CHALLENGE_ID_PARAM = ":challenge_id";

    /**
     * The SQL script to get CloudSpokes contests to import forum data.
     */
    private static final String GET_CLOUDSPOKES_CONTESTS_TO_LOAD =
            "SELECT p.project_id as contest_id, cid.value::INTEGER as challenge_id, cvid.value::INTEGER as comp_vers_id\n" +
                    "FROM project p \n" +
                    "LEFT OUTER JOIN project_info fid ON p.project_id = fid.project_id and fid.project_info_type_id = 4 ,\n" +
                    "project_info cid, project_info cvid\n" +
                    "WHERE p.project_id = cid.project_id AND cid.project_info_type_id = 64 \n" +
                    "AND cid.value IS NOT NULL   \n" +
                    "AND (fid.value IS NULL or fid.value = '0')\n" +
                    "AND cvid.project_id = p.project_id and cvid.project_info_type_id = 1;";

    /**
     * The SQL script to get the mapping from CloudSpokes user id to TopCoder user id.
     */
    private static final String GET_TC_CLOUDSPOKES_USER_MAPPING = "SELECT open_id, user_id FROM user WHERE open_id IS NOT NULL;";

    /**
     * The user id of the thread poster. Should be configured to 'Application' by default.
     */
    private long threadPostUserId;

    private static String forumEJBUrl;

    /**
     * The CloudSpokes API URL to get challenge data.
     */
    private String getChallengeNameURL;

    /**
     * The CloudSpokes API URL to get challenge participants data.
     */
    private String getChallengeParticipantsURL;

    /**
     * The CloudSpokes API URL to get challenge discussions data.
     */
    private String getChallengeCommentsURL;

    /**
     * The HTTPClient to talk to the CloudSpokes API.
     */
    private HttpClient httpClient = new HttpClient();

    /**
     * The mappings of CloudSpokes User id to TopCoder user id.
     */
    private Map<String, Long> userMappings = new HashMap<String, Long>();

    /**
     * The sucessful imported contests.
     */
    private Map<String, String> importedContests = new LinkedHashMap<String, String>();

    /**
     * THe contests failed to import.
     */
    private Map<String, String> failedContests = new LinkedHashMap<String, String>();


    /**
     * The main load process.
     *
     * @throws Exception if any error.
     */
    @Override
    public void performLoad() throws Exception {

        Forums forumEJB = createForumEJB();

        // 1) Get contest ids which need to import CloudSpokes Forum
        log.info("1) Get the contests which are CloudSpokes challenge and do not have forum imported");

        PreparedStatement getContests = null;
        ResultSet contestsResultSet = null;
        int count = 0;
        List<Long[]> contestsToImport = new ArrayList<Long[]>();

        try {
            getContests = prepareStatement(GET_CLOUDSPOKES_CONTESTS_TO_LOAD, SOURCE_DB);
            contestsResultSet = getContests.executeQuery();

            while (contestsResultSet.next()) {
                long contestId = contestsResultSet.getLong("contest_id");
                long challengeId = contestsResultSet.getLong("challenge_id");
                long compVersionId = contestsResultSet.getLong("comp_vers_id");

                if (contestId > 0 && challengeId > 0 && compVersionId > 0) {
                    // add to process list
                    Long[] data = new Long[]{contestId, challengeId, compVersionId};
                    contestsToImport.add(data);
                    count++;
                } else {
                    log.error("Invalid contest data - contestId:"
                            + contestId + " challengeId:" + challengeId + " compVersionsId:" + compVersionId);
                }
            }

            log.info(count + " challenges need to import the forum data.");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            String errorMsg = "Getting contests to import CloudSpokes Challenge Forum failed\n" +
                    sqle.getMessage();
            log.error(errorMsg);
            throw new Exception(errorMsg);
        } finally {
            close(contestsResultSet);
            close(getContests);
        }

        // 2) Prepare the user mapping data (the mapping from CloudSpokes user id to TopCoder user id)
        log.info("2) Get the mappings of CloudSpokes User ID to TopCoder User ID");

        PreparedStatement getUserMapping = null;
        ResultSet userMappingResult = null;

        try {
            getUserMapping = prepareStatement(GET_TC_CLOUDSPOKES_USER_MAPPING, SOURCE_DB);
            userMappingResult = getUserMapping.executeQuery();

            while (userMappingResult.next()) {
                String cloudSpokesUserID = userMappingResult.getString("open_id");
                long topcoderUserID = userMappingResult.getLong("user_id");

                log.info("CloudSpokes UserID:" + cloudSpokesUserID + " -> TopCoder User ID:" + topcoderUserID);

                userMappings.put(cloudSpokesUserID, topcoderUserID);
            }

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            String errorMsg = "Getting mappings of CloudSpokes User ID to TopCoder User ID failed\n" +
                    sqle.getMessage();
            log.error(errorMsg);
            throw new Exception(errorMsg);
        } finally {
            close(userMappingResult);
            close(getUserMapping);
        }


        // 3) Get the challenge data (challenge name, challenge participants, challenge forum) to import

        log.info("3) Start to collect challenges data " +
                "(challenge name, challenge participants, challenge forum comments)");

        List<ForumMigrationDTO> forumMigrationData = new ArrayList<ForumMigrationDTO>();

        for (Long[] contestToImport : contestsToImport) {

            ForumMigrationDTO dto = new ForumMigrationDTO();

            dto.setContestId(contestToImport[0]);
            dto.setChallengeId(contestToImport[1]);
            dto.setCompVersionId(contestToImport[2]);

            try {
                log.info("Get data for contest id:" + dto.getContestId() + " challenge id:" + dto.getChallengeId());

                List<Challenge> challenges = getDataFromCloudSpokesAPI(httpClient,
                        getChallengeNameURL.replace(CHALLENGE_ID_PARAM, String.valueOf(dto.getChallengeId())),
                        Challenge.class,
                        false);

                dto.setChallenge(challenges.get(0));

                log.info("  Challenge name:" + dto.getChallenge().getName());

                List<Challenge.Participant> participants = getDataFromCloudSpokesAPI(httpClient,
                        getChallengeParticipantsURL.replace(CHALLENGE_ID_PARAM, String.valueOf(dto.getChallengeId())),
                        Challenge.Participant.class, true);

                if (participants == null) {
                    log.info("  No participants for this challenge");
                } else {
                    dto.setParticipants(participants);

                    log.info("  Challenge participants count:" + dto.getParticipants().size());
                }

                List<Challenge.Comment> comments = getDataFromCloudSpokesAPI(httpClient,
                        getChallengeCommentsURL.replace(CHALLENGE_ID_PARAM, String.valueOf(dto.getChallengeId())),
                        Challenge.Comment.class, true);

                if (comments == null) {
                    log.info("  No comments for this challenge");
                } else {
                    dto.setComments(comments);

                    int commentCount = 0;
                    int commentRepliesCount = 0;

                    for (Challenge.Comment comment : dto.getComments()) {
                        commentCount++;
                        if (comment.getReplies() != null && comment.getReplies().getReplies() != null) {
                            commentRepliesCount += comment.getReplies().getReplies().size();
                        }
                    }


                    log.info("  Challenge comments count: total " + commentCount + " comments, total " +
                            commentRepliesCount + " comment replies");
                }

                // all data for this challenge successfully loaded, add to migration list
                forumMigrationData.add(dto);

            } catch (Exception ex) {
                log.error(" Error occurs when getting challenge data for contest ID:"
                        + contestToImport[0] + " challenge id:" + contestToImport[1]);
                // do not rethrow, continue to load the next one
            }
        }


        // 4) Start the forum import main process
        log.info("4) Start to import forum data one by one ...");

        for (ForumMigrationDTO dto : forumMigrationData) {

            try {
                log.info("  Load Forum Data for Challenge ID:" + dto.getChallengeId()
                        + " name:" + dto.getChallenge().getName());


                Set<Long> userIds = new HashSet<Long>();
                Set<Long> adminIds = new HashSet<Long>();
                ForumThreadData forumData = new ForumThreadData();
                ForumMessageData rootMessage = new ForumMessageData();
                Date postStartDate = new Date(Long.MAX_VALUE);

                // collect user ids
                if (dto.getParticipants() != null) {
                    for (Challenge.Participant p : dto.getParticipants()) {

                        if (userMappings.get(p.getMemberId()) == null) {
                            log.warn("Cannot find mapping user for CloudSpoke User:" + p.getMemberId());
                        } else {
                            log.info("  Insert user mapping for participant "
                                    + p.getMemberId() + " -> " + userMappings.get(p.getMemberId()));
                            userIds.add(userMappings.get(p.getMemberId()));
                        }
                    }
                }

                List<ForumMessageData> topComments = new ArrayList<ForumMessageData>();


                // collect forum data and collect admin ids
                for (Challenge.Comment c : dto.getComments()) {
                    // build top comment
                    ForumMessageData topComment = createForumMessage(c.getMemberId(), c.getCommentContent(),
                            c.getCreatedDate());

                    if (c.getCreatedDate().before(postStartDate)) {
                        postStartDate = c.getCreatedDate();
                    }

                    if (c.isFromAdmin()) {
                        adminIds.add(userMappings.get(c.getMemberId()));
                    }

                    // build the replies of the top comment
                    List<ForumMessageData> topCommentReplies = new ArrayList<ForumMessageData>();
                    if (c.getReplies() != null && c.getReplies().getReplies() != null) {
                        for (Challenge.Comment cr : c.getReplies().getReplies()) {
                            topCommentReplies.add(
                                    createForumMessage(cr.getMemberId(), cr.getCommentContent(), cr.getCreatedDate()));
                            if (cr.isFromAdmin()) {
                                adminIds.add(userMappings.get(cr.getMemberId()));
                            }

                            if (cr.getCreatedDate().before(postStartDate)) {
                                postStartDate = cr.getCreatedDate();
                            }
                        }
                    }

                    topComment.setReplies(topCommentReplies);
                    topComments.add(topComment);
                }

                rootMessage.setReplies(topComments);
                rootMessage.setCreationTime(postStartDate);
                forumData.setRootMessage(rootMessage);

                // call the forum EJB to do the final load
                long forumCategoryID = forumEJB.migrateCloudSpokesForumData(dto.getContestId(), dto.getCompVersionId(),
                        dto.getChallenge().getName(), forumData, userIds.toArray(new Long[userIds.size()]),
                        adminIds.toArray(new Long[adminIds.size()]), threadPostUserId);

                log.info("  Migration is finished successfully.");

                importedContests.put(String.valueOf(dto.getContestId()), dto.getChallenge().getName());


            } catch (Exception e) {
                log.error("  Error occurs when migrate contest ID"
                        + dto.getContestId() + " challenge id:" + dto.getChallengeId(), e);
                // do not rethrow, continue to load next one
                failedContests.put(String.valueOf(dto.getContestId()), dto.getChallenge().getName());
            }
        }

        printReport();
    }



    /**
     * Print out the loader report to the console.
     */
    private void printReport() {
        System.out.println("--------------- CloudSpokesChallengeDiscussionsLoader LOADER REPORT ---------------");
        System.out.println(importedContests.size() + " contests have forum data imported, see list below:");
        for (Map.Entry<String, String> entry : importedContests.entrySet()) {
            System.out.println("Contest ID:" + entry.getKey() + " Challenge Name:" + entry.getValue());
        }

        if (failedContests != null && failedContests.size() > 0) {
            System.out.println(failedContests.size() + " failed to import the forum data, see the list below:");
            for (Map.Entry<String, String> entry : failedContests.entrySet()) {
                System.out.println("Contest ID:" + entry.getKey() + " Challenge Name:" + entry.getValue());
            }
        }
    }

    /**
     * Creates a ForumMessageData instance with the specified data.
     *
     * @param cloudSpokesMemberId the CloudSpokes user id.
     * @param content             the forum message content
     * @param createDate          the creation date.
     * @return the created ForumMessageData instance.
     */
    private ForumMessageData createForumMessage(String cloudSpokesMemberId, String content, Date createDate) {
        ForumMessageData messageData = new ForumMessageData();
        messageData.setCreatorId(userMappings.get(cloudSpokesMemberId));
        messageData.setContent(content);
        messageData.setCreationTime(createDate);
        messageData.setModificationTime(createDate);
        return messageData;
    }


    /**
     * Reads the configured parameters from the configuration file.
     *
     * @param params the params read.
     * @return true if no errors, false otherwise
     */
    @Override
    public boolean setParameters(Hashtable params) {

        String errorMsg = null;

        if (params.containsKey("threadPostUserId")) {
            try {
                threadPostUserId = Long.parseLong((String) params.get("threadPostUserId"));
            } catch (Exception ex) {
                errorMsg = "The configuration threadPostUserId should be a positive integer";
            }
        } else {
            errorMsg = "The configuration threadPostUserId does not exist in loadCloudSpokesForum.xml";
        }

        if (errorMsg != null) {
            System.err.print(errorMsg);
            setReasonFailed(errorMsg);
            return false;
        }

        getChallengeNameURL = (String) params.get("getChallengeNameURL");
        getChallengeParticipantsURL = (String) params.get("getChallengeParticipantsURL");
        getChallengeCommentsURL = (String) params.get("getChallengeCommentsURL");
		forumEJBUrl = (String) params.get("forumEJBUrl");

        return checkRequiredParameter("getChallengeNameURL", getChallengeNameURL)
                && checkRequiredParameter("getChallengeParticipantsURL", getChallengeParticipantsURL)
                && checkRequiredParameter("getChallengeCommentsURL", getChallengeCommentsURL);
    }

    /**
     * Create the Forums remote EJB.
     *
     * @return the created EJB handler.
     * @throws Exception if any error.
     */
    public static Forums createForumEJB() throws Exception {
        Properties p = new Properties();
        p.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
        p.put(Context.URL_PKG_PREFIXES, "org.jboss.naming:org.jnp.interfaces");
        p.put(Context.PROVIDER_URL, forumEJBUrl);

        InitialContext c = new InitialContext(p);
        ForumsHome forumsHome = (ForumsHome) c.lookup(ForumsHome.EJB_REF_NAME);

        return forumsHome.create();
    }

    /**
     * Gets the data from CloudSpokes API.
     *
     * @param httpClient the http client instance.
     * @param apiURL     the URL of the api
     * @param typeClass  the type class need to get
     * @param multiple   whether there are multiple type class to get
     * @param <T>        the generic type.
     * @return the List of type class instance.
     * @throws Exception if any error.
     */
    public static <T> List<T> getDataFromCloudSpokesAPI(HttpClient httpClient,
                                                        String apiURL, Class<T> typeClass, boolean multiple) throws Exception {
        String responseMessage;

        URI uri = new URI(apiURL);
        GetMethod getMethod = new GetMethod(uri.toString());
        getMethod.addRequestHeader("accept", "application/json");
        int status = httpClient.executeMethod(getMethod);

        if (status != HttpStatus.SC_OK) {
            throw new Exception("Fail to get data from CloudSpokes API for the URL:" + apiURL);
        }

        responseMessage = getMethod.getResponseBodyAsString();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readValue(responseMessage, JsonNode.class);
        JsonNode response = jsonNode.path("response");
        if (multiple) {
            return mapper.readValue(response.toString(),
                    mapper.getTypeFactory().constructCollectionType(List.class, typeClass));
        } else {
            T value = mapper.readValue(response.toString(), typeClass);
            List<T> values = new ArrayList<T>();
            values.add(value);
            return values;
        }

    }

    /**
     * Checks whether the required configuration parameter exists.
     *
     * @param name  the parameter name.
     * @param value the parameter value
     * @return false if not pass the check, true otherwise.
     */
    private boolean checkRequiredParameter(String name, String value) {
        if (value == null) {
            String message = name + " should be configured in loadCloudSpokesForum.xml.";
            System.err.println(message);
            setReasonFailed(message);
            return false;
        }
        if (value.trim().length() == 0) {
            String message = name + " should not be empty in loadCloudSpokesForum.xml.";
            System.err.println(message);
            setReasonFailed(message);
            return false;
        }
        return true;
    }
}
