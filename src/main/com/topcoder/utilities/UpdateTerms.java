package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;

import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class UpdateTerms {
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("usage java " + UpdateTerms.class.getName() + " <terms id> <type id> <text>");
            return;
        } else {
            UpdateTerms u = new UpdateTerms();
            u.doIt(Integer.parseInt(args[0]), Integer.parseInt(args[1]), args[2]);
        }
        System.out.println("done");
    }

    private void doIt(int termsId, int typeId, String text) {
        Context ctx = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection("DS");

            StringBuffer query = new StringBuffer(200);
            query.append("SELECT 'X'");
            query.append(" FROM terms_of_use ");
            query.append(" WHERE terms_of_use_id = ?");

            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, termsId);
            rs = ps.executeQuery();
            boolean exists = rs.next();

            ps = null;
            rs = null;

            query = new StringBuffer(200);
            if (exists) {
                query.append("UPDATE terms_of_use SET terms_text = ?, terms_of_use_type_id = ?");
                query.append(" WHERE terms_of_use_id = ?");
                ps = conn.prepareStatement(query.toString());
                ps.setBytes(1, DBMS.serializeTextString(text));
                ps.setInt(2, typeId);
                ps.setInt(3, termsId);
            } else {
                query.append("INSERT INTO terms_of_use (terms_of_use_id, terms_of_use_type_id, terms_text)");
                query.append(" VALUES (?, ?, ?)");
                ps = conn.prepareStatement(query.toString());
                ps.setInt(1, termsId);
                ps.setInt(2, typeId);
                ps.setBytes(3, DBMS.serializeTextString(text));
            }

            int ret = ps.executeUpdate();

            if (ret!=1) {
                throw new Exception("altered " + ret + " rows, not 1");
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    System.out.println("FAILED to close ResultSet in getName");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    System.out.println("FAILED to close PreparedStatement in getName");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    System.out.println("FAILED to close Connection in getName");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    System.out.println("FAILED to close Context in getName");
                }
            }
        }

    }
}
