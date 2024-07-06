<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Data User Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style13 {
	color: #FF0000;
	font-weight: bold;
	font-style: italic;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html"><span>Identity-Based Privacy Preserving Remote Data<br />
Integrity Checking With a Designated Verifier
</span></a><a href="index.html"><span></span></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home </span></a></li>
          <li class="active"><a href="DU_Login.jsp"><span>Data User </span></a></li>
          <li><a href="GM_Login.jsp"><span>Group Manager </span></a></li>
          <li><a href="KGC_Login.jsp"><span>KGC</span></a></li>
          <li><a href="CS_Login.jsp"><span>Cloud Service Provider</span></a></li>
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
          <h2><span>Data User Register  </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="article">
            <form action="DU_RegisterAuthentication.jsp" method="post" id="" enctype="multipart/form-data">
              <label for="name"><br />
                <span class="style13"><img src="images/Register.png" width="298" height="97" /><br />
                <br />
                <br />
                Data User Name (required)<br />
                </span></label>
              <p class="style13">
                <input id="name" name="userid" class="text" />
              </p>
              <span class="style13">
              <label for="password">Password (required)<br />
              </label>
              </span>
              <p class="style13">
                <input type="password" id="password" name="pass" class="text" />
              </p>
              <p class="style13">
              <label for="email">Email Address (required)</label>
              <p class="style13">
                <input id="email" name="email" class="text" />
              </p>
              <span class="style13">
              <label for="mobile">Mobile Number (required)<br />
              </label>
              </span>
              <p class="style13">
                <input id="mobile" name="mobile" class="text" />
              </p>
              <span class="style13">
              <label for="address">Your Address<br />
              </label>
              </span>
              <p class="style13">
                <textarea name="address" cols="50" id="address"></textarea>
              </p>
              <span class="style13">
              <label for="dob">Date of Birth (required)<br />
              </label>
              </span>
              <p class="style13">
                <input id="dob" name="dob" class="text" />
              </p>
              <span class="style13">
              <label for="gender">Select Gender (required)<br />
              </label>
              </span>
              <p class="style13">
                <select id="s1" name="gender" class="text">
                  <option>-Select-</option>
                  <option>Male</option>
                  <option>Female</option>
                </select>
              </p>
              <span class="style13">
              <label for="pincode">Enter Pincode (required)<br />
              </label>
              </span>
              <p class="style13">
                <input id="pincode" name="pincode" class="text" />
              </p>
              <span class="style13">
              <label for="location">Enter Location (required)<br />
              </label>
              </span>
              <p class="style13">
                <input id="loc" name="location" class="text" />
              </p>
			  
              <span class="style13">
              <label for="pic">Select Profile Picture (required)</label>
              </span>
              <em><strong>
              <label for="pic"></label>
              </strong></em><strong><label for="pic"></label>
              </strong>
              <label for="pic"><br />
              </label>
              <p>
                <input type="file" id="pic" name="pic" class="text" />
              </p>
              <p>
                <input name="submit" type="submit" value="REGISTER" />
              </p>
            </form>
            <p align="justify">&nbsp;</p>
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search :" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="g1">
          <div class="g2">
            <div class="gadget">
              <h2 class="star">Menu</h2>
              <div class="clr"></div>
              <ul class="sb_menu">
                <li><a href="DU_Login.jsp">Data User</a></li>
                <li><a href="DO_Login.jsp">Data Owner </a></li>
                <li><a href="CS_Login.jsp">Cloud Server</a></li>
                <li><a href="KGC_Login.jsp">KGC</a></li>
              </ul>
            </div>
          </div>
        </div>
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
