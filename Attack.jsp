<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attacker</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24px}
.style2 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
	<div class="logo style1">
        <h3 class="style1 style2">Identity Based Privacy Preserving Remote Data Integrity <br />
        Checking With a Designated Verifier  </h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home </span></a></li>
         
          <li></li>
        </ul>
      </div>
      
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Content Attacker </h2>
          <p>&nbsp;</p>
          <div>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <%
try
{

%>
<form method="post" action="Attack1.jsp">
<table width="755" border="1" align="center" >
<tr><td align="center">User Name</td><td><input type="text" placeholder="Enter Your Name" name="aname"/> </td></tr>
<tr><td align="center">File Name</td><td><input type="text" placeholder="Enter File Name to Attack" name="fname"/> </td></tr>
<tr><td align="center">Select Block</td><td><select name="block" ><option>--Select--</option>
<option>Block-1</option>
<option>Block-2</option>
<option>Block-3</option>
<option>Block-4</option>
</select> </td></tr>
<tr><td align="center">Owner Name</td><td><input type="text" placeholder="Enter Owner Name" name="owner"/> </td></tr>



<tr> <td colspan="2" align="center"><input type="submit" value="Attack"/></td></table>
<%
}
catch(Exception e)
{
e.printStackTrace();

}
%>
            <p>&nbsp;</p>
    </div>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
</div>
  </div>
<div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
