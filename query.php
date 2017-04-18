<html>
<head>
<?php $title = "Hello" ?>
<title><?php print "$title"; ?></title>
</head>

<body bgcolor=white>
<h1><?php print "$title"; ?></h1>
<p>Please enter an SQL query here<br>Example: <tt>SELECT * FROM Actor WHERE id<50</tt></p>
<FORM METHOD = "POST" ACTION = "query.php">
  <TEXTAREA NAME="query" ROWS=5 COLS=30>
Enter an SQL query here.

</TEXTAREA>
  <INPUT TYPE="submit" VALUE="submit">
</FORM>

<?php
$query = $_POST["query"];
if(isset($query)) {
$db_connection = mysql_connect("localhost", "cs143", "");
if(!$db_connection) {
  $errmsg = mysql_error();
  print "Fail to connect: $errmsg <br/>";
  exit(1);
}

mysql_select_db("TEST", $db_connection);

$query_to_issue = mysql_real_escape_string($query, $db_connection);
if(!$query_to_issue) {
  $errmsg = mysql_error();
  print "Fail to create query to issue: $errmsg <br/>";
  exit(1);
}

$rs = mysql_query($query_to_issue, $db_connection);
if(!$rs) {
  $errmsg = mysql_error();
  print "Fail to query: $errmsg <br/>";
  exit(1);
}

$col_num = mysql_num_fields($rs);
if(!$col_num) {
  $errmsg = mysql_error();
  print "Fail to fetch number of columns: $errmsg <br/>";
  exit(1);
}
print "<h2>Results of the SQL query:</h2>";
print "<table border=1 cellspacing=1 cellpadding=2><tr align=center>";
for($i = 0; $i < $col_num; $i++) {
  $col_name = mysql_fetch_field($rs, $i);
  print "<th>{$col_name->name}</th>";
}
print "</tr>";

while($row = mysql_fetch_row($rs)) {
  print "<tr align=center>";
  foreach($row as $val) {
    if($val)
      print "<td>{$val}</td>";
    else {
      print "<td>N/A</td>";
    }
  }
  print "</tr>";
}
print "</table>";
mysql_close($db_connection);

}
?>

</body>
</html>
