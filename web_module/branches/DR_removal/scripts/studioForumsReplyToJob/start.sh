#!/bin/sh

cd /home/studio/web/scripts/studioForumsReplyToJob

if [ -r pid ]; then
  if [ -d /proc/`cat pid` ]; then
    echo "The job has already been started"
    exit 1
  fi
fi

CP=$CP:/home/studio/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/studio/web/build/classes
CP=$CP:/home/studio/jboss-4.0.4.GA/client/jbossall-client.jar
CP=$CP:/home/studio/web/lib/jars/jboss/mail.jar
CP=$CP:/home/studio/web/lib/jars/hibernate-3.6.8/commons-logging-1.1.1.jar
CP=$CP:/home/studio/web/lib/jars/tcs/job_scheduling/3.2.0/job_scheduling.jar
CP=$CP:/home/studio/web/lib/jars/tcs/configuration_manager/2.1.5/configuration_manager.jar
CP=$CP:/home/studio/web/lib/jars/tcs/configuration_persistence/1.0.2/configuration_persistence.jar
CP=$CP:/home/studio/web/lib/jars/tcs/configuration_api/1.1.0/configuration_api.jar
CP=$CP:/home/studio/web/lib/jars/tcs/base_exception/2.0.0/base_exception.jar
CP=$CP:/home/studio/web/lib/jars/tcs/logging_wrapper/2.0.0/logging_wrapper.jar
CP=$CP:/home/studio/web/lib/jars/tcs/object_formatter/1.0.0/object_formatter.jar
CP=$CP:/home/studio/web/lib/jars/tcs/document_generator/3.1.0/document_generator.jar
CP=$CP:/home/studio/web/lib/jars/tcs/typesafe_enum/1.0/typesafe_enum.jar
CP=$CP:/home/studio/web/lib/jars/tcs/job_processor/3.0.1/job_processor.jar
CP=$CP:/home/studio/web/lib/jars/tcs/executable_wrapper/1.0.1/executable_wrapper.jar
CP=$CP:/home/studio/web/lib/jars/tcs/object_factory_configuration_api_plugin/1.0.0/object_factory_configuration_api_plugin.jar
CP=$CP:/home/studio/web/lib/jars/tcs/object_factory/2.0.1/object_factory.jar
CP=$CP:/home/studio/jboss-4.0.4.GA/server/default/lib/shared.jar
CP=$CP:/home/studio/web/scripts/studioForumsReplyToJob

nohup java -cp $CP com.topcoder.forums.replyto.job.ForumReplyEmailRetrievalJobCommandTool 2>&1 &
echo $! >pid


