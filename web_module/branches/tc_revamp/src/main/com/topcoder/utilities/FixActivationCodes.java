package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author dok
 * @version $Revision: 48187 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 13, 2006
 */
public class FixActivationCodes {

    public static void main(String[] args) {
        FixActivationCodes p = new FixActivationCodes();


        try {
            p.doIt();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }

    }

    public void doIt() throws Exception {

        try {
            String s = "select user_id, activation_code from user u";
            String t = "update user set activation_code = ? where user_id = ?";

            Connection conn = null;
            PreparedStatement ps = null;
            PreparedStatement ps1 = null;
            ResultSet rs = null;
            long userId = 0;
            String code;
            try {
                conn = DBMS.getDirectConnection();
                ps = conn.prepareStatement(t);
                ps1 = conn.prepareStatement(s);
                int count = 0;
                int count1 = 0;
                rs = ps1.executeQuery();
                while (rs.next()) {
                    try {
                        userId = rs.getLong("user_id");
                        code = rs.getString("activation_code");
                        if (!StringUtils.getActivationCode(userId).equals(code)) {
                            ps.setString(1, StringUtils.getActivationCode(userId));
                            ps.setLong(2, userId);
                            count += ps.executeUpdate();
                        }
                        count1++;
                        if (count % 25 == 0) System.out.println("" + count + " records updated");
                        if (count1 % 25 == 0) System.out.println("" + count1 + " records processed");
                    } catch (Exception e) {
                        System.out.println("user " + userId);
                        e.printStackTrace();
                    }

                }
            } finally {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                ;
                try {
                    ps.close();
                } catch (Exception e) {
                }
                ;
                try {
                    ps1.close();
                } catch (Exception e) {
                }
                ;
                try {
                    conn.close();
                } catch (Exception e) {
                }
                ;
            }
        } catch (Exception e) {
            throw e;
        }
    }

}
