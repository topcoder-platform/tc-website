/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;
import com.topcoder.imaging.overlay.ImagePersistenceHandler;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import java.util.MissingResourceException;

/**
 * <p>This class stores a variety of constants for general use of Studio application.</p>
 *
 * <p>
 *   Version 1.1 (Studio Submission Viewer Upgrade Integration v1.0) Change notes:
 *   <ol>
 *     <li>Added constants to support pagination request parameters.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (Studio Release Assembly - Spec Review Sign up page v1.0) Change notes:
 *   <ol>
 *     <li>Added configuration to support spec review signup - payment amount.</li>
 *     <li>Updated class initialization to support <code>double</code> type.</li>
 *     <li>Added SPEC_REVIEW_ID request attribute key constant.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.3 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *     <li>Added Constants to support new fields in Studio Contest Administration page.</li>
 *   </ol>
 * </p>
 *
 * <p> Version 1.4 (Studio Declaration Module Assembly) change:
 * Added contstants for submission declaration parameters.
 * </p>
 *
 * <p>
 *   Version 1.5 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Added Constants to support ids for gallery {@link #GALLERY_IDS}.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.6 (Re-platforming Studio Release 4 Assembly) Change notes:
 *   <ol>
 *     <li>Removed old studio model files that were linked with <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.7 (Upload Progress Bar Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #UPLOAD_ID} constant.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, isv, pvmagacho
 * @version 1.7
 */
public class Constants implements WebConstants {
    private static final TCResourceBundle bundle = new TCResourceBundle("Studio");
    private static final Logger log = Logger.getLogger(Constants.class);

    public static String DEFAULT_PAGE;

    public static final String SUBMISSION = "sbm";
    public static final String SUBMISSION_SOURCE = "sbm_src";
    public static final String SUBMISSION_PREVIEW = "sbm_prvw";

    public static final String SUBMISSION_ID = "sbmid";

    /**
     * <p>A <code>String</code> providing the name of parameter of request to hold the ID of an upload associated with
     * submission.</p>
     * 
     * @since 1.7
     */
    public static final String UPLOAD_ID = "uploadId";
    
    public static final String REVIEW_STATUS_ID = "rstid";
    public static final String SUBMISSION_STATUS_ID = "sbstid";
    public static final String SUBMISSION_REVIEW_TEXT = "sbmrtx";
    public static final String CONTEST_PROPERTY = "ctprop";
    public static final String PRIZE_DESCRIPTION = "przdesc";
    public static final String PRIZE_PLACE = "prpl";
    public static final String PRIZE_VALUE = "prvl";
    public static final String PRIZE_TYPE_ID = "prtid";
    public static final String PRIZE_ID = "prid";
    public static final String DOCUMENT_ID = "docid";
    public static final String DOCUMENT_TYPE_ID = "doctid";
    public static final String DOCUMENT = "doc";
    public static final long CONTEST_ADMIN_ROLE_ID = 2040;
    public static final String FILE_TYPE = "ft_";
    public static final String SUBMISSION_RANK = "srank";
    public static final String REG_CONFIRM = "rconfirm";
    public static final String ACCEPT_AD = "accept_ad";
    public static final String ACCEPT_AD_ERROR = "accept_ad_err";

    public static final String ASSIGNMENT_DOCUMENT_ID = "assignment_document_id";
    public static final String RESULT_KEY = "result_key";

    public static final String WIDTH = "width";
    public static final String HEIGHT = "height";

    /**
     * Submission comment.
     *
     * @since 1.4
     */
    public static final String SUBMISSION_COMMENT = "submission_comment";

    /**
     * Contains licenced elements.
     *
     * @since 1.4
     */
    public static final String CONTAINS_LICENSED_ELEMENTS = "cle";

    /**
     * Font name.
     *
     * @since 1.4
     */
    public static final String FONT_NAME = "font_name";

    /**
     * Font url.
     *
     * @since 1.4
     */
    public static final String FONT_URL = "font_url";

    /**
     * Stock art name.
     *
     * @since 1.4
     */
    public static final String STOCK_ART_NAME = "sa_name";

    /**
     * Stock art url.
     *
     * @since 1.4
     */
    public static final String STOCK_ART_URL = "sa_url";

    /**
     * Stock art file number.
     *
     * @since 1.4
     */
    public static final String STOCK_ART_FILE_NUMBER = "sa_file";

    public static int MAX_CONTEST_NAME_LENGTH;
    public static String JS_DATE_FORMAT;
    public static String JAVA_DATE_FORMAT;
    public static int CONTEST_TERMS_OF_USE_ID;
    public static String ROOT_STORAGE_PATH;
    public static String SUBMISSIONS_DIRECTORY_NAME;
    public static String DOCUMENTS_DIRECTORY_NAME;
    public static int VIEW_SUBMISSIONS_SCROLL_SIZE;
    public static int ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE;

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the type of alternate representation
     * of the submission to be viewed/downloaded.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.11)
     */
    public static final String SUBMISSION_ALT_TYPE = "sbt";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the type of the image from the
     * submission to be viewed/downloaded.</p>
     *
     * @since Studio Download Submission Refactor
     */
    public static final String SUBMISSION_IMAGE_TYPE = "it";

    /**
     * <p>A <code>String</code> providing the path to a file to be used for watermarking the images.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static String WATERMARK_FILE_PATH;

    /**
     * <p>A <code>String</code> referencing the type of a file to be used for watermarking the images. Must be mapped to
     * values introduced by {@link ImagePersistenceHandler} interface.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static String WATERMARK_FILE_TYPE;

    /**
     * <p>An <code>int</code> specifying the transparency for the base image when performing watermarking. Must be in
     * range [-1, 100]</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static int WATERMARK_BASE_IMAGE_TRANSPARENCY;

    /**
     * <p>An <code>int</code> specifying the transparency for the overlay image when performing watermarking. Must be in
     * range [-1, 100]</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static int WATERMARK_OVERLAY_IMAGE_TRANSPARENCY;

    /**
     * <p>An <code>int</code> specifying the value of red color when performing the watermarking. Must be in range
     * [0, 255]</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static int WATERMARK_OVERLAY_IMAGE_RED;

    /**
     * <p>An <code>int</code> specifying the value of green color when performing the watermarking. Must be in range
     * [0, 255]</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static int WATERMARK_OVERLAY_IMAGE_GREEN;

    /**
     * <p>An <code>int</code> specifying the value of blue color when performing the watermarking. Must be in range
     * [0, 255]</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static int WATERMARK_OVERLAY_IMAGE_BLUE;

    /**
     * <p>A <code>String</code> providing the path to a directory where the temporary files can be put to (for example,
     * such files are used while generating the watermarked copies of images).</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static String TEMPORARY_STORAGE_PATH;

    /**
     * <p>A <code>String</code> providing the path to a directory in submission archive where the source files for the
     * submission can be located.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static String SUBMISSION_SOURCE_PATH;

    /**
     * <p>A <code>String</code> providing the path to a directory in submission archive where the submission files can
     * be located.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.7)
     */
    public static String SUBMISSION_PATH;

    /**
     * <p>A <code>String</code> providing the message for the exception to be thrown in case the submitted file does not
     * represent the bundled file.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_NOT_BUNDLED_FILE;

    /**
     * <p>A <code>String</code> providing the message for the exception to be thrown in case the submitted file does not
     * represent the bundled file.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_NO_BUNDLED_FILE_PARSER;

    /**
     * <p>A <code>String</code> providing the message for the exception to be thrown in case the requested type of
     * alternate representation of the submission is not recognized.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_INVALID_PRESENTATION_TYPE;

    /**
     * <p>A <code>String</code> providing the message for the exception to be thrown in case the requested alternate
     * representation of the submission does not exist.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_PRESENTATION_NOT_FOUND;

    /**
     * <p>A <code>String</code> providing the message to be displayed to users in case the submission validation fails
     * in case there is no native submission provided.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_NO_NATIVE_SUBMISSION;

    /**
     * <p>A <code>String</code> providing the message to be displayed to users in case the submission validation fails
     * in case there is no preview image provided.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_NO_PREVIEW_IMAGE;

    /**
     * <p>A <code>String</code> providing the message to be displayed to users in case the submission validation fails
     * in case there is no preview file provided.</p>
     *
     * @since TopCoder Studio Modifications Assembly
     */
    public static String ERROR_MSG_NO_PREVIEW_FILE;

    /**
     * <p>An <code>int</code> providing the maximum allowed length for the values of {@link ContestProperty#CLIENT}
     * property of a contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.1)
     */
    public static int MAX_CLIENT_NAME_LENGTH;

    /**
     * <p>An <code>int</code> providing the maximum allowed length for the values of configuration property of a
     * contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static int MAX_CONTEST_CONFIG_VALUE_LENGTH;

    /**
     * <p>An <code>int</code> providing the maximum allowed length for the values of contest document descriptions.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
     */
    public static int MAX_DOCUMENT_DESC_VALUE_LENGTH;

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the time of announcing a winner for
     * the contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
     */
    public static final String WINNER_ANNOUNCEMENT_TIME = "watm";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the intended medium types for the
     * submissions for the contests.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
     */
    public static final String MEDIUM = "mt_";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the type of the contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.4)
     */
    public static final String CONTEST_TYPE = "ctt";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the digital run points of the
     * contest.</p>
     *
     * @since Digital Run v2.0
     */
    public static final String DIGITAL_RUN_POINTS = "drp";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the channel of the contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.5)
     */
    public static final String CONTEST_CHANNEL = "cc";


    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the description of the uploaded
     * document.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
     */
    public static final String DOC_DESC = "docdesc";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the index of the submission file to
     * be downloaded.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final String SUBMISSION_FILE_INDEX = "sfi";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the flag whether the watermarked
     * submission is to be downloaded or not.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final String SUBMISSION_FILE_WATERMARKED = "sfw";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the number of the images in the
     * gallery.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final String GALLERY_IMAGES_COUNT = "icnt";

    /**
     * <p>An <code>int</code> providing the default value for the file index.</p>
     *
     * @since Studio Download Submission Refactor
     */
    public static final int DEFAULT_FILE_INDEX = 1;

    /**
     * <p>An <code>int</code> value to be used to indicate that there were no explicit image type requested by the
     * client (based on parameters of incoming request).</p>
     *
     * @since Studio Download Submission Refactor (Req# 2.1.3)
     */
    public static final int SUBMISSION_IMAGE_TYPE_UNSPECIFIED = -1;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the winner announcement
     * time fails to pass the validation as it is set before the contest end time.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_WIN_ANNOUNCE_BEFORE_END;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the winner announcement
     * time fails to pass the validation as it is set to invalid value.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_WIN_ANNOUNCE_INVALID;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the winner announcement
     * time fails to pass the validation as it is not set.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_NO_WIN_ANNOUNCE;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the winner announcement
     * time can not be validated since contest end time is invalid.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_WIN_ANNOUNCE_UNABLE_TO_CHECK;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the contest medium type
     * can not be validated since it is not set.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_NO_MEDIUM;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the contest medium type
     * fails to pass the validation since it does not refer to existing medium type or is not valid.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_MEDIUM_INVALID;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the contest type can not
     * be validated since it is not set.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_NO_CONTEST_TYPE;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the contest type fails
     * to pass the validation since it does not refer to existing contest type or is not valid.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_CONTEST_TYPE_INVALID;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the contest channel can
     * not be validated since it is not set.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_NO_CONTEST_CHANNEL;

    /**
     * <p>A <code>String</code> providing the message to be displayed to administrators in case the contest channel
     * fails to pass the validation since it does not refer to existing contest channel or is not valid.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2
     */
    public static String ERROR_MSG_CONTEST_CHANNEL_INVALID;

    /**
     * <p>A <code>String</code> providing the message to be displayed to users in case the submitted archive does not
     * contain the desired directory (for example, <code>source</code> or <code>submission</code> directory).</p>
     *
     * @since STUDIO-128
     */
    public static String ERROR_MSG_NO_DIRECTORY;

    /**
     * <p>A <code>String</code> providing the name of default request attribute which refers to
     * <code>MemberProfile</code> instance representing the profile for current user.</p>
     *
     * @since TopCoder Studio Member Profile Assembly
     */
    public static final String MEMBER_PROFILE = "member_profile";

    // Flag to turn on/off the global AD feature
    public static String GLOBAL_AD_FLAG;

    /**
     * <p>A <code>String</code> providing an arrays of gallery ids. Should be separated by commas.</p>
     *
     * @since 1.5
     */
    public static List<Integer> GALLERY_IDS;
    
    /**
     * <p>A <code>String</code> providing the name of default request attribute which refers to
     * the page number required for pagination.</p>
     *
     * @since 1.1
     */
    public static final String PAGE_NUMBER_KEY = "pn";

    /**
     * <p>A <code>String</code> providing the name of default request attribute which refers to
     * the page size required for pagination.</p>
     *
     * @since 1.1
     */
    public static final String PAGE_SIZE_KEY = "ps";

    /**
     * <p>A <code>double</code> providing the payment amount for specification reviews.</p>
     *
     * @since 1.2
     */
    public static double SPEC_REVIEW_PAYMENT_AMOUNT;

    /**
     * <p>A <code>double</code> providing the payment amount for screening reviews.</p>
     *
     * @since 1.2
     */
    public static double SCREENING_REVIEW_PAYMENT_AMOUNT;

    /**
     * <p>A <code>String</code> providing the name of default request attribute which refers to
     * specification review id.</p>
     *
     * @since 1.2
     */
    public static final String SPEC_REVIEW_ID = "srid";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the milestone date for a multi
     * round contest.</p>
     *
     * @since 1.2
     */
    public static final String MILESTONE_DATE = "md";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the contest round type.</p>
     *
     * @since 1.2
     */
    public static final String CONTEST_FORMAT = "cf";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the round one specifics.</p>
     *
     * @since 1.2
     */
    public static final String CONTEST_ROUND_ONE_SPECIFICS = "cros";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the round two specifics.</p>
     *
     * @since 1.2
     */
    public static final String CONTEST_ROUND_TWO_SPECIFICS = "crts";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the milestone prize amount.</p>
     *
     * @since 1.2
     */
    public static final String MILESTONE_PRIZE_AMOUNT = "mpa";

    /**
     * <p>A <code>String</code> providing the name of request parameter to specify the number of milestone prizes.</p>
     *
     * @since 1.2
     */
    public static final String NUMBER_MILESTONE_PRIZES = "nmp";


    static {
        initialize();
    }

    /**
     * This method initializes fields to their corresponding value
     *
     * Note: <code>double</code> type supported since 1.2
     */
    public static void initialize() {
        //log.debug("XXXXX initialize called");

        Field[] f = Constants.class.getFields();
        //log.debug(f.length + " fields found");
        for (int i = 0; i < f.length; i++) {
            //log.debug("Constants " + f[i].getName());
            try {
                if (!Modifier.isFinal(f[i].getModifiers())) {
                    if (f[i].getType().getName().equals("int")) {
                        try {
                            //log.debug("set " + f[i] + " to " + bundle.getIntProperty(f[i].getName().toLowerCase()));
                            f[i].setInt(null, bundle.getIntProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            //log.debug("set " + f[i] + " to " + bundle.getProperty(f[i].getName().toLowerCase()));
                            f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("double")) {
                        try {
                            f[i].setDouble(null, bundle.getDoubleProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("java.util.List")) {
                    	List<Integer> idsList = new ArrayList<Integer>();
                    	String [] ids = bundle.getProperty(f[i].getName().toLowerCase()).split(",");
                    	for (String id : ids) {
                            log.debug("Constants#GALLERY_IDS " + id.trim());
                    		idsList.add(new Integer(id.trim()));
                    	}
                    	f[i].set(null, idsList);
                    } else {
                        throw new Exception("Unrecognized type: " + f[i].getType().getName());
                    }
                }
                if (f[i].get(null) == null)
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
//                else
//                    log.debug(f[i].getName() + " <== " + f[i].get(null));

            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
    }


}
