package com.topcoder.utilities;

import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.shared.util.TCContext;

import java.io.FileInputStream;
import java.util.ArrayList;

public class ResumeLoader {

    public static void main(String[] args) {
        String dataSource = null;
        long coderId = 0;
        int fileType = 0;
        String fileName = null;

        if (args.length!= 4) {
            System.out.println("usage: java ResumeLoader <dataSource> <coderId> <fileType> <fileName>");
            System.out.println("1	MS Word");
            System.out.println("2	Plain Text");
            System.out.println("6	Rich Text");
            System.out.println("3	Adobe Acrobat PDF");
            System.out.println("4	Postscript");
            System.out.println("5	HTML");
            System.exit(0);
        } else {
            dataSource = args[0];
            coderId = Long.parseLong(args[1]);
            fileType = Integer.parseInt(args[2]);
            fileName = args[3];
        }

        ResumeLoader r = new ResumeLoader();
        boolean error = false;
        try {
            r.doIt(dataSource, coderId, fileType, fileName);
        } catch (Exception e) {
            e.printStackTrace();
            error = true;
        }
        if (!error) {
            System.out.println("all set");
        }

    }

    private void doIt(String dataSource, long coderId, int fileType, String fileName) throws Exception {

        //read file
        FileInputStream fis = new FileInputStream(fileName);
        ArrayList a = new ArrayList(fis.available());
        int avail = 0;
        while ((avail = fis.read()) > -1) {
            a.add(new Byte((byte)avail));
        }
        byte[] b = new byte[a.size()];
        for (int i=b.length;--i>0;) {
            b[i]=((Byte)a.get(i)).byteValue();
        }

        //insert record
        ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(TCContext.getInitial(), ResumeServices.class);
        resumeServices.putResume(coderId, fileType, fileName, b, dataSource);




    }


}
