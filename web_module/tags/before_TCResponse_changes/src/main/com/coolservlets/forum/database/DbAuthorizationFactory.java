/**
 * DbAuthorizationFactory.java
 * August 03, 2000
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 */

package com.coolservlets.forum.database;

import com.coolservlets.forum.*;
import com.coolservlets.util.*;
import com.topcoder.shared.util.*;
import java.rmi.RemoteException;
import java.security.*;
import java.sql.*;
import java.util.*;
import java.io.*;

public class DbAuthorizationFactory extends AuthorizationFactory {

    /** DATABASE QUERIES **/
    private static final String AUTHORIZE = "SELECT user_id FROM user WHERE handle=?";

    /**
     * Gets authorization for a user.
     *
     * @throws UnauthorizedException if authentication failed.
     */
    public Authorization getAuthorization(String username, String password)
            throws UnauthorizedException
    {
        if (username == null || password == null) {
            throw new UnauthorizedException();
        }
        password = (password);
        int userID = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = getDbConnection();
            pstmt = con.prepareStatement(AUTHORIZE);
   
            pstmt.setString(1, username);

            ResultSet rs = pstmt.executeQuery();
            if (!rs.next()) {
                throw new UnauthorizedException();
            }
            userID = rs.getInt("user_ID");
        }
        catch( SQLException sqle ) {
            System.err.println("Exception in DbAuthorizationFactory:" + sqle);
            sqle.printStackTrace();
            throw new UnauthorizedException();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        //Got this far, so the user must be authorized.
        return new DbAuthorization(userID);
    }

    /**
     * Gets the anonymous user authorization.
     */
    public Authorization getAnonymousAuthorization() {
        return new DbAuthorization(-1);
    }

    /**
     * Gets a database transaction connection.
    private Connection getDbTransConnection() throws SQLException {
      return Common.getTransConnection();
    }
     */

    /**
     * Gets a database connection.
     */
    private Connection getDbConnection() throws SQLException {
      return DBMS.getConnection();
    }
} 
