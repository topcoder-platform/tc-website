package com.topcoder.web.oracle;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 30, 2007
 */
public class SubmissionDownloaderUtil {

    //select out all the submissions
    //download them to ./submissions_contest_id
    //save as submission_id.file extension

    public static void main(String[] args) {
        if (args.length == 0 || args[0] == null) {
            System.out.println("Need to provide a contest id");
            System.exit(1);
        }
        Long id = null;
        try {
            id = new Long(args[0]);
        } catch (NumberFormatException e) {
            System.out.println("Need to provide a valid contest id not this " + id + " crap");
            System.exit(1);
        }

        final String query =
                "  select p.path \n" +
                        ", s.original_file_name" +
                        ", s.system_file_name " +
                        " , s.submission_id" +
                        "          from submission s" +
                        "             , submission_review sr " +
                        "             , path p" +
                        "         where sr.submission_id = s.submission_id " +
                        "and s.path_id = p.path_id" +
                        "           and sr.review_status_id = 1" +
                        "           and s.rank <= (case when (select count(*) from contest_config where contest_id = s.contest_id and property_id = 8 and property_value is not null) > 0 then (select property_value from contest_config where contest_id = s.contest_id and property_id = 8)::decimal else 1000 end)" +
                        "           and s.contest_id = ? ";


        File destDir = new File("." + System.getProperty("file.separator") +
                "submissions_" + id);
        if (!destDir.exists()) {
            destDir.mkdirs();
        }


        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("STUDIO_CONNECT_STRING")).getConnection();
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            File destFile;
            File sourceFile;
            String ext;
            while (rs.next()) {
                ext = rs.getString("original_file_name").substring(rs.getString("original_file_name").lastIndexOf('.'));
                destFile = new File(destDir.getPath() + System.getProperty("file.separator") + rs.getInt("submission_id") + ext);
                sourceFile = new File(rs.getString("path") + rs.getString("system_file_name"));
                try {


                    InputStream in = new FileInputStream(sourceFile);
                    OutputStream out = new FileOutputStream(destFile);

                    // Transfer bytes from in to out
                    byte[] buf = new byte[1024];
                    int len;
                    while ((len = in.read(buf)) > 0) {
                        out.write(buf, 0, len);
                    }
                    in.close();
                    out.close();
                    System.out.println(rs.getInt("submission_id") + ext);

                } catch (Throwable e) {
                    System.out.println("failed on submission " + rs.getInt("submission_id") + " " + sourceFile.getAbsolutePath());
                    //throw e;
                }


            }

        } catch (Throwable e) {
            e.printStackTrace();
            System.exit(1);
        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(conn);

        }

    }
}
