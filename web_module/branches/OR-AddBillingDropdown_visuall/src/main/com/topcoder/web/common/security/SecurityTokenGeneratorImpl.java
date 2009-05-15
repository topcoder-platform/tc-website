/*
 * SecurityTokenGeneratorImpl
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.common.security;

import java.security.MessageDigest;
import java.util.Map;
import java.util.StringTokenizer;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.cache.MaxAge;

/**
 * This class is responsible for generating SSO and RememberMe tokens
 * stored in the clients using Cookies.
 * 
 * Current implementation was extracted from {@link BasicAuthentication} class
 * in order to be compatible with it. Nevertheless, SSO token generated is unsecured and
 * it should be modified.
 * 
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class SecurityTokenGeneratorImpl {
    /**
     * Compute a one-way hash of a userid and the corresponding crypted
     * password, plus a magic string thrown in for good measure.  Salting
     * this might be nice, but it doesn't seem to buy us anything as long
     * as the magic string remains a secret.
     * <p/>
     * The intent here is that
     * 1) login cookies cannot be guessed
     * 2) changing your password should invalidate any login cookies which may exist
     * 3) login cookies cannot be used to gain any information about the password
     * 4) if user status changes, it invalidates login cookies
     * <p/>
     * I would just tack on the crypted password itself, but they are
     * reversibly encrypted with a secret key using Blowfish, and I don't
     * know how well Blowfish holds up to a chosen-plaintext attack.
     * <p/>
     * Calling this function is quite expensive; it runs a query on OLTP,
     * which cannot be cached and still get immediate behavior 2 above.
     * note: gpaul - i've changed it to cache the password for 30 minutes to avoid the db hit.
     * but it is still pretty intensive...currently takes around 300 ms
     *
     * @param uid the user id
     * @return the hash
     * @throws Exception if there is a problem getting data from the data base or if the MD5 algorithm doesn't exist
     */
    public String hashForUser(long uid) throws Exception {
        CachedDataAccess dai = new CachedDataAccess(MaxAge.HALF_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, "userid_to_password");
        dataRequest.setProperty("uid", Long.toString(uid));
        Map dataMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) dataMap.get("userid_to_password");
        String password = rsc.getStringItem(0, "password");
        String status = rsc.getStringItem(0, "status");

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] plain = (Constants.hash_secret + uid + password + status).getBytes();
        byte[] raw = md.digest(plain);
        StringBuffer hex = new StringBuffer();
        for (byte aRaw : raw) hex.append(Integer.toHexString(aRaw & 0xff));
        return hex.toString();
    }

    public String generateRememberMeToken(long userId) throws Exception {
        return  generateSSOToken(userId);
    }

    public String generateSSOToken(long userId) throws Exception {
        return userId + "|" + hashForUser(userId);
    }

    public long extractUserFromRememberMeToken(String token) throws Exception {
        return extractUserFromSSOToken(token);
    }

    public long extractUserFromSSOToken(String ssoToken) throws Exception {
        StringTokenizer st = new StringTokenizer(ssoToken, "|");
        long uid = Long.parseLong(st.nextToken());
        if (uid < 1) throw new InvalidTokenException("Invalid user for token: "+ssoToken);
        String hash = hashForUser(uid);
        if (!hash.equals(st.nextToken())) throw new InvalidTokenException("Invalid token: "+ssoToken);;
        return uid;
    }

}
