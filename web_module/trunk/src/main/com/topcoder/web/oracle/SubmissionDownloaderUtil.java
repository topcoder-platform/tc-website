package com.topcoder.web.oracle;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
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
        if (args.length==0 || args[0] == null) {
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
                "  select p.path " +
                        " , s.original_file_name" +
                        " , s.system_file_name " +
                        " , s.submission_id" +
                        " from submission s, path p" +
                        " where s.path_id = p.path_id" +
                        " and s.contest_id = ?";


        File destDir = new File("." + System.getProperty("file.separator") +
                "submissions_" + id + System.getProperty("file.separator"));
        if (!destDir.exists()) {
            destDir.mkdirs();
        }


        PreparedStatement ps=null;
        Connection conn=null;
        ResultSet rs=null;
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
                destFile = new File(destDir.getPath() + rs.getInt("submission_id") + "." + ext);
                sourceFile = new File(rs.getString("path") + rs.getString("system_file_name"));

                FileReader in = new FileReader(sourceFile);
                FileWriter out = new FileWriter(destFile);
                int c;

                while ((c = in.read()) != -1)
                    out.write(c);

                in.close();
                out.close();


            }

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(conn);

        }

    }
}
