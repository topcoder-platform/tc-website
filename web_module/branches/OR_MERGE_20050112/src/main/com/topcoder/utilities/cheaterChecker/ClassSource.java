package com.topcoder.utilities.cheaterChecker;

import java.io.FileOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ClassSource implements TokenizedSource {
    private List tokens = null;
    public ClassSource(byte[] file) throws Exception {
        File tempfile = null;
        Runtime rt = Runtime.getRuntime();
        Process p = null;;
        FileOutputStream fos = null;

        tempfile = new File("./tempfile." + System.currentTimeMillis() + ".tmp");
        tempfile.createNewFile();

        fos = new FileOutputStream(tempfile);
        fos.write(file);
        fos.close();
        p = rt.exec("strings ./" + tempfile.getName());

        //store each string in an ArrayList
        StringBuffer buf = new StringBuffer(200);
        tokens = new ArrayList();
        int tempint = 0;
        while ((tempint = p.getInputStream().read()) > 0) {
            if (tempint != '\n')
                buf.append(tempint);
            else {
                if (buf.toString().indexOf("java") == -1)
                    tokens.add(buf.toString().trim());
                buf = new StringBuffer();
            }
        }
        if (!buf.toString().trim().equals("")) {
            tokens.add(buf.toString().trim());
        }
        tempfile.delete();

    }

    public List getTokens() {
        return tokens;
    }
}
