/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.cloudspokes;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import java.io.Serializable;
import java.io.InputStream;
import java.util.Date;
import java.util.Map;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.List;
import java.net.URLEncoder;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.commons.httpclient.Credentials;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.auth.AuthScope;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.io.IOUtils;


import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;



import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;



/**
 * <p>
 * A DB utility which is intended to load data for corona events and push to corona using API
 * </p>
 *
 * <p>
 * Below is the sample configuration for this tool:
 * </p>
 *
 * <pre>
 * &lt;clientUserStatsDataLoadingTool&gt;
 *      &lt;sourcesList&gt;
 *          &lt;source name="TransactionalData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_catalog:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *          &lt;source name="WarehouseData"
 *                  value="jdbc:informix-sqli://DBHOST:DBPORT/tcs_dw:INFORMIXSERVER=informixoltp_tcp;
 *                         user=DBUSERNAME;password=DBPASSWORD"/&gt;
 *      &lt;/sourcesList&gt;
 *      &lt;parameterList&gt;
 *          &lt;parameter name="client_user_stats_selection_file"
 *                        value="/home/tc/web/scripts/sql/load_client_user_stats.sql"/&gt;
 *      &lt;/parameterList&gt;
 * &lt;/clientUserStatsDataLoadingTool&gt;
 * </pre>
 *
 * @author ZPetrovich
 * @version 1.0
 */
public class CoronaEventLoadUtility extends DBUtility {

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for inserting records to
     * <code>tcs_dw:client_user_stats</code> database table.</p>
     */
    private static final String CLIENT_USER_STATS_INSERT_SQL = "INSERT INTO client_user_stats (client_user_stats_id, "
        + "client_id, year, month, user_count) " + "VALUES (?, ?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement to be used for updating records in
     * <code>tcs_dw:client_user_stats</code> database table.</p>
     */
    private static final String CLIENT_USER_STATS_UPDATE_SQL = "UPDATE client_user_stats SET client_id  = ?, "
        + "year = ?, month = ?, user_count = ? WHERE client_user_stats_id = ?";


    private static final String DEFAULT_COUNTRY ="United States";
	
	private static final String DEFAULT_LONG ="-101.0742190";
	
	private static final String DEFAULT_LAT ="40.6473040";
	
	private static final String GEOCODE_REQUEST_URL = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&";
    private static HttpClient maphttpClient = new HttpClient(new MultiThreadedHttpConnectionManager());

    /**
     * <p>
     * A <code>String</code> providing the helpful SQL statement to be used for
     * selecting records from <code>tcs_dw:client_user_stats</code> database
     * table.
     * </p>
     */
    private static final String SELECT_EVENT = "select handle, corona_event_type_name, country_name, longitude, latitude, file_name, ce.corona_event_type_id, ce.corona_event_id, "
	                                           + "address1, address2, city, state_code, province " 
	                                           + "  from corona_event ce, corona_event_type cet, user u, outer (user_address_xref xa, address a, country c), outer (informixoltp:coder_image_xref x, informixoltp:image i) "
											   + " where ce.user_id = u.user_id and xa.user_id =u.user_id and a.address_id = xa.address_id and a.country_code=c.country_code "
											   + " and x.coder_id = u.user_id and i.image_id=x.image_id and display_flag = 1 and ce.scanned_ind = 0 and ce.corona_event_type_id = cet.corona_event_type_id";
											   
	    private static final String UPDATE_EVENT = "UPDATE corona_event SET scanned_ind  = 1 "
        + " WHERE corona_event_id = ?";

    /**
     * <p>A <code>String</code> providing the name for pre-configured data source to be used for obtaining connections
     * to transactional database.</p>
     */
    private static final String TRANSACTIONAL_DATA_SOURCE = "TransactionalData";
	
	private static final String CORONA_URL = "CoronaURL";
	
	private static final String TOKEN = "Token";


    /**
     * <p>An <code>int</code> providing the number of rows with transactional data that should be fetched from the
     * database when more rows are needed.</p>
     */
    private static final int DATA_FETCH_SIZE = 20;


    /**
     * <p>Constructs new <code>ClientUserStatsLoadUtility</code> instance. This implementation does nothing.</p>
     */
    public CoronaEventLoadUtility() {
    }

    /**
     * Runs this utility. Reads contents of SQL statements for selecting
     * transactional data from files and loads selected data into warehouse
     * database tables.
     */
    @Override
    protected void runUtility()
        throws Exception {
        log.info("Corona event loading has started");

        try {
           
            ResultSet result = null;
            PreparedStatement selectStatement = null;
			PreparedStatement updateStatement = null;

            Connection sourceConn = null;
			int c = 0;
            try {

                sourceConn = getDBConnection(TRANSACTIONAL_DATA_SOURCE);
                sourceConn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

                // set select query parameters
                selectStatement = prepareStatement(SELECT_EVENT, sourceConn);
				
				updateStatement = prepareStatement(UPDATE_EVENT, sourceConn);

                // execute select query
                selectStatement.setFetchSize(DATA_FETCH_SIZE);
                result = selectStatement.executeQuery();
                //log.info("Retrieved transactional records for clients users from database");

				
                while (result.next()) {
                    try {

                        // Get data for single statistics row
                        String handle = result.getString("handle");
                        String country = result.getString("country_name");
                        String longitude = result.getString("longitude");
                        String latitude = result.getString("latitude");
						String imagefile = null;
						if (result.getString("file_name") != null) {
						 imagefile = result.getString("file_name");
						 } 
						 
						String address = null;
						StringBuilder addBuilder = new StringBuilder();
						if (result.getString("address1") != null && !result.getString("address1").equals("")) {
							addBuilder.append(result.getString("address1"));
						}
						
						if (result.getString("address2") != null && !result.getString("address2").equals("")) {
							addBuilder.append(",").append(result.getString("address2"));
						}
						
						if (result.getString("city") != null && !result.getString("city").equals("")) {
							addBuilder.append(",").append(result.getString("city"));
						}
						 
						if (result.getString("state_code") != null && !result.getString("state_code").equals("")) {
							addBuilder.append(",").append(result.getString("state_code"));
						}
						
						if (result.getString("province")  != null && !result.getString("province").equals("")) {
							addBuilder.append(",").append(result.getString("province"));
						}
						
						if (result.getString("country_name")!= null && !result.getString("country_name").equals("")) {
							addBuilder.append(",").append(result.getString("country_name"));
						}
						
						address = addBuilder.toString();
						
						String event = result.getString("corona_event_type_name");
						long eventTypeId = result.getLong("corona_event_type_id");
						long eventId = result.getLong("corona_event_id");
						
						if (address != null && !address.trim().equals("")) {
							
							Loc l = getLongitudeLatitude(address);
							if (l!= null) {
								longitude = l.strLongtitude; 
								latitude = l.strLatitude;
							}
						}
						
						pushToCorona(handle, country, longitude, latitude, imagefile, event, eventTypeId);
						
						updateStatement.setLong(1, eventId);
						
						c++;

						int updateRecordsCount = updateStatement.executeUpdate();
						if (updateRecordsCount != 1) {
							throw new SQLException("Wrong number of records updated (expected 1): "
								+ updateRecordsCount);
						}

                       
                    } catch (Exception e) {
                        log.error("Failed to insert record for client users", e);
                    }
                }
            } finally {

                DBMS.close(selectStatement, result);
                if (sourceConn != null) {
                    sourceConn.close();
                }
                log.info("Published "+ c +" events");
            }
        
        } catch (SQLException e) {
            log.error(e.getMessage());
            DBMS.printSqlException(true, e);
        } catch (Exception e) {
            log.error(e.getMessage());
            DBMS.printException(e);
        } finally {
            log.info("Corona loading has finished...");
        }
    }

	/**
     * <p>Shows the usage message for this tool.</p>
     *
     * @param msg The error message.
     */
    @Override
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg).append("\n");
        sErrorMsg.append("TODO:\n");

        fatal_error();
    }
	
	  /**
     * <p>Establishes a connection to target database using specified datasource.</p>
     *
     * @param source a <code>String</code> referencing the datasource to be used for obtaining connection to database.
     * @return a <code>Connection</code> providing connection to target database.
     * @throws SQLException if an unexpected error occurs.
     */
    private Connection getDBConnection(String source) throws SQLException {
        return DriverManager.getConnection((String) sources.get(source));
    }

    /**
     * <p>Call this method to create a PreparedStatement for a given sql.</p>
     *
     * @param sqlStr The sql query.
     * @param conn The reference to target database.
     * @return a statement to be executed for specified query.
     * @throws SQLException if an SQL error occurs while communicating to database.
     */
    private PreparedStatement prepareStatement(String sqlStr, Connection conn) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement(sqlStr);
        return ps;
    }
	
	private void pushToCorona(String handle, String country, String longitude, String latitude, String imagefile, String event, long eventTypeId) throws Exception {
	
		URI uri = null;
		HttpClient httpclient =  new HttpClient();;
		PostMethod postMethod = null;
		int status = 0;
		String responseMessage = null;
		try {
			uri = new URI((String) params.get((CORONA_URL)));
			postMethod = new PostMethod(uri.toString());
			postMethod.addRequestHeader("accept", "application/json");
			
			
			
			String content = "";

			if (eventTypeId == 1) {
				content = handle + " logged in.";
			} else if (eventTypeId == 2) {
				content = handle + " posted to a forum.";
			} else if (eventTypeId == 3) {
				content = handle + " registered for a contest.";
			} else if (eventTypeId == 4) {
				content = handle + " submitted for a contest.";
			} else if (eventTypeId == 5) {
				content = handle + " launched a new contest.";
			} else if (eventTypeId == 6) {
				content = handle + " submitted a scorecard.";
			}
			
			String profilePic = "http://community.topcoder.com/i/empty-photo.png";
			if (imagefile != null)
			{
				profilePic = "http://community.topcoder.com/i/m/" + imagefile;
			}	
			
			if (country == null || country.trim().equals(""))
			{
				country = DEFAULT_COUNTRY;
			}
			if (longitude == null || longitude.trim().equals(""))
			{
				longitude = DEFAULT_LONG; 
			}
			if (latitude == null || latitude.trim().equals(""))
			{
				latitude = DEFAULT_LAT;
			}
			
			
			postMethod.setRequestHeader("Authorization", "Token token=" + ((String) params.get(TOKEN)));   
			String jsonStr = "{ \"data\": { \"content\": \"" + content + "\", \"country\": \"" + country + "\", \"eventType\": \"" + event + "\", \"long\": \""
			               + longitude + "\", \"lat\": \"" +latitude + "\", \"profile_pic\": \"" +profilePic +"\"} }";
			StringRequestEntity requestEntity = new StringRequestEntity(jsonStr,"application/json",	"UTF-8");


			postMethod.setRequestEntity(requestEntity);
			//postMethod.addParameters(requestBody);
			requestEntity.writeRequest(System.out);
			status = httpclient.executeMethod(postMethod);
			log.info("Response Code for api:" + status);
			responseMessage = postMethod.getResponseBodyAsString();
			log.info("Response Data for corona api:" + responseMessage);
			
			if (status != HttpStatus.SC_OK) {
				throw new Exception("Error status "+status);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} 

	}    
	
    
	public Loc getLongitudeLatitude(String address) throws Exception {
	
		try {
		
			Loc loc = new Loc();
			StringBuilder urlBuilder = new StringBuilder(GEOCODE_REQUEST_URL);
			if (address != null && !"".equals(address.trim())) {
				urlBuilder.append("&address=").append(URLEncoder.encode(address, "UTF-8"));
			} 

			final GetMethod getMethod = new GetMethod(urlBuilder.toString());
			try {
				
				
				int status = maphttpClient.executeMethod(getMethod);
				log.info("Google API Code for api:" + status);
				
				InputStream is = getMethod.getResponseBodyAsStream();
				String responseMessage = IOUtils.toString(is);

				JSONObject json = (JSONObject) JSONSerializer.toJSON(responseMessage); 
				JSONObject res = (JSONObject)json.getJSONArray("results").get(0);
				JSONObject geometry = res.getJSONObject("geometry");
				JSONObject location = geometry.getJSONObject("location");
				
				String lng = location.getString("lng");
				String lat = location.getString("lat");
				
				System.out.println("lng=="+lng+", lat="+lat);
				
				loc.strLongtitude = lng;
				loc.strLatitude = lat;
				
				return loc;

			} catch (Exception ee) {
			 ee.printStackTrace(System.out);
			 System.out.println(ee);
			 return null;
		} finally {
				
				getMethod.releaseConnection();
				
			}
		} catch (Exception e) {
			 e.printStackTrace(System.out);
			 System.out.println(e);
			 return null;
		}
		
	}

       
	
	public class Loc {
	
		String strLatitude;
        String strLongtitude;
	}
	

}
