/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.job;

import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogManager;
import com.topcoder.util.scheduler.processor.JobProcessor;
import com.topcoder.util.scheduler.scheduling.persistence.ConfigManagerScheduler;

/**
 * This is a command tool class used to run the forums reply email retrieval job. It
 * will reads the scheduler job from file, and use JobProcessor to execute the job.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public class ForumReplyEmailRetrievalJobCommandTool {
    /**
     * Represents the reloader interval for {@link #JobProcessor}.
     */
    private static final int JOB_PROCESSOR_RELOADER_INTERVAL = 60 * 60 * 1000;

    /**
     * Represents the execution interval for {@link #JobProcessor}.
     */
    private static final int JOB_PROCESSOR_EXECUTE_INTERVAL = 2000;

    /**
     * Represents the namespace of the job scheduler.
     */
    private static final String JOB_SCHEDULER_NAMESPACE = "com.topcoder.forums.replyTo.job";

    /**
     * The main method. It will be called by the command line tool.
     *
     * @param args the arguments
     * @throws Exception if any error occurs.
     */
    public static void main(String[] args) throws Exception {
        Log logger = LogManager.getLog();
        ConfigManagerScheduler scheduler = new ConfigManagerScheduler(JOB_SCHEDULER_NAMESPACE);
        JobProcessor processor = new JobProcessor(scheduler, JOB_PROCESSOR_RELOADER_INTERVAL, logger);
        processor.setExecuteInternal(JOB_PROCESSOR_EXECUTE_INTERVAL);
        processor.start();
    }
}
