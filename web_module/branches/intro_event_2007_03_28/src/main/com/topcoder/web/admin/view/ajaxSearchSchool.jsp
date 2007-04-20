<%@page contentType="text/xml"%>
<taconite-root xml:space="preserve">
    <taconite-replace contextNodeID="schoolSearch" parseInBrowser="true">
		<div id="schoolSearch">
			<tc-webtag:objectSelect name="school_sel_id" list="${schools}" valueField="id" textField="name"  topText="[Select one]" topValue="-1" />
		</div>
	</taconite-replace>
</taconite-root>
 