package com.topcoder.web.common.model;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.WebAuthentication;

import java.util.Map;
import java.util.Set;
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

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

public class CoderSessionInfo extends SessionInfo {
    //todo add hs rating
    private int rating;
    private int devRating;
    private int designRating;
    private int memberCount;

    //these can probably go away when we get away from the legacy controller
    //they really just support some of the xsl
    private int rank;
    private String activationCode;
    private boolean hasImage;

    private static Logger log = Logger.getLogger(CoderSessionInfo.class);

    public CoderSessionInfo() {
        super();
    }

    public CoderSessionInfo(TCRequest request, WebAuthentication authentication, Set groups) throws Exception {
        super(request, authentication, groups);
        rating = 0;
        rank = 0;
        if (!authentication.getActiveUser().isAnonymous()) {
            ResultSetContainer info = getInfo(authentication.getActiveUser().getId());
            if (!info.isEmpty()) {
                rating = info.getIntItem(0, "rating");
                try {
                    devRating = info.getIntItem(0, "dev_rating");
                } catch (NullPointerException e) {
                    devRating = 0;
                }
                try {
                    designRating = info.getIntItem(0, "design_rating");
                } catch (NullPointerException e) {
                    designRating = 0;
                }
                hasImage = info.getIntItem(0, "has_image") > 0;
                activationCode = info.getStringItem(0, "activation_code");
            } else {
                log.warn("couldn't find session info for: " + authentication.getActiveUser().getId());
            }
            ResultSetContainer rsc = getDwInfo(authentication.getActiveUser().getId());
            if (!rsc.isEmpty()) {
                rank = rsc.getIntItem(0, "rank");
            } else {
                log.debug("couldn't find rank info for: " + authentication.getActiveUser().getId());
            }
        }

        CachedDataAccess countDai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request countReq = new Request();
        countReq.setContentHandle("member_count");
        memberCount = ((ResultSetContainer) countDai.getData(countReq).get("member_count")).getIntItem(0, "member_count");
		
		//int csCount = loadCSMemberCount();
		//memberCount = memberCount + csCount;
		
    }

    public int getRating() {
        return rating;
    }

    public int getDevRating() {
        return devRating;
    }

    public int getDesignRating() {
        return designRating;
    }

    public int getHighestRating() {
        if (rating < 0) {
            return rating;
        } else {
            return Math.max(designRating, Math.max(rating, devRating));
        }
    }

    public int getRank() {
        return rank;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public boolean hasImage() {
        return hasImage;
    }

    public int getMemberCount() {
        return memberCount;
    }

    private ResultSetContainer getInfo(long userId) throws Exception {
        DataAccessInt dAccess = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

        Request r = new Request();
        r.setContentHandle("session_info");
        r.setProperty("cr", String.valueOf(userId));
        Map m = dAccess.getData(r);
        return (ResultSetContainer) m.get("session_info");
    }

    private ResultSetContainer getDwInfo(long userId) throws Exception {
        DataAccessInt dAccess = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);

        Request r = new Request();
        r.setContentHandle("dw_session_info");
        r.setProperty("cr", String.valueOf(userId));
        Map m = dAccess.getData(r);
        return (ResultSetContainer) m.get("session_info");
    }
	
	private int loadCSMemberCount()  {
	
		try {
		HttpClient httpclient =  new HttpClient();
		GetMethod getMethod = null;
		
		URI uri = new URI("http://api.cloudspokes.com/v1/stats");
		
		getMethod = new GetMethod(uri.toString());
		getMethod.addRequestHeader("accept", "application/json");
		
		int status = httpclient.executeMethod(getMethod);
		//System.out.println("--------------status----"+status);
			
		String responseMessage = getMethod.getResponseBodyAsString();
		
		//System.out.println("--------------responseMessage----"+responseMessage);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Map<String, String>> mapValues =  mapper.readValue(responseMessage, new  TypeReference<Map<String,Map<String, String>>>(){});

		for (Object o:mapValues.values()) {
			Map omap = (Map)o;
			Object mc = omap.get("members");
			int mcount = Integer.parseInt((String)mc);  
			return mcount;
		}

		}
		catch (Exception e)
		{
			System.out.println("error getting CS member count :"+e);
			e.printStackTrace(System.out);
			return 0;
		}
		
		return 0;
	}

}
