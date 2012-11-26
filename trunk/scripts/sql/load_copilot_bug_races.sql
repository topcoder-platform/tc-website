SELECT ji.reporter AS bug_race_reporter,
       COUNT(*) AS bug_races_count
FROM jira_issue ji
INNER JOIN participation_metrics_report_copilot pmrc ON ji.contest_id = pmrc.contest_id
where ticket_id like 'BUGR%' and reporter != winner

GROUP BY 1
     