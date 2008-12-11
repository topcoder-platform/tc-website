/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio;

import java.io.File;
import java.io.IOException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 * <p>A helper utility class used for copying the test submission files to intended directory.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2
 */
public class TestFilesHandler {

    /**
     * <p>A <code>List</code> collecting the files which have been copied to target directory.</p>
     */
    private static List<File> copiedFiles = new ArrayList<File>();

    /**
     * <p>A <code>List</code> collecting the directories which have been copied to target directory.</p>
     */
    private static List<File> copiedDirectories = new ArrayList<File>();

    /**
     * <p>Constructs new <code>TestFilesHandler</code> instance. This implementation does nothing.</p>
     */
    private TestFilesHandler() {
    }

    /**
     * <p>Initializes the test files. Copies the necessary submission files to intended directory.</p>
     *
     * @throws IOException if an I/O error occurs while initializing the test files.
     */
    public static void init() throws IOException {
        char sep = File.separatorChar;
        String testSubmissionsDirName
                = "test_files" + sep + "studio" + sep + Constants.SUBMISSIONS_DIRECTORY_NAME;
        File testSubmissionsDir = new File(testSubmissionsDirName);
        initDirectory(testSubmissionsDir, new LinkedList<String>());
    }

    /**
     * <p>Initializes the test files located in specified directory. Copies the necessary submission files to intended
     * directory.</p>
     *
     * @param dir a <code>File</code> representing the directory with sample submissions.
     * @param path a <code>List</code> listing the elements of path.
     * @throws IOException if an I/O error occurs while initializing the test files.
     */
    private static void initDirectory(File dir, LinkedList<String> path) throws IOException {
        String dirName = dir.getName();
        if (!dirName.equals("CVS") && !dirName.equals(".svn")) {
            char sep = File.separatorChar;
            String submissionsDirName = Constants.ROOT_STORAGE_PATH + sep + Constants.SUBMISSIONS_DIRECTORY_NAME;
            File submissionsDir = new File(submissionsDirName);

            String[] files = dir.list();
            if (files != null) {
                for (int i = 0; i < files.length; i++) {
                    String fileName = files[i];
                    StringBuilder b = new StringBuilder();
                    for (String p : path) {
                        if (b.length() > 0) {
                            b.append(sep);
                        }
                        b.append(p);
                    }
                    File target = new File(submissionsDir.getAbsolutePath() + sep + b.toString() + sep + fileName);
                    File original = new File(dir.getAbsolutePath() + sep + fileName);
                    if (original.isDirectory()) {
                        if (!target.exists()) {
                            target.mkdirs();
                            copiedDirectories.add(target);
                        }
                        path.addLast(fileName);
                        initDirectory(original, path);
                        path.removeLast();
                    } else {
                        if (!target.exists()) {
                            copyFiles(original, target);
                            copiedFiles.add(target);
                        }
                    }
                }
            }
        }
    }

    /**
     * <p>Copies the specified file to specified one.</p>
     *
     * @param from a <code>File</code> to be copied.
     * @param to a <code>File</code> referencing the new location of the copy.
     * @throws IOException if an I/O error occurs while writting file content to disk.
     */
    private static void copyFiles(File from, File to) throws IOException {
        System.out.println("copying test file: " + from.getPath() + " to " + to.getPath());
        FileInputStream fis = new FileInputStream(from);
        FileOutputStream fos = new FileOutputStream(to, false);

        try {
            byte[] buf = new byte[4096];
            int count = -1;
            while ((count = fis.read(buf)) != -1) {
                fos.write(buf, 0, count);
            }
        } finally {
            fos.flush();
            fos.close();
            fis.close();
        }
    }
}
