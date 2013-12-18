/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.cloudspokes.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.supercsv.io.CsvMapReader;
import org.supercsv.prefs.CsvPreference;

import com.topcoder.security.ldap.LDAPClient;
import com.topcoder.security.ldap.LDAPClientException;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

/**
 * <p>
 * Command line application for loading CloudSpokes user data into TopCoder's user database.
 * </p>
 *
 * @version 1.0
 * @author Selena
 */
public class CloudSpokesSameHandleResolver {
    private static final String SAME_HANDLE_TAKEOVER_HEADER = "takeover";


    private static final String SAME_HANDLE_USER_ID_HEADER = "userId";


    /**
     * Key is CS user ID of handle conflicted user, value indicates if he/she wants to take over the TC handle.
     */
    private static Map<String, Boolean> sameHandleTakeover = new HashMap<String, Boolean>();


     /**
     * DB connection name used to obtain DB connection.
     */
    private static final String DB_CONNECTION_NAME = "DefaultSequence";
    /**
     * Test mode switch.
     */
    private static final String TEST_MODE_SWITCH = "-t";

    /**
     * Help switch.
     */
    private static final String HELP_SWITCH = "-h";

    /**
     * Summand used for activation code generation.
     */
    private static final String ACTIVATION_CODE_HASH_SUMMAND = "TopCoder";

    /**
     * Radix used for activation code generation.
     */
    private static final int ACTION_CODE_HASH_RADIX = 36;

    /**
     * Warning file name.
     */
    private static final String WARNING_FILE_NAME = "warnings.txt";

    /**
     * Error file name.
     */
    private static final String ERROR_FILE_NAME = "errors.txt";

    /**
     * Report file name.
     */
    private static final String REPORT_FILE_NAME = "report.txt";

    /**
     * Set of IDs of social login providers, which uses email address for user name.
     */
    private static final Set<Long> EMAIL_USERNAME_SOCIAL_LOGIN_PROVIDER_IDS =
            new HashSet<Long>(Arrays.asList(new Long[] { 1L, 2L }));

    /**
     * DB connection factory name space.
     */
    private static final String DB_CONNECTION_FACTORY_NAMESPACE =
            "com.topcoder.db.connectionfactory.DBConnectionFactoryImpl";

    /**
     * Name of the image ID sequence.
     */
    private static final String IMAGE_SEQ = "IMAGE_SEQ";

    /**
     * Name of the path ID sequence.
     */
    private static final String PATH_SEQ = "PATH_SEQ";

    /**
     * Name of the phone ID sequence.
     */
    private static final String PHONE_SEQ = "PHONE_SEQ";

    /**
     * Name of the user school ID sequence.
     */
    private static final String USER_SCHOOL_SEQ = "USER_SCHOOL_SEQ";

    /**
     * Name of the email ID sequence.
     */
    private static final String EMAIL_SEQ = "EMAIL_SEQ";

    /**
     * Name of the user ID sequence.
     */
    private static final String USER_SEQ = "USER_SEQ";

    /**
     * Name of the address ID sequence.
     */
    private static final String ADDRESS_SEQ = "ADDRESS_SEQ";

    /**
     * Name of the user group ID sequence.
     */
    private static final String USER_GROUP_SEQ = "USER_GROUP_SEQ";

    /**
     * Github contact type ID.
     */
    private static final long GITHUB_CONTACT_TYPE_ID = 11;

    /**
     * Name of the user contact ID sequence.
     */
    private static final String USER_CONTACT_SEQ = "USER_CONTACT_SEQ";

    /**
     * IDs of security groups that should be assigned to every CloudSpokes user.
     */
    private static final long[] SECURITY_GROUP_IDS = new long[] {
        10L, 14L, 2000116L
    };

    /**
     * Constant for 'Decline to answer' response.
     */
    private static final String DECLINE_TO_ANSWER = "Decline to Answer";

    /**
     * String used in input file for large shirt size.
     */
    private static final String SHIRT_SIZE_LARGE = "large";

    /**
     * String used in input file for extra large shirt size.
     */
    private static final String SHIRT_SIZE_X_LARGE = "x-large";

    /**
     * String used in input file for medium shirt size.
     */
    private static final String SHIRT_SIZE_MEDIUM = "medium";

    /**
     * String used in input file for small shirt size.
     */
    private static final String SHIRT_SIZE_SMALL = "small";

    /**
     * String used in input file for female gender.
     */
    private static final String CS_GENDER_FEMALE = "Female";

    /**
     * String used in input file for male gender.
     */
    private static final String CS_GENDER_MALE = "Male";

    /**
     * String used in input file for 'decline to answer' age range.
     */
    private static final String CS_AGE_RANGE_DECLINE_TO_ANSWER = "Prefer not answer";

    /**
     * String used in input file for 60+ age range.
     */
    private static final String CS_AGE_RANGE_60_AND_UP = "60+";

    /**
     * String used in input file for 41-60 age range.
     */
    private static final String CS_AGE_RANGE_41_60 = "41-60";

    /**
     * String used in input file for 31-40 age range.
     */
    private static final String CS_AGE_RANGE_31_40 = "31-40";

    /**
     * String used in input file for 21-30 age range.
     */
    private static final String CS_AGE_RANGE_21_30 = "21-30";

    /**
     * String used in input file for 14-20 age range.
     */
    private static final String CS_AGE_RANGE_14_20 = "14-20";

    /**
     * ID of shirt size demographic question.
     */
    private static final long SHIRT_SIZE_DEMOGRAPHIC_QUESTION_ID = 26L;

    /**
     * ID of age range demographic question.
     */
    private static final long AGE_RANGE_DEMOGRAPHIC_QUESTION_ID = 1L;

    /**
     * ID of gender demographic question.
     */
    private static final long GENDER_DEMOGRAPHIC_QUESTION_ID = 2L;

    /**
     * United States country code.
     */
    private static final String US_COUNTRY_CODE = "840";

    /**
     * Work phone type ID.
     */
    private static final long WORK_PHONE_TYPE_ID = 1L;

    /**
     * Home phone type ID.
     */
    private static final long HOME_PHONE_TYPE_ID = 2L;

    /**
     * Image path maximum length.
     */
    private static final int MAX_LENGTH_IMAGE_PATH = 255;

    /**
     * Quote maximum length.
     */
    private static final int MAX_LENGTH_QUOTE = 255;

    /**
     * Contact info maximum length.
     */
    private static final int MAX_LENGTH_CONTACT_INFO = 254;

    /**
     * 3rd party username maximum length.
     */
    private static final int MAX_LENGTH_THIRD_PARTY_USERNAME = 100;

    /**
     * Default shirt size ID.
     */
    private static final long DEFAULT_SHIRT_SIZE_ID = 184L;

    /**
     * Default gender ID.
     */
    private static final long DEFAULT_GENDER_ID = 103L;

    /**
     * Default age range ID.
     */
    private static final long DEFAULT_AGE_RANGE_ID = 102L;

    /**
     * Name maximum length.
     */
    private static final int MAX_LENGTH_NAME = 64;

    /**
     * Resource ID length.
     */
    private static final int MAX_LENGTH_RESOURCE_ID = 200;

    /**
     * Phone maximum length.
     */
    private static final int MAX_LENGTH_PHONE = 64;

    /**
     * Zip code maximum length.
     */
    private static final int MAX_LENGTH_ZIP = 15;

    /**
     * City maximum length.
     */
    private static final int MAX_LENGTH_CITY = 64;

    /**
     * Address maximum length.
     */
    private static final int MAX_LENGTH_ADDRESS = 254;

    /**
     * Handle maximum length.
     */
    private static final int MAX_LENGTH_HANDLE = 50;

    /**
     * Email maximum length.
     */
    private static final int MAX_LENGTH_EMAIL = 100;

    /**
     * Province maximum length.
     */
    private static final int MAX_LENGTH_PROVINCE = 64;

    /**
     * Logger.
     */
    private static final Logger LOG = LogManager.getLogger(CloudSpokesSameHandleResolver.class);

    /**
     * Formatter for create date in input CSV file.
     */
    private static final DateFormat CREATE_DATE_FORMAT =
            new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

    /**
     * Input file I/O error message.
     */
    private static final String INPUT_FILE_IO_ERROR_MESSAGE = "Input file I/O error.";

    /**
     * Input CSV file expected header.
     */
    private static final String[] HEADER_LINE = new String[] {
        "Id", "Address_Line1__c", "Address_Line2__c", "Age_Range__c", "City__c", "Country__c", "Email__c",
        "First_Name__c", "Gender__c", "Phone_Home__c", "Last_Name__c", "Profile_Pic__c", "Quote__c", "School__c",
        "Shirt_Size__c", "State__c", "Time_Zone__c", "Username__c", "Phone_Work__c", "Zip__c", "CreatedDate",
        "Github__c", "SFDC_User__r.Third_Party_Account__c", "SFDC_User__r.Third_Party_Username__c"
    };

    /**
     * Name of the create date column in the input CSV file.
     */
    private static final String CSV_COLUMN_CREATE_DATE = HEADER_LINE[20];

    /**
     * Name of the profile picture URL column in the input CSV file.
     */
    private static final String CSV_COLUMN_PROFILE_PIC = HEADER_LINE[11];

    /**
     * Name of the time zone column in the input CSV file.
     */
    private static final String CSV_COLUMN_TIME_ZONE = HEADER_LINE[16];

    /**
     * Name of the school column in the input CSV file.
     */
    private static final String CSV_COLUMN_SCHOOL = HEADER_LINE[13];

    /**
     * Name of the quote column in the input CSV file.
     */
    private static final String CSV_COLUMN_QUOTE = HEADER_LINE[12];

    /**
     * Name of the shirt size column in the input CSV file.
     */
    private static final String CSV_COLUMN_SHIRT_SIZE = HEADER_LINE[14];

    /**
     * Name of the gender column in the input CSV file.
     */
    private static final String CSV_COLUMN_GENDER = HEADER_LINE[8];

    /**
     * Name of the age range column in the input CSV file.
     */
    private static final String CSV_COLUMN_AGE_RANGE = HEADER_LINE[3];

    /**
     * Name of the last name column in the input CSV file.
     */
    private static final String CSV_COLUMN_LAST_NAME = HEADER_LINE[10];

    /**
     * Name of the ID column in the input CSV file.
     */
    private static final String CSV_COLUMN_ID = HEADER_LINE[0];

    /**
     * Name of the first name column in the input CSV file.
     */
    private static final String CSV_COLUMN_FIRST_NAME = HEADER_LINE[7];

    /**
     * Name of the work phone column in the input CSV file.
     */
    private static final String CSV_COLUMN_WORK_PHONE = HEADER_LINE[18];

    /**
     * Name of the home phone column in the input CSV file.
     */
    private static final String CSV_COLUMN_HOME_PHONE = HEADER_LINE[9];

    /**
     * Name of the zip code column in the input CSV file.
     */
    private static final String CSV_COLUMN_ZIP = HEADER_LINE[19];

    /**
     * Name of the state column in the input CSV file.
     */
    private static final String CSV_COLUMN_STATE = HEADER_LINE[15];

    /**
     * Name of the country column in the input CSV file.
     */
    private static final String CSV_COLUMN_COUNTRY = HEADER_LINE[5];

    /**
     * Name of the city column in the input CSV file.
     */
    private static final String CSV_COLUMN_CITY = HEADER_LINE[4];

    /**
     * Name of the address line 1 column in the input CSV file.
     */
    private static final String CSV_COLUMN_ADDRESS_LINE_1 = HEADER_LINE[1];

    /**
     * Name of the address line 2 column in the input CSV file.
     */
    private static final String CSV_COLUMN_ADDRESS_LINE_2 = HEADER_LINE[2];

    /**
     * Name of the handle column in the input CSV file.
     */
    private static final String CSV_COLUMN_HANDLE = HEADER_LINE[17];

    /**
     * Name of the email column in the input CSV file.
     */
    private static final String CSV_COLUMN_EMAIL = HEADER_LINE[6];

    /**
     * Name of the Github user name column in the input CSV file.
     */
    private static final String CSV_COLUMN_GITHUB = HEADER_LINE[21];

    /**
     * Name of the 3rd party account column in the input CSV file.
     */
    private static final String CSV_COLUMN_THIRD_PARTY_ACCOUNT = HEADER_LINE[22];

    /**
     * Name of the 3rd party user name column in the input CSV file.
     */
    private static final String CSV_COLUMN_THIRD_PARTY_USERNAME = HEADER_LINE[23];

    /**
     * Demographic answer ID for large shirt size.
     */
    private static final long SHIRT_SIZE_ID_LARGE = 181L;

    /**
     * Demographic answer ID for extra large shirt size.
     */
    private static final long SHIRT_SIZE_ID_X_LARGE = 182L;

    /**
     * Demographic answer ID for medium shirt size.
     */
    private static final long SHIRT_SIZE_ID_MEDIUM = 180L;

    /**
     * Demographic answer ID for small shirt size.
     */
    private static final long SHIRT_SIZE_ID_SMALL = 179L;

    /**
     * Demographic answer ID for female gender.
     */
    private static final long GENDER_ID_FEMALE = 8L;

    /**
     * Demographic answer ID for male gender.
     */
    private static final long GENDER_ID_MALE = 6L;

    /**
     * Demographic answer ID for 13-17 age range.
     */
    private static final long AGE_RANGE_ID_13_17 = 1;

    /**
     * Demographic answer ID for 18-24 age range.
     */
    @SuppressWarnings("unused")
    private static final long AGE_RANGE_ID_18_24 = 2;

    /**
     * Demographic answer ID for 25-34 age range.
     */
    private static final long AGE_RANGE_ID_25_34 = 3;

    /**
     * Demographic answer ID for 35-44 age range.
     */
    private static final long AGE_RANGE_ID_35_44 = 4;

    /**
     * Demographic answer ID for 45+ age range.
     */
    private static final long AGE_RANGE_ID_45_AND_UP = 5;

    /**
     * Default password hash for CloudSpokes users.
     */
    private static String defaultPasswordHash = "4EjPjy6o+/C+dqNPnxIy9A==";

    /**
     * Default password for CloudSpokes users.
     */
    private static String defaultPassword = "password";

    /**
     * Country codes lookup map.
     * Key is country name in lower case, value is country code.
     */
    private static Map<String, String> countryCodes = new HashMap<String, String>();

    /**
     * State codes lookup map.
     * Key is state name in lower case, value is state code.
     */
    private static Map<String, String> stateCodes = new HashMap<String, String>();

    /**
     * Time zones lookup map.
     * Key is time zone name in lower case, value is time zone ID.
     */
    private static Map<String, Long> timeZoneIDByName = new HashMap<String, Long>();

    /**
     * Social login providers lookup man.
     * Key is social login provider name in lower case, value is its ID.
     */
    private static Map<String, Long> socialLoginProviderIDByName = new HashMap<String, Long>();

    /**
     * Schools lookup map.
     * Key is school name in lower case, value is school ID.
     */
    private static Map<String, Long> schoolIDByName = new HashMap<String, Long>();

    /**
     * Input email indices map.
     * Key is email (in lower case) from input CSV file, value is index of its first occurrence there.
     */
    private static Map<String, Integer> inputEmailIndices = new HashMap<String, Integer>();

    /**
     * Input handle indices map.
     * Key is handle (in lower case) from input CSV file, value is index of its first occurrence there.
     */
    private static Map<String, Integer> inputHandleIndices = new HashMap<String, Integer>();

    /**
     * Address ID generator.
     */
    private static IDGenerator addressIDGenerator;

    /**
     * User ID generator.
     */
    private static IDGenerator userIDGenerator;

    /**
     * Email ID generator.
     */
    private static IDGenerator emailIDGenerator;

    /**
     * User school ID generator.
     */
    private static IDGenerator userSchoolIDGenerator;

    /**
     * Phone ID generator.
     */
    private static IDGenerator phoneIDGenerator;

    /**
     * Image ID generator.
     */
    private static IDGenerator imageIDGenerator;

    /**
     * Path ID generator.
     */
    private static IDGenerator pathIDGenerator;

    /**
     * User group ID generator.
     */
    private static IDGenerator userGroupIDGenerator;

    /**
     * User contact ID generator.
     */
    private static IDGenerator userContactIDGenerator;

    /**
     * Insert user statement.
     */
    private static PreparedStatement insertUserStmt = null;

    /**
     * Rename user statement.
     */
    private static PreparedStatement renameUserStmt = null;

    /**
     * Rename user in security_role table statement.
     */
    private static PreparedStatement renameSecurityUserStmt = null;

    /**
     * Check if user is already imported statement.
     */
    private static PreparedStatement alreadyImportedStmt = null;

    /**
     * Search handle statement.
     */
    private static PreparedStatement searchHandleStmt = null;

    /**
     * Insert school statement.
     */
    private static PreparedStatement insertSchoolStmt = null;

    /**
     * Insert address statement.
     */
    private static PreparedStatement insertAddressStmt = null;

    /**
     * Insert user address statement.
     */
    private static PreparedStatement insertUserAddressStmt = null;

    /**
     * Insert email statement.
     */
    private static PreparedStatement insertEmailStmt = null;

    /**
     * Insert phone statement.
     */
    private static PreparedStatement insertPhoneStmt = null;

    /**
     * Insert image statement.
     */
    private static PreparedStatement insertImageStmt = null;

    /**
     * Insert coder image statement.
     */
    private static PreparedStatement insertCoderImageStmt = null;

    /**
     * Insert path statement.
     */
    private static PreparedStatement insertPathStmt = null;

    /**
     * Insert demographic response statement.
     */
    private static PreparedStatement insertDemographicResponseStmt = null;

    /**
     * Insert coder statement.
     */
    private static PreparedStatement insertCoderStmt = null;

    /**
     * Insert security user statement.
     */
    private static PreparedStatement insertSecurityUserStmt = null;

    /**
     * Insert user group statement.
     */
    private static PreparedStatement insertUserGroupStmt = null;

    /**
     * Insert social login statement.
     */
    private static PreparedStatement insertSocialLoginStmt = null;

    /**
     * Get email owner statement.
     */
    private static PreparedStatement getEmailOwnerStmt = null;

    /**
     * Search path statement.
     */
    private static PreparedStatement searchPathStmt = null;

    /**
     * Insert user contact statement.
     */
    private static PreparedStatement insertUserContactStmt = null;

    /**
     * DB connection.
     */
    private static Connection conn;

    /**
     * Input file header.
     */
    private static String[] inputHeader;

    /**
     * Input file reader.
     */
    private static CsvMapReader inputReader;

    /**
     * Report writer.
     */
    private static PrintWriter reportWriter;

    /**
     * Error writer.
     */
    private static PrintWriter errorWriter;

    /**
     * Warning writer.
     */
    private static PrintWriter warnWriter;

    /**
     * Indicates if test mode is on.
     */
    private static boolean isTestMode = false;

    /**
     * Counter of users, imported successfully without warnings.
     */
    private static int totalSuccess = 0;

    /**
     * Counter of users, imported successfully with warnings.
     */
    private static int totalWarning = 0;

    /**
     * Counter of users, import for which was failed.
     */
    private static int totalError = 0;

    /**
     * String builder for warnings.
     */
    private static StringBuilder warnings;

    /**
     * Amount items per single transaction.
     */
    private static int transactionItemCount = 50;

    /**
     * Empty private constructor prevents instantiation.
     */
    private CloudSpokesSameHandleResolver() {
    }

    /**
     * Parses and validates email.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseEmail(String value, int curUserIndex) {
        String email = value;
        if (email.length() == 0) {
            printImportError("email is not specified", curUserIndex);
            return null;
        }
        if (email.length() > MAX_LENGTH_EMAIL) {
            printImportError("email is longer than " + MAX_LENGTH_EMAIL
                    + " characters", curUserIndex);
            return null;
        }
        if (inputEmailIndices.containsKey(email.toLowerCase())) {
            printImportError(String.format("email '%s' already used by CloudSpokes user from line %d",
                    email, inputEmailIndices.get(email.toLowerCase()) + 1), curUserIndex);
            return null;
        }
        String emailOwner = null;
        try {
            emailOwner = getEmailOwnerHandle(email);
        } catch (SQLException e) {
            printImportError("error during checking email uniqueness", curUserIndex);
            return null;
        }
        if (emailOwner != null) {
            printImportError(String.format("email '%s' is assigned to existing TC user '%s'",
                    email, emailOwner), curUserIndex);
            return null;
        }
        return email;
    }

    /**
     * Parses and validates handle.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseHandle(String value, int curUserIndex) {
        String handle = value;
        if (handle.length() == 0) {
            printImportError("handle is not specified", curUserIndex);
            return null;
        }
        if (handle.length() > MAX_LENGTH_HANDLE) {
            printImportError("handle is longer than " + MAX_LENGTH_HANDLE
                    + " characters", curUserIndex);
            return null;
        }
        if (inputHandleIndices.containsKey(handle.toLowerCase())) {
            printImportError(String.format("handle '%s' already used by CloudSpokes user from line %d",
                    handle, inputHandleIndices.get(handle.toLowerCase()) + 1), curUserIndex);
            return null;
        }
        /*boolean handleOccupied = false;
        try {
            handleOccupied = handleExist(handle);
        } catch (SQLException e) {
            printImportError("error during checking handle uniqueness", curUserIndex);
            return null;
        }
        if (handleOccupied) {
            printImportError(String.format("handle '%s' is already occupied by TC user",
                    handle), curUserIndex);
            return null;
        }*/
        return handle;
    }

    /**
     * Parses and validates address.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseAddress(String value, int curUserIndex) {
        String addressLine = value;
        if (addressLine.length() > MAX_LENGTH_ADDRESS) {
            warnings.append("; address is truncated to " + MAX_LENGTH_ADDRESS + " characters");
            addressLine = addressLine.substring(0, MAX_LENGTH_ADDRESS);
        }
        if (addressLine.length() == 0) {
            addressLine = null;
        }
        return addressLine;
    }

    /**
     * Parses and validates city.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseCity(String value, int curUserIndex) {
        String city = value;
        if (city.length() > MAX_LENGTH_CITY) {
            warnings.append("; city is truncated to " + MAX_LENGTH_CITY + " characters");
            city = city.substring(0, MAX_LENGTH_CITY);
        }
        if (city.length() == 0) {
            city = null;
        }
        return city;
    }

    /**
     * Parses and validates country.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseCountry(String value, int curUserIndex) {
        String countryName = value;
        String countryCode = null;
        if (countryCodes.containsKey(countryName.toLowerCase())) {
            countryCode = countryCodes.get(countryName.toLowerCase());
        }
        if (countryName.length() > 0 && countryCode == null) {
            warnings.append(String.format("; unknown country '%s'", countryName));
        }
        return countryCode;
    }

    /**
     * Parses and validates zip code.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseZip(String value, int curUserIndex) {
        // Validate zip code.
        String zip = value;
        if (zip.length() > MAX_LENGTH_ZIP) {
            warnings.append("; zip is truncated to " + MAX_LENGTH_ZIP + " characters");
            zip = zip.substring(0, MAX_LENGTH_ZIP);
        }
        if (zip.length() == 0) {
            zip = null;
        }
        return zip;
    }

    /**
     * Parses and validates phone.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parsePhone(String value, int curUserIndex) {
        String phone = value;
        if (phone.length() > MAX_LENGTH_PHONE) {
            warnings.append("; phone number is truncated to " + MAX_LENGTH_PHONE + " characters");
            phone = phone.substring(0, MAX_LENGTH_PHONE);
        }
        if (phone.length() == 0) {
            phone = null;
        }
        return phone;
    }

    /**
     * Parses and validates name.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseName(String value, int curUserIndex) {
        String name = value;
        if (name.length() > MAX_LENGTH_NAME) {
            warnings.append("; name is truncated to " + MAX_LENGTH_NAME + " characters");
            name = name.substring(0, MAX_LENGTH_NAME);
        }
        if (name.length() == 0) {
            name = null;
        }
        return name;
    }

    /**
     * Parses and resource ID.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseResourceID(String value, int curUserIndex) {
        String id = value;
        if (id.length() > MAX_LENGTH_RESOURCE_ID) {
            printImportError("ID may not be longer than " + MAX_LENGTH_RESOURCE_ID + " characters", curUserIndex);
            return null;
        }
        if (id.length() == 0) {
            id = null;
        }
        return id;
    }

    /**
     * Parses and validates age range.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static long parseAgeRange(String value, int curUserIndex) {
        String ageRangeText = value;
        long ageRangeID = DEFAULT_AGE_RANGE_ID;
        if (ageRangeText.length() > 0) {
            if (ageRangeText.equalsIgnoreCase(CS_AGE_RANGE_14_20)) {
                ageRangeID = AGE_RANGE_ID_13_17;
            } else if (ageRangeText.equalsIgnoreCase(CS_AGE_RANGE_21_30)) {
                ageRangeID = AGE_RANGE_ID_25_34;
            } else if (ageRangeText.equalsIgnoreCase(CS_AGE_RANGE_31_40)) {
                ageRangeID = AGE_RANGE_ID_35_44;
            } else if (ageRangeText.equalsIgnoreCase(CS_AGE_RANGE_41_60)) {
                ageRangeID = AGE_RANGE_ID_45_AND_UP;
            } else if (ageRangeText.equalsIgnoreCase(CS_AGE_RANGE_60_AND_UP)) {
                ageRangeID = AGE_RANGE_ID_45_AND_UP;
            } else if (!ageRangeText.equalsIgnoreCase(CS_AGE_RANGE_DECLINE_TO_ANSWER)) {
                warnings.append(String.format("; age range '%s' is not recognised , assuming decline to answer",
                        ageRangeText));
            }
        }
        return ageRangeID;
    }

    /**
     * Parses and validates gender.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static long parseGender(String value, int curUserIndex) {
        String genderText = value;
        long genderID = DEFAULT_GENDER_ID;
        if (genderText.equalsIgnoreCase(CS_GENDER_MALE)) {
            genderID = GENDER_ID_MALE;
        } else if (genderText.equalsIgnoreCase(CS_GENDER_FEMALE)) {
            genderID = GENDER_ID_FEMALE;
        } else if (genderText.length() > 0) {
            warnings.append(String.format("; unknown gender '%s', assuming decline to answer", genderText));
        }
        return genderID;
    }

    /**
     * Parses and validates shirt size.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static long parseShirtSize(String value, int curUserIndex) {
        String shirtSizeText = value;
        long shirtSizeID = DEFAULT_SHIRT_SIZE_ID;
        if (shirtSizeText.toLowerCase().contains(SHIRT_SIZE_SMALL)) {
            shirtSizeID = SHIRT_SIZE_ID_SMALL;
        } else if (shirtSizeText.toLowerCase().contains(SHIRT_SIZE_MEDIUM)) {
            shirtSizeID = SHIRT_SIZE_ID_MEDIUM;
        } else if (shirtSizeText.toLowerCase().contains(SHIRT_SIZE_X_LARGE)) {
            shirtSizeID = SHIRT_SIZE_ID_X_LARGE;
        } else if (shirtSizeText.toLowerCase().contains(SHIRT_SIZE_LARGE)) {
            shirtSizeID = SHIRT_SIZE_ID_LARGE;
        } else if (shirtSizeText.length() > 0) {
            warnings.append(String.format("; sirt size '%s' not recognized, assuming decline to answer",
                    shirtSizeText));
        }
        return shirtSizeID;
    }

    /**
     * Parses and validates quote.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseQuote(String value, int curUserIndex) {
        String quote = value;
        if (quote.length() > MAX_LENGTH_QUOTE) {
            warnings.append("; quote is truncated to " + MAX_LENGTH_QUOTE + " characters");
            quote = quote.substring(0, MAX_LENGTH_QUOTE);
        }
        if (quote.length() == 0) {
            quote = null;
        }
        return quote;
    }

    /**
     * Parses and validates school.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static Long parseSchool(String value, int curUserIndex) {
        String schoolName = value;
        Long schoolID = null;
        if (schoolIDByName.containsKey(schoolName.toLowerCase())) {
            schoolID = schoolIDByName.get(schoolName.toLowerCase());
        }
        if (schoolName.length() > 0 && schoolID == null) {
            warnings.append(String.format("; unknown school '%s'", schoolName));
        }
        return schoolID;
    }

    /**
     * Parses and validates time zone.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static Long parseTimeZone(String value, int curUserIndex) {
        String timeZoneName = value;
        Long timeZoneID = null;
        if (timeZoneIDByName.containsKey(timeZoneName.toLowerCase())) {
            timeZoneID = timeZoneIDByName.get(timeZoneName.toLowerCase());
        }
        if (timeZoneName.length() > 0 && timeZoneID == null) {
            warnings.append(String.format("; unknown timezone '%s'", timeZoneName));
        }
        return timeZoneID;
    }

    /**
     * Parses and validates create date.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static Date parseCreateDate(String value, int curUserIndex) {
        String createDateText = value;
        Date createDate = null;
        if (createDateText.length() > 0) {
            try {
                createDate = CREATE_DATE_FORMAT.parse(createDateText);
            } catch (ParseException e) {
                warnings.append(String.format("; date '%s' can't be parsed", createDateText));
            }
        }
        return createDate;
    }

    /**
     * Parses and validates profile picture.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseProfilePic(String value, int curUserIndex) {
        String imageURL = value;
        if (imageURL.length() > MAX_LENGTH_IMAGE_PATH) {
            warnings.append("; profile picture URL is longer than " + MAX_LENGTH_IMAGE_PATH
                    + " characters, assuming no picture");
            imageURL = null;
        } else if (imageURL.length() == 0) {
            imageURL = null;
        }
        return imageURL;
    }

    /**
     * Parses and validates Github user name.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseGithubUsername(String value, int curUserIndex) {
        String username = value;
        if (username.length() > MAX_LENGTH_CONTACT_INFO) {
            printImportError("Github username is longer than " + MAX_LENGTH_CONTACT_INFO
                    + " characters", curUserIndex);
            return null;
        } else if (username.length() == 0) {
            username = null;
        }
        return username;
    }

    /**
     * Parses and validates social username.
     *
     * @param value Value to parse.
     * @param curUserIndex Index of current user in the input file.
     * @return Parsed value.
     */
    private static String parseSocialUsername(String value, int curUserIndex) {
        String username = value;
        if (username.length() > MAX_LENGTH_THIRD_PARTY_USERNAME) {
            printImportError("3rd party username is longer than " + MAX_LENGTH_THIRD_PARTY_USERNAME
                    + " characters", curUserIndex);
            return null;
        } else if (username.length() == 0) {
            username = null;
        }
        return username;
    }

    /**
     * Processes given line of input CSV file.
     *
     * @param inputLine Current input line.
     * @param curUserIndex Index of current user in the input file.
     * @return If had coflcited username.
     */
    private static boolean processInputLine(Map<String, String> inputLine, int curUserIndex) {
        // Validate input values.
        warnings = new StringBuilder();
        if (inputLine.size() != HEADER_LINE.length) {
            printImportError("Invalid amount of columns.", curUserIndex);
            return false;
        }
        for (String header : HEADER_LINE) {
            if (!inputLine.containsKey(header) || inputLine.get(header) == null) {
                inputLine.put(header, "");
            }
        }
        int totalErrorBefore = totalError;

        String resourceID = parseResourceID(inputLine.get(CSV_COLUMN_ID).trim(), curUserIndex);
		
		
		
        boolean sameHandle = resourceID != null && sameHandleTakeover.containsKey(resourceID);
        if (!sameHandle) {
            return false;
        }
		
		 if (resourceID != null) {
            try {
                if (alreadyImported(resourceID)) {
                    warnings.append("; user with CloudSpokes ID " + resourceID + " is already imported (skipping)");
                    printImportWarning(warnings.toString().substring(2), curUserIndex);
                    return false;
                }
            } catch (SQLException e) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    LOG.error("Error during rolling back the changes.", ex);
                }
                printImportError("DB operation failed.", curUserIndex);
                return false;
            }
        }

        String email = parseEmail(inputLine.get(CSV_COLUMN_EMAIL).trim(), curUserIndex);
        String handle = parseHandle(inputLine.get(CSV_COLUMN_HANDLE).trim(), curUserIndex);
        if (totalError != totalErrorBefore) {
            totalError = totalErrorBefore + 1;
            return false;
        }
        String githubUsername = parseGithubUsername(inputLine.get(CSV_COLUMN_GITHUB).trim(), curUserIndex);
        if (totalError != totalErrorBefore) {
            return false;
        }
        String addressLine1 = parseAddress(inputLine.get(CSV_COLUMN_ADDRESS_LINE_1).trim(), curUserIndex);
        String addressLine2 = parseAddress(inputLine.get(CSV_COLUMN_ADDRESS_LINE_2).trim(), curUserIndex);
        String city = parseCity(inputLine.get(CSV_COLUMN_CITY).trim(), curUserIndex);
        String countryCode = parseCountry(inputLine.get(CSV_COLUMN_COUNTRY).trim(), curUserIndex);
        String zip = parseZip(inputLine.get(CSV_COLUMN_ZIP).trim(), curUserIndex);
        // Determine and validate state.
        String stateName = inputLine.get(CSV_COLUMN_STATE).trim();
        String stateCode = null;
        String province = null;
        if (stateName.length() > 0) {
            if (US_COUNTRY_CODE.equals(countryCode)) {
                if (stateCodes.containsKey(stateName.toLowerCase())) {
                    stateCode = stateCodes.get(stateName.toLowerCase());
                } else {
                    warnings.append(String.format("; unknown state '%s'", stateName));
                }
            } else {
                province = stateName;
                if (province.length() > MAX_LENGTH_PROVINCE) {
                    warnings.append("; outside US state (treated as province) truncated to "
                            + MAX_LENGTH_PROVINCE + " characters");
                    province = province.substring(0, MAX_LENGTH_PROVINCE);
                }
            }
        }
        // Validate phone numbers.
        String homePhoneNumber = parsePhone(inputLine.get(CSV_COLUMN_HOME_PHONE).trim(), curUserIndex);
        String workPhoneNumber = parsePhone(inputLine.get(CSV_COLUMN_WORK_PHONE).trim(), curUserIndex);
        // Validate first and last name.
        String firstName = parseName(inputLine.get(CSV_COLUMN_FIRST_NAME).trim(), curUserIndex);
        String lastName = parseName(inputLine.get(CSV_COLUMN_LAST_NAME).trim(), curUserIndex);
        long ageRangeID = parseAgeRange(inputLine.get(CSV_COLUMN_AGE_RANGE).trim(), curUserIndex);
        String ageRangeResponse = (ageRangeID == DEFAULT_AGE_RANGE_ID) ? DECLINE_TO_ANSWER : null;
        long genderID = parseGender(inputLine.get(CSV_COLUMN_GENDER).trim(), curUserIndex);
        String genderResponse = (genderID == DEFAULT_GENDER_ID) ? DECLINE_TO_ANSWER : null;
        long shirtSizeID = parseShirtSize(inputLine.get(CSV_COLUMN_SHIRT_SIZE).trim(), curUserIndex);
        String shirtSizeResponse = (shirtSizeID == DEFAULT_SHIRT_SIZE_ID) ? DECLINE_TO_ANSWER : null;
        String quote = parseQuote(inputLine.get(CSV_COLUMN_QUOTE).trim(), curUserIndex);
        Long schoolID = parseSchool(inputLine.get(CSV_COLUMN_SCHOOL).trim(), curUserIndex);
        Long timeZoneID = parseTimeZone(inputLine.get(CSV_COLUMN_TIME_ZONE).trim(), curUserIndex);
        Date createDate = parseCreateDate(inputLine.get(CSV_COLUMN_CREATE_DATE).trim(), curUserIndex);
        String imageURL = parseProfilePic(inputLine.get(CSV_COLUMN_PROFILE_PIC).trim(), curUserIndex);
        String socialAccount = inputLine.get(CSV_COLUMN_THIRD_PARTY_ACCOUNT).trim();
        if (socialAccount.equalsIgnoreCase("google_oauth2")) {
            socialAccount = "Google";
        }
        Long socialLoginProviderID = null;
        if (socialAccount.length() != 0) {
            if (socialLoginProviderIDByName.containsKey(socialAccount.toLowerCase())) {
                socialLoginProviderID = socialLoginProviderIDByName.get(socialAccount.toLowerCase());
            } else {
                warnings.append("; social login provider '" + socialAccount + "' unknown.");
            }
        }
        String socialUsername = parseSocialUsername(
                inputLine.get(CSV_COLUMN_THIRD_PARTY_USERNAME).trim(), curUserIndex);

        // Save processed email and handle.
        inputEmailIndices.put(email.toLowerCase(), curUserIndex);
        inputHandleIndices.put(handle.toLowerCase(), curUserIndex);

        // Persist user related data to DB.
        if (!isTestMode) {
            try {
                if (sameHandleTakeover.get(resourceID)) {
                    renameUser(handle, handle + "_tc");
                } else {
                    handle += "_cs";
                }
                long userID  = persistUser(resourceID, firstName, lastName, handle, timeZoneID, createDate);
                if (schoolID != null) {
                    persistUserSchool(userID, schoolID, createDate);
                }
                persistAddress(userID, addressLine1, addressLine2, city, countryCode,
                        stateCode, zip, province, createDate);
                persistEmail(userID, email, createDate);
                if (homePhoneNumber != null) {
                    persistPhone(userID, homePhoneNumber, HOME_PHONE_TYPE_ID, createDate);
                }
                if (workPhoneNumber != null) {
                    persistPhone(userID, workPhoneNumber, WORK_PHONE_TYPE_ID, createDate);
                }
                persistCoder(userID, quote, countryCode, createDate);
				
				if (imageURL != null && !imageURL.endsWith("default_cs_member_image.png") && 
										!imageURL.endsWith("default_appirio_member_image.png")) {
                    persistImage(userID, imageURL);
                }
               
                if (githubUsername != null) {
                    persistUserContact(userID, GITHUB_CONTACT_TYPE_ID, githubUsername);
                }
                persistDemographicResponse(userID, GENDER_DEMOGRAPHIC_QUESTION_ID, genderID,
                        genderResponse, createDate);
                persistDemographicResponse(userID, AGE_RANGE_DEMOGRAPHIC_QUESTION_ID, ageRangeID,
                        ageRangeResponse, createDate);
                persistDemographicResponse(userID, SHIRT_SIZE_DEMOGRAPHIC_QUESTION_ID, shirtSizeID,
                        shirtSizeResponse, createDate);
                persistUserSecurity(userID, handle, createDate);
                if (socialLoginProviderID != null) {
                    persistSocialLogin(userID, socialLoginProviderID, socialUsername, createDate);
                }
                // Add user to LDAP.
                addUserToLDAP(userID, handle);
            } catch (LDAPClientException e) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    LOG.error("Error during rolling back the changes.", ex);
                }
                printImportError("LDAP operation failed.", curUserIndex);
                return false;
            } catch (IDGenerationException e) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    LOG.error("Error during rolling back the changes.", ex);
                }
                printImportError("ID generation failed.", curUserIndex);
                return false;
            } catch (SQLException e) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    LOG.error("Error during rolling back the changes.", ex);
                }
				LOG.error("DB operation failed."+e);
                printImportError("DB operation failed.", curUserIndex);
                return false;
            }
        }

        // Print warnings if any.
        if (warnings.length() > 0) {
            printImportWarning(warnings.toString().substring(2), curUserIndex);
        } else {
            totalSuccess++;
        }
        return true;
    }

    /**
     * Adds user to LDAP.
     *
     * @param userId User ID.
     * @param handle User handle.
     * @throws LDAPClientException If any error occurs with LDAP.
     */
    private static void addUserToLDAP(long userId, String handle) throws LDAPClientException {
        LDAPClient ldapClient = new LDAPClient();
        try {
            ldapClient.connect();
            ldapClient.addTopCoderMemberProfile(userId, handle, defaultPassword, "U");
        } catch (LDAPClientException e) {
            LOG.error("LDAP error", e);
            throw e;
        } finally {
            try {
                ldapClient.disconnect();
            } catch (Exception e) {
                LOG.error("Disconnect from LDAP failed.", e);
            }
        }
    }

    /**
     * Checks if user is already imported.
     *
     * @param resourceID CloudSpokes ID.
     * @return If already imported.
     * @throws SQLException If any DB error occurs.
     */
    private static boolean alreadyImported(String resourceID) throws SQLException {
        ResultSet rs = null;
        try {
            if (alreadyImportedStmt == null) {
                alreadyImportedStmt = conn.prepareStatement(
                        "SELECT 1 FROM user WHERE open_id = ? AND status IN ('A', 'U')");
            }
            alreadyImportedStmt.setString(1, resourceID);
            rs = alreadyImportedStmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            LOG.error("Error searching user by CloudSpokes ID in DB.", e);
            throw e;
        } finally {
            close(null, rs);
        }
    }

    /**
     * Loads lookup values.
     *
     * @throws SQLException If any DB error occurs.
     */
    private static void loadLookupValues() throws SQLException {
        // Load countries.
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement("SELECT country_code, country_name FROM country");
            rs = stmt.executeQuery();
            while (rs.next()) {
                countryCodes.put(rs.getString("country_name").toLowerCase(), rs.getString("country_code"));
            }
            LOG.debug(String.format("Loaded %d countries from DB.", countryCodes.size()));
        } catch (SQLException e) {
            LOG.error("Error loading countries from DB.", e);
            throw e;
        } finally {
            close(stmt, rs);
        }

        // Load states.
        try {
            stmt = conn.prepareStatement("SELECT state_code, state_name FROM state");
            rs = stmt.executeQuery();
            while (rs.next()) {
                stateCodes.put(rs.getString("state_name").toLowerCase(), rs.getString("state_code"));
            }
            LOG.debug(String.format("Loaded %d states from DB.", stateCodes.size()));
        } catch (SQLException e) {
            LOG.error("Error loading states from DB.", e);
            throw e;
        } finally {
            close(stmt, rs);
        }

        // Load schools.
        try {
            stmt = conn.prepareStatement("SELECT school_id, name FROM school");
            rs = stmt.executeQuery();
            while (rs.next()) {
                schoolIDByName.put(rs.getString("name").toLowerCase(), rs.getLong("school_id"));
            }
            LOG.debug(String.format("Loaded %d schools from DB.", schoolIDByName.size()));
        } catch (SQLException e) {
            LOG.error("Error loading schools from DB.", e);
            throw e;
        } finally {
            close(stmt, rs);
        }

        // Load time zones.
        try {
            stmt = conn.prepareStatement("SELECT timezone_id, timezone_desc FROM timezone_lu");
            rs = stmt.executeQuery();
            while (rs.next()) {
                timeZoneIDByName.put(rs.getString("timezone_desc").toLowerCase(), rs.getLong("timezone_id"));
            }
            LOG.debug(String.format("Loaded %d time zones from DB.", timeZoneIDByName.size()));
        } catch (SQLException e) {
            LOG.error("Error loading time zones from DB.", e);
            throw e;
        } finally {
            close(stmt, rs);
        }
        // Add custom time zones.
        timeZoneIDByName.put("Pacific Time (US & Canada)".toLowerCase(), 553L); // US/Pacific
        timeZoneIDByName.put("International Date Line West".toLowerCase(), 555L); // US/Samoa
        timeZoneIDByName.put("Mountain Time (US & Canada)".toLowerCase(), 552L); // US/Mountain
        timeZoneIDByName.put("Central Time (US & Canada)".toLowerCase(), 546L); // US/Central
        timeZoneIDByName.put("Eastern Time (US & Canada)".toLowerCase(), 548L); // US/Eastern
        timeZoneIDByName.put("Alaska".toLowerCase(), 543L); // US/Alaska
        timeZoneIDByName.put("Arizona".toLowerCase(), 545L); // US/Arizona
        timeZoneIDByName.put("Indiana (East)".toLowerCase(), 547L); // US/East-Indiana
        timeZoneIDByName.put("Hawaii".toLowerCase(), 544L); // US/Aleutian

        // Load social login providers.
        try {
            stmt = conn.prepareStatement("SELECT social_login_provider_id, name FROM social_login_provider");
            rs = stmt.executeQuery();
            while (rs.next()) {
                socialLoginProviderIDByName.put(rs.getString("name").toLowerCase(), rs.getLong("social_login_provider_id"));
            }
            LOG.debug(String.format("Loaded %d social login providers from DB.", socialLoginProviderIDByName.size()));
        } catch (SQLException e) {
            LOG.error("Error loading social login providers from DB.", e);
            throw e;
        } finally {
            close(stmt, rs);
        }
    }

    /**
     * Renames user (changes handle).
     *
     * @param oldHandle Old handle.
     * @param newHandle New handle.
     * @throws SQLException If any DB error occurs.
     */
    private static void renameUser(String oldHandle, String newHandle)
        throws SQLException, IDGenerationException {
        // Update record in user table.
        try {
            if (renameUserStmt == null) {
                renameUserStmt = conn.prepareStatement(
                    "UPDATE user SET handle = ? WHERE handle_lower = lower(?);");
            }
            int index = 1;
            renameUserStmt.setString(index++, newHandle);
            renameUserStmt.setString(index++, oldHandle);
            renameUserStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error updating record in user table.", e);
            throw e;
        }

        // Update record in security_user table.
        try {
            if (renameSecurityUserStmt == null) {
                renameSecurityUserStmt = conn.prepareStatement(
                    "UPDATE security_user SET user_id = ? WHERE lower(user_id)= lower(?);");
            }
            int index = 1;
            renameSecurityUserStmt.setString(index++, newHandle);
            renameSecurityUserStmt.setString(index++, oldHandle);
            renameSecurityUserStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error updating record in security_user table.", e);
            throw e;
        }
    }

    /**
     * Persists user data to DB.
     * Use null arguments for unknown values.
     *
     * @param resourceID Resource ID.
     * @param firstName First name.
     * @param lastName Last name.
     * @param handle Handle.
     * @param timeZoneID Time zone ID.
     * @param createDate Create date.
     * @return Persisted user ID.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static long persistUser(String resourceID, String firstName, String lastName, String handle,
            Long timeZoneID, Date createDate)
        throws SQLException, IDGenerationException {
        // Generate user ID.
        long userID;
        try {
            userID = userIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating user ID.", e);
            throw e;
        }
        LOG.debug("User ID generated " + userID);

        // Insert record to user table.
        try {
            if (insertUserStmt == null) {
                insertUserStmt = conn.prepareStatement(
                    "INSERT INTO user (user_id,first_name,last_name,handle,timezone_id,status,"
                    + "reg_source,activation_code,create_date,open_id) "
                    + "VALUES (?,?,?,?,?,'A','cloudspokes',?,?,?);");
            }
            int index = 1;
            insertUserStmt.setLong(index++, userID);
            insertUserStmt.setString(index++, firstName);
            insertUserStmt.setString(index++, lastName);
            insertUserStmt.setString(index++, handle);
            insertUserStmt.setObject(index++, timeZoneID, Types.BIGINT);
            insertUserStmt.setString(index++, getActivationCode(userID));
            insertUserStmt.setTimestamp(index++, new Timestamp((createDate != null
                    ? createDate : new Date()).getTime()));
            insertUserStmt.setString(index++, resourceID);
            insertUserStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to user table.", e);
            throw e;
        }

        return userID;
    }

    /**
     * Assigns user to school in DB.
     *
     * @param userID User ID.
     * @param schoolID School ID.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistUserSchool(long userID, long schoolID, Date createDate)
        throws SQLException, IDGenerationException {
        // Generate user school ID.
        long userSchoolID;
        try {
            userSchoolID = userSchoolIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating user school ID.", e);
            throw e;
        }
        LOG.debug("User school ID generated " + userSchoolID);

        // Insert record to user_school table.
        try {
            if (insertSchoolStmt == null) {
                insertSchoolStmt = conn.prepareStatement(
                        "INSERT INTO user_school (user_school_id,user_id,school_id,"
                        + "school_association_type_id,primary_ind,create_date) "
                        + "VALUES (?,?,?,1,'t',?);");
            }
            int index = 1;
            insertSchoolStmt.setLong(index++, userSchoolID);
            insertSchoolStmt.setLong(index++, userID);
            insertSchoolStmt.setLong(index++, schoolID);
            insertSchoolStmt.setTimestamp(index++, new Timestamp(((createDate != null)
                    ? createDate : new Date()).getTime()));
            insertSchoolStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to user_school table.", e);
            throw e;
        }
    }

    /**
     * Persists email to DB.
     *
     * @param userID User ID.
     * @param email Email address.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistEmail(long userID, String email, Date createDate)
        throws SQLException, IDGenerationException {
        // Generate email ID.
        long emailID;
        try {
            emailID = emailIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating email ID.", e);
            throw e;
        }
        LOG.debug("Email ID generated " + emailID);

        // Insert record to email table.
        try {
            if (insertEmailStmt == null) {
                insertEmailStmt = conn.prepareStatement(
                        "INSERT INTO email (user_id,email_id,address,email_type_id,primary_ind,status_id,create_date) "
                        + "VALUES (?,?,?,1,1,1,?);");
            }
            int index = 1;
            insertEmailStmt.setLong(index++, userID);
            insertEmailStmt.setLong(index++, emailID);
            insertEmailStmt.setString(index++, email);
            insertEmailStmt.setTimestamp(index++, new Timestamp(((createDate != null)
                    ? createDate : new Date()).getTime()));
            insertEmailStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to email table.", e);
            throw e;
        }
    }

    /**
     * Persists phone to DB.
     *
     * @param userID User ID.
     * @param phoneNumber Phone number.
     * @param phoneTypeID Phone type ID.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistPhone(long userID, String phoneNumber, long phoneTypeID, Date createDate)
        throws SQLException, IDGenerationException {
        // Generate phone ID.
        long phoneID;
        try {
            phoneID = phoneIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating phone ID.", e);
            throw e;
        }
        LOG.debug("Phone ID generated " + phoneID);

        // Insert record to phone table.
        try {
            if (insertPhoneStmt == null) {
                insertPhoneStmt = conn.prepareStatement(
                        "INSERT INTO phone (user_id,phone_id,phone_type_id,phone_number,primary_ind,create_date) "
                        + "VALUES (?,?,?,?,1,?);");
            }
            int index = 1;
            insertPhoneStmt.setLong(index++, userID);
            insertPhoneStmt.setLong(index++, phoneID);
            insertPhoneStmt.setLong(index++, phoneTypeID);
            insertPhoneStmt.setString(index++, phoneNumber);
            insertPhoneStmt.setTimestamp(index++, new Timestamp(((createDate != null)
                    ? createDate : new Date()).getTime()));
            insertPhoneStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to phone table.", e);
            throw e;
        }
    }

    /**
     * Persists address to DB.
     * Use null arguments for unknown values.
     *
     * @param userID User ID.
     * @param addressLine1 Address line 1.
     * @param addressLine2 Address line 2.
     * @param city City.
     * @param countryCode Country code.
     * @param stateCode State code.
     * @param zip Zip code.
     * @param province Province.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistAddress(long userID, String addressLine1, String addressLine2,
            String city, String countryCode, String stateCode, String zip, String province,
            Date createDate)
        throws SQLException, IDGenerationException {
        // Generate address ID.
        long addressID;
        try {
            addressID = addressIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating address ID.", e);
            throw e;
        }
        LOG.debug("Address ID generated " + addressID);

        // Insert record to address table.
        try {
            if (insertAddressStmt == null) {
                insertAddressStmt = conn.prepareStatement(
                        "INSERT INTO address (address_id,address_type_id,address1,address2,city,"
                        + "state_code,zip,country_code,province,create_date) "
                        + "VALUES (?,2,?,?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertAddressStmt.setLong(index++, addressID);
            insertAddressStmt.setString(index++, addressLine1);
            insertAddressStmt.setString(index++, addressLine2);
            insertAddressStmt.setString(index++, city);
            insertAddressStmt.setString(index++, stateCode);
            insertAddressStmt.setString(index++, zip);
            insertAddressStmt.setString(index++, countryCode);
            insertAddressStmt.setString(index++, province);
            insertAddressStmt.setTimestamp(index++, new Timestamp(((createDate != null)
                    ? createDate : new Date()).getTime()));
            insertAddressStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to address table.", e);
            throw e;
        }

        // Insert record to user_address_xref table.
        try {
            if (insertUserAddressStmt == null) {
                insertUserAddressStmt =
                        conn.prepareStatement("INSERT INTO user_address_xref (user_id,address_id) VALUES (?,?);");
            }
            insertUserAddressStmt.setLong(1, userID);
            insertUserAddressStmt.setLong(2, addressID);
            insertUserAddressStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to user_address_xref table.", e);
            throw e;
        }
    }

    /**
     * Persists coder to DB.
     * Use null arguments for unknown values.
     *
     * @param userID User ID.
     * @param quote Quote.
     * @param countryCode Country code.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     */
    private static void persistCoder(long userID, String quote, String countryCode, Date createDate)
        throws SQLException {
        // Insert record to coder table.
        try {
            if (insertCoderStmt == null) {
                insertCoderStmt = conn.prepareStatement(
                        "INSERT INTO informixoltp:coder (coder_id,quote,coder_type_id,"
                        + "home_country_code,comp_country_code,display_banner,banner_style,member_since) "
                        + "VALUES (?,?,1,?,?,1,'bannerStyle4',?);");
            }
            int index = 1;
            insertCoderStmt.setLong(index++, userID);
            insertCoderStmt.setString(index++, quote);
            insertCoderStmt.setString(index++, countryCode);
            insertCoderStmt.setString(index++, countryCode);
            insertCoderStmt.setTimestamp(index++, new Timestamp(((createDate != null)
                    ? createDate : new Date()).getTime()));
            insertCoderStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to coder table.", e);
            throw e;
        }
    }

    /**
     * Persists user contact.
     *
     * @param userID User ID.
     * @param contactTypeID Contact type ID.
     * @param contactInfo Contact info.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistUserContact(long userID, long contactTypeID, String contactInfo)
        throws SQLException, IDGenerationException {
        // Generate user contact ID.
        long userContactID;
        try {
            userContactID = userContactIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating user contact ID.", e);
            throw e;
        }
        LOG.debug("User contact ID generated " + userContactID);

        // Insert record to contact_info table.
        try {
            if (insertUserContactStmt == null) {
                insertUserContactStmt = conn.prepareStatement(
                        "INSERT INTO tcs_catalog:user_contact (user_contact_id,contact_type_id,login_id,contact_info) "
                        + "VALUES (?,?,?,?);");
            }
            int index = 1;
            insertUserContactStmt.setLong(index++, userContactID);
            insertUserContactStmt.setLong(index++, contactTypeID);
            insertUserContactStmt.setLong(index++, userID);
            insertUserContactStmt.setString(index++, contactInfo);
            insertUserContactStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to user_contact table.", e);
            throw e;
        }
    }

    /**
     * Persists image path.
     *
     * @param path Path.
     * @return Path ID.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static long persistImagePath(String path)
        throws SQLException, IDGenerationException {
      
        // Generate path ID.
        long pathID;
        try {
            pathID = pathIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating path ID.", e);
            throw e;
        }
        LOG.debug("Path ID generated " + pathID);

        // Insert record to path table.
        try {
            if (insertPathStmt == null) {
                insertPathStmt = conn.prepareStatement(
                        "INSERT INTO informixoltp:path (path_id,path) "
                        + "VALUES (?,?);");
            }
            int index = 1;
            insertPathStmt.setLong(index++, pathID);
            insertPathStmt.setString(index++, path);
            insertPathStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to path table.", e);
            throw e;
        }
        return pathID;
    }

    /**
     * Persists coder image to DB.
     *
     * @param userID User ID.
     * @param imageURL Image URL.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistImage(long userID, String imageURL)
        throws SQLException, IDGenerationException {
        // Generate image ID.
        long imageID;
        try {
            imageID = imageIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Error generating image ID.", e);
            throw e;
        }
        LOG.debug("Image ID generated " + imageID);

        // Insert record to image table.
        try {
            if (insertImageStmt == null) {
                insertImageStmt = conn.prepareStatement(
                        "INSERT INTO informixoltp:image (image_id,file_name,image_type_id,path_id) "
                        + "VALUES (?,?,1,?);");
            }
            int index = 1;
            insertImageStmt.setLong(index++, imageID);
            String fileName = imageURL;
            String path = null;
            if (imageURL.contains("/")) {
                fileName = imageURL.substring(imageURL.lastIndexOf('/') + 1);
                path = imageURL.substring(0, imageURL.lastIndexOf('/') + 1);
            }
            insertImageStmt.setString(index++, fileName);
            if (path != null) {
                insertImageStmt.setLong(index++, persistImagePath(path));
            } else {
                insertImageStmt.setNull(index++, Types.BIGINT);
            }
            insertImageStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to image table.", e);
            throw e;
        }

        // Insert record to coder_image_xref table.
        try {
            if (insertCoderImageStmt == null) {
                insertCoderImageStmt = conn.prepareStatement(
                        "INSERT INTO informixoltp:coder_image_xref (coder_id,image_id,display_flag) "
                        + "VALUES (?,?,1);");
            }
            int index = 1;
            insertCoderImageStmt.setLong(index++, userID);
            insertCoderImageStmt.setLong(index++, imageID);
            insertCoderImageStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to coder_image_xref table.", e);
            throw e;
        }
    }

    /**
     * Persists demographic response.
     * Use null arguments for unknown values.
     *
     * @param userID User ID.
     * @param questionID Question ID.
     * @param answerID Answer ID.
     * @param response Response.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     */
    private static void persistDemographicResponse(long userID, long questionID, long answerID,
            String response, Date createDate)
        throws SQLException {
        // Insert record to demographic_response table.
        try {
            if (insertDemographicResponseStmt == null) {
                insertDemographicResponseStmt = conn.prepareStatement(
                        "INSERT INTO demographic_response (user_id,demographic_question_id,"
                        + "demographic_answer_id,demographic_response,create_date) "
                        + "VALUES (?,?,?,?,?);");
            }
            int index = 1;
            insertDemographicResponseStmt.setLong(index++, userID);
            insertDemographicResponseStmt.setLong(index++, questionID);
            insertDemographicResponseStmt.setLong(index++, answerID);
            insertDemographicResponseStmt.setString(index++, response);
            insertDemographicResponseStmt.setTimestamp(index++, new Timestamp(((createDate != null)
                    ? createDate : new Date()).getTime()));
            insertDemographicResponseStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to demographic_response table.", e);
            throw e;
        }
    }

    /**
     * Persists necessary security information to DB for given user.
     *
     * @param userID User ID.
     * @param handle User handle.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistUserSecurity(long userID, String handle, Date createDate)
        throws IDGenerationException, SQLException {
        // Insert record to security_user table.
        try {
            if (insertSecurityUserStmt == null) {
                insertSecurityUserStmt = conn.prepareStatement(
                        "INSERT INTO security_user (login_id,user_id,password,create_user_id) "
                        + "VALUES (?,?,?,0);");
            }
            int index = 1;
            insertSecurityUserStmt.setLong(index++, userID);
            insertSecurityUserStmt.setString(index++, handle);
            insertSecurityUserStmt.setString(index++, defaultPasswordHash);
            insertSecurityUserStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to security_user table.", e);
            throw e;
        }

        // Insert records to user_group_xref table.
        long userGroupID;
        try {
            if (insertUserGroupStmt == null) {
                insertUserGroupStmt = conn.prepareStatement(
                        "INSERT INTO user_group_xref (user_group_id,login_id,group_id,security_status_id,"
                        + "create_user_id,create_date) "
                        + "VALUES (?,?,?,1,0,?);");
            }
            insertUserGroupStmt.setLong(2, userID);
            for (long securityGroupID : SECURITY_GROUP_IDS) {
                try {
                    userGroupID = userGroupIDGenerator.getNextID();
                } catch (IDGenerationException e) {
                    LOG.error("Error generating user group ID.", e);
                    throw e;
                }
                LOG.debug("User group ID generated " + userGroupID);
                insertUserGroupStmt.setLong(1, userGroupID);
                insertUserGroupStmt.setLong(3, securityGroupID);
                insertUserGroupStmt.setTimestamp(4, new Timestamp(((createDate != null)
                        ? createDate : new Date()).getTime()));
                insertUserGroupStmt.executeUpdate();
            }
        } catch (SQLException e) {
            LOG.error("Error inserting record to user_group_xref table.", e);
            throw e;
        }
    }

    /**
     * Persists social account information to DB for given user.
     *
     * @param userID User ID.
     * @param socialLoginProviderID Social login provider ID.
     * @param socialUsernmae Social user name.
     * @param createDate Create date.
     * @throws SQLException If any DB error occurs.
     * @throws IDGenerationException If error occurs with ID generation.
     */
    private static void persistSocialLogin(long userID, long socialLoginProviderID,
            String socialUsername, Date createDate)
        throws IDGenerationException, SQLException {
        // Insert records to user_social_login table.
        try {
            if (insertSocialLoginStmt == null) {
                insertSocialLoginStmt = conn.prepareStatement(
                        "INSERT INTO user_social_login (user_id,social_login_provider_id,"
                        + "social_user_name,social_email) VALUES (?,?,?,?);");
            }
            int index = 1;
            insertSocialLoginStmt.setLong(index++, userID);
            insertSocialLoginStmt.setLong(index++, socialLoginProviderID);
            insertSocialLoginStmt.setString(index++, socialUsername);
            if (EMAIL_USERNAME_SOCIAL_LOGIN_PROVIDER_IDS.contains(socialLoginProviderID)) {
                insertSocialLoginStmt.setString(index++, socialUsername);
            } else {
                insertSocialLoginStmt.setString(index++, null);
            }

            insertSocialLoginStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to user_social_login table.", e);
            throw e;
        }
    }

    /**
     * Gets handle of the owner of the given email, from TC DB.
     *
     * @param email Email.
     * @return Handle of the email owner. null if email is not occupied yet.
     * @throws SQLException If any DB error occurs.
     */
    private static String getEmailOwnerHandle(String email) throws SQLException {
        ResultSet rs = null;
        try {
            if (getEmailOwnerStmt == null) {
                getEmailOwnerStmt = conn.prepareStatement("SELECT user.handle "
                        + "FROM email INNER JOIN user ON user.user_id = email.user_id "
                        + "WHERE LOWER(email.address) = ?");
            }
            getEmailOwnerStmt.setString(1, email.toLowerCase());
            rs = getEmailOwnerStmt.executeQuery();
            if (!rs.next()) {
                return null;
            }
            return rs.getString(1);
        } catch (SQLException e) {
            LOG.error("Error searching email owner in DB.", e);
            throw e;
        } finally {
            close(null, rs);
        }
    }

    /**
     * Checks if given handle (case insensitive) exists in TC DB.
     *
     * @param handle Handle.
     * @return true if exists, false otherwise.
     * @throws SQLException If any DB error occurs.
     */
    private static boolean handleExist(String handle) throws SQLException {
        ResultSet rs = null;
        try {
            if (searchHandleStmt == null) {
                searchHandleStmt = conn.prepareStatement("SELECT 1 FROM user WHERE handle_lower = ?");
            }
            searchHandleStmt.setString(1, handle.toLowerCase());
            rs = searchHandleStmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            LOG.error("Error searching user handle in DB.", e);
            throw e;
        } finally {
            close(null, rs);
        }
    }

    /**
     * Prints import error.
     *
     * @param message Error message.
     * @param curUserIndex Index of user (in the input CSV file) on which the error occurred.
     */
    private static void printImportError(String message, int curUserIndex) {
        message = String.format("Error importing user from line %d: %s", curUserIndex + 1, message);
        LOG.error(message);
        errorWriter.println(message);
        totalError++;
    }

    /**
     * Prints import warning.
     *
     * @param message Warning message.
     * @param curUserIndex Index of user (in the input CSV file) on which the warnings occurred.
     */
    private static void printImportWarning(String message, int curUserIndex) {
        message = String.format("User from line %d imported with warnings: %s", curUserIndex + 1, message);
        LOG.warn(message);
        warnWriter.println(message);
        totalWarning++;
    }

    /**
     * Closes given resources gracefully.
     * Any argument can be null.
     *
     * @param stmt Statement.
     * @param rs Result set.
     */
    private static void close(Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            LOG.error("Error during closig result set.", e);
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            LOG.error("Error during closing prepared statement.", e);
        }
    }

    /**
     * Closes given resources gracefully.
     *
     * @param conn DB connection.
     */
    private static void close(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            LOG.error("Error closing DB connection.", e);
        }
    }

    /**
     * Closes readers and writers gracefully.
     */
    private static void closeReadersAndWriters() {
        if (inputReader != null) {
            try {
                inputReader.close();
            } catch (IOException e) {
                LOG.error("Error during closing input reader.", e);
            }
        }
        if (reportWriter != null) {
            reportWriter.close();
        }
        if (errorWriter != null) {
            errorWriter.close();
        }
        if (warnWriter != null) {
            warnWriter.close();
        }
    }

    /**
     * Terminates the application with failure.
     *
     * @param message Error message.
     * @param e Occurred exception (or null if none).
     */
    private static void fail(String message, Throwable e) {
        if (e != null) {
            LOG.error(message, e);
        } else {
            LOG.error(message);
        }
        System.err.println(message);
        close(conn);
        closeReadersAndWriters();
        System.exit(1);
    }

    /**
     * Terminates the application with failure.
     *
     * @param message Error message.
     */
    private static void fail(String message) {
        fail(message, null);
    }

    /**
     * Prints help screen (usage info).
     */
    private static void printHelp() {
        System.out.println("java -jar bin/CloudSpokesUsersLoader.jar [-t] sourceFile outputFolder");
        System.out.println();
        System.out.println("\tLoads CloudSpokes user data into TopCoder's user database.");
        System.out.println();
        System.out.println("\t\t-t            Test run "
                + "(loader it will not insert anything into the database but will generate the output files.)");
        System.out.println("\t\tsourceFile    Source CSV file.");
        System.out.println("\t\toutputFolder  Path of the folder to which "
                + "the report, errors and warnings files will be written.");
        System.out.println();
        System.out.println("java -jar bin/CloudSpokesUsersLoader.jar -h");
        System.out.println();
        System.out.println("\tPrints usage information (this screen).");
    }

    /**
     * Calculates the amount of users in the given input CSV file.
     *
     * @param inputFilename Input file.
     * @return Amount of users.
     */
    private static int countUsers(String inputFilename) {
        BufferedReader plainReader = null;
        try {
            plainReader = new BufferedReader(new FileReader(inputFilename));
        } catch (IOException e) {
            fail(INPUT_FILE_IO_ERROR_MESSAGE, e);
        }
        int totalUsers = -1;
        while (true) {
            String line = null;
            try {
                line = plainReader.readLine();
                if (line == null) {
                    break;
                }
            } catch (IOException e) {
                fail(INPUT_FILE_IO_ERROR_MESSAGE, e);
            }
            if (line.trim().length() > 0) {
                totalUsers++;
            }
        }
        try {
            if (plainReader != null) {
                plainReader.close();
            }
        } catch (IOException e) {
            LOG.error("Error during closing plain reader.", e);
        }
        if (totalUsers < 0) {
            fail("Input file must have at least 1 line.");
        }
        return totalUsers;
    }

    /**
     * Calculates the amount of users in the given input CSV file.
     *
     * @param inputFilename Input file.
     */
    private static void loadSameHandleFile(String inputFilename) {
        CsvMapReader reader = null;
        try {
            reader = new CsvMapReader(new FileReader(inputFilename), CsvPreference.EXCEL_PREFERENCE);
            inputHeader = reader.getHeader(true);
        } catch (IOException e) {
            fail(INPUT_FILE_IO_ERROR_MESSAGE, e);
        }
        Map<String, String> curLine = null;
        while (true) {
            try {
                curLine = reader.read(inputHeader);
            } catch (IOException e) {
                fail(INPUT_FILE_IO_ERROR_MESSAGE, e);
            }
            if (curLine == null) {
                break;
            }
            if (curLine.isEmpty()) {
                continue;
            }
            sameHandleTakeover.put(curLine.get(SAME_HANDLE_USER_ID_HEADER),
                    "CS".equalsIgnoreCase(curLine.get(SAME_HANDLE_TAKEOVER_HEADER)));
        }
    }

    /**
     * Opens input file and checks its header.
     *
     * @param inputFilename Input file.
     */
    private static void openInputReader(String inputFilename) {
        try {
            inputReader = new CsvMapReader(new FileReader(inputFilename), CsvPreference.EXCEL_PREFERENCE);
            inputHeader = inputReader.getHeader(true);
        } catch (IOException e) {
            fail(INPUT_FILE_IO_ERROR_MESSAGE, e);
        }
        if (inputHeader.length != HEADER_LINE.length) {
            fail("Input file has invalid header.");
        }
    }

    /**
     * Initializes DB (ID generators, connection and lookup values).
     */
    @SuppressWarnings("deprecation")
    private static void initializeDB() {
        // Initialize ID generators.
        if (!isTestMode) {
            try {
                addressIDGenerator = IDGeneratorFactory.getIDGenerator(ADDRESS_SEQ);
                userIDGenerator = IDGeneratorFactory.getIDGenerator(USER_SEQ);
                emailIDGenerator = IDGeneratorFactory.getIDGenerator(EMAIL_SEQ);
                userSchoolIDGenerator = IDGeneratorFactory.getIDGenerator(USER_SCHOOL_SEQ);
                phoneIDGenerator = IDGeneratorFactory.getIDGenerator(PHONE_SEQ);
                imageIDGenerator = IDGeneratorFactory.getIDGenerator(IMAGE_SEQ);
                pathIDGenerator = IDGeneratorFactory.getIDGenerator(PATH_SEQ);
                userGroupIDGenerator = IDGeneratorFactory.getIDGenerator(USER_GROUP_SEQ);
                userContactIDGenerator = IDGeneratorFactory.getIDGenerator(USER_SEQ);
            } catch (IDGenerationException e) {
                fail("Failed to initialize ID generators.", e);
            }
            if (addressIDGenerator == null || userIDGenerator == null || emailIDGenerator == null
                    || userSchoolIDGenerator == null || phoneIDGenerator == null || imageIDGenerator == null
                    || pathIDGenerator == null || userGroupIDGenerator == null || userContactIDGenerator == null) {
                fail("Failed to initialize ID generators.");
            }
        }

        // Establish DB connection.
        try {
            conn = new com.topcoder.db.connectionfactory.DBConnectionFactoryImpl(
                    DB_CONNECTION_FACTORY_NAMESPACE).createConnection(DB_CONNECTION_NAME);
            conn.setAutoCommit(false);
        } catch (Exception e) {
            fail("Failed to establish DB connection.", e);
        }

        // Get necessary data from DB.
        try {
            loadLookupValues();
        } catch (Exception e) {
            LOG.error("", e);
            fail("Failed to load lookup data from DB.");
        }
    }

    /**
     * Performs processing of the input file.
     *
     * @param totalUsers Amount of users in the input file.
     */
    private static void process(int totalUsers) {
        // Process input file line by line.
        System.out.println("Progress 0%");
        Map<String, String> curLine = null;
        int curUserIndex = 1;
        int totalProcessed = 0;
        while (true) {
            try {
                curLine = inputReader.read(inputHeader);
            } catch (IOException e) {
                fail(INPUT_FILE_IO_ERROR_MESSAGE, e);
            }
            if (curLine == null) {
                break;
            }
            if (curLine.isEmpty()) {
                continue;
            }
            if (processInputLine(curLine, curUserIndex)) {
                totalProcessed++;
                if ((100 * totalProcessed / totalUsers) > (100 * (totalProcessed - 1) / totalUsers)) {
                    System.out.println(String.format("Progress %d%%", 100 * totalProcessed / totalUsers));
                }
                if (!isTestMode && (curUserIndex % transactionItemCount == 0 || totalProcessed == totalUsers)) {
                    LOG.debug("Committing transaction after importing user number " + totalProcessed);
                    try {
                        conn.commit();
                    } catch (SQLException e) {
                        fail("Failed to commit transaction.", e);
                    }
                }
                if (totalProcessed == totalUsers) {
                    break;
                }
            }
            curUserIndex++;
        }
        // Print totals to report.
        StringBuilder sb = new StringBuilder();
        sb.append("Operation completed.\n");
        sb.append(totalSuccess + " user(s) imported without warnings.\n");
        sb.append(totalWarning + " user(s) imported with warnings.\n");
        sb.append(totalError + " user(s) not imported due to errors.\n");
        reportWriter.print(sb.toString());
        System.out.print(sb.toString());

        // Release resources quit successfully.
        close(insertUserStmt, null);
        close(insertSchoolStmt, null);
        close(insertAddressStmt, null);
        close(insertUserAddressStmt, null);
        close(insertEmailStmt, null);
        close(insertPhoneStmt, null);
        close(insertImageStmt, null);
        close(insertCoderImageStmt, null);
        close(insertPathStmt, null);
        close(insertDemographicResponseStmt, null);
        close(insertCoderStmt, null);
        close(insertSecurityUserStmt, null);
        close(insertUserGroupStmt, null);
        close(getEmailOwnerStmt, null);
        close(searchPathStmt, null);
        close(insertUserContactStmt, null);
        close(conn);
        closeReadersAndWriters();
        System.exit(0);
    }

    /**
     * Initializes the necessary writers.
     *
     * @param outputFolder Folder where the output files will be located.
     */
    private static void initializeWriters(String outputFolder) {
        try {
            new File(outputFolder).mkdirs();
            reportWriter = new PrintWriter(new FileOutputStream(
                    new File(outputFolder, REPORT_FILE_NAME), true), false);
            errorWriter = new PrintWriter(new FileOutputStream(
                    new File(outputFolder, ERROR_FILE_NAME), true), false);
            warnWriter = new PrintWriter(new FileOutputStream(
                    new File(outputFolder, WARNING_FILE_NAME), true), false);
        } catch (FileNotFoundException e) {
            fail("Invalid output folder.", e);
        }
    }

    /**
     * Generates user activation code.
     *
     * @param userId User ID.
     * @return Activation code.
     */
    private static String getActivationCode(long userId) {
        String id = Long.toString(userId);
        String hash = new BigInteger(new BigInteger(id).bitLength(),
                new Random(userId)).add(new BigInteger(
                        ACTIVATION_CODE_HASH_SUMMAND, ACTION_CODE_HASH_RADIX)).toString();
        while (hash.length() < id.length()) {
            hash = "0" + hash;
        }
        hash = hash.substring(hash.length() - id.length());
        return new BigInteger(id + hash).toString(ACTION_CODE_HASH_RADIX).toUpperCase();
    }

    /**
     * Loads configuration.
     */
    private static void loadConfiguration() {
        try {
            String transactionItemCountString = (String) ConfigManager.getInstance().getProperty(
                    CloudSpokesSameHandleResolver.class.getCanonicalName(), "transaction_item_count");
            if (transactionItemCountString != null) {
                transactionItemCount = Integer.valueOf(transactionItemCountString);
            }
            String configPassword = (String) ConfigManager.getInstance().getProperty(
                    CloudSpokesSameHandleResolver.class.getCanonicalName(), "default_password");
            if (configPassword != null) {
                defaultPassword = configPassword;
            }
            String configPasswordHash = (String) ConfigManager.getInstance().getProperty(
                    CloudSpokesSameHandleResolver.class.getCanonicalName(), "default_password_hash");
            if (configPasswordHash != null) {
                defaultPasswordHash = configPasswordHash;
            }
        } catch (UnknownNamespaceException e) {
            fail("Failed to load and parse transaction item count in configuration.", e);
        }
        if (transactionItemCount <= 0) {
            fail("Transaction item count must be positive.");
        }
    }

    /**
     * Command line application entry point.
     *
     * @param args Command line arguments.
     * @throws LDAPClientException 
     */
    public static void main(String[] args) throws LDAPClientException {
        // Process command line arguments.
        String inputFilename = null;
        String outputFolder = null;
        boolean incorrectUsage = false;
        if (args.length == 1) {
            if (args[0].equals(HELP_SWITCH)) {
                printHelp();
                System.exit(0);
            } else {
                incorrectUsage = true;
            }
        } else if (args.length == 2 || args.length == 3) {
            if (args[0].equals(TEST_MODE_SWITCH)) {
                if (args.length == 3) {
                    isTestMode = true;
                } else {
                    incorrectUsage = true;
                }
            } else if (args.length != 2) {
                incorrectUsage = true;
            }
            inputFilename = args[args.length - 2];
            outputFolder = args[args.length - 1];
        } else {
            incorrectUsage = true;
        }
        if (incorrectUsage) {
            fail("Incorrect usage. Use -h to get help.");
        }

        // Load configuration.
        loadConfiguration();

        // Count amount of users to be loaded.
        System.out.println("Checking input file...");
        countUsers(inputFilename);
        try {
            loadSameHandleFile(new File(new File(inputFilename).getParent(), "sameHandle.csv").getCanonicalPath());
        } catch (IOException e) {
            fail("Can't locate sameHandle.csv file.", e);
        }
        int totalUsers = sameHandleTakeover.size();

        // Open input file and check its header.
        openInputReader(inputFilename);
        System.out.println("Input file OK.");
        System.out.println(totalUsers + " user(s) to load.");

        // Initialize DB.
        System.out.println("Initializing DB...");
        initializeDB();
        System.out.println("DB OK.");

        // Initialize writers.
        initializeWriters(outputFolder);

        // Process user loading.
        process(totalUsers);
    }
}
