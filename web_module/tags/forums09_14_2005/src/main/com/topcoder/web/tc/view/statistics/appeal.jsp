<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Review Scorecard Appeal</title>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<div class="bodyText" style="padding: 10px">
<span class="bodySubtitle">Appeal to Question 1.1.3:</span><br>
I'm sorry, but you are mistaken.  My implementation exactly follows requirements.  In the thread you pointed out it's said: <cite> as clarified by PM in "Template Selection Algorithm" thread: "...Note that as you compare each Node you do the following: node.getName().equals(attribute.getName())
||node.getName().equals(attribute.getValue()" The node name is compared to attribute name first and (if it does not match) to attribute value then.</cite> I do exactly the same, for every child hierarchy name I try if it's equal here, because it's only matter if given node have corresponding attribute or not.  My modification is only performance boost: instead of looping through all attributes I'm checking existence in hash set which is done in O(1) time;
<br><br>
<span class="bodySubtitle">Appeal Response:</span><br>
I see your implementation carefully again, and it is right.  I have the same rule to all the submissions that putting the getting attriName and attriValue out of hte main cycle into an improvement.  So I give 4 here.  Sorry for my misunderstanding.
</div>
</body></html>