<%@ attribute name="row" required="true" type="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow" %>
<%@ attribute name="styleClass" required="false" %>


<a href="?module=ViewStandings&rd=${row.map['round_id']}" class="bcLink">
${row.map['contest_name']} - ${row.map['round_name']}
</a>
