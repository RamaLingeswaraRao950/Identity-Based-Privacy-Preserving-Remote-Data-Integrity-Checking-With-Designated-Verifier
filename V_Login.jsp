<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>V_Authentication</title>
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
.style1 {color: #FF0000}
.style3 {color: #FF0000; font-weight: bold; }
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
          <li><a href="DU_Login.jsp"><span>Data User </span></a></li>
          <li><a href="DO_Login.jsp"><span>Data Owner </span></a></li>
         
          <li><a href="KGC_Login.jsp"><span>KGC</span></a></li>
          <li class="active"><a href="CS_Login.jsp"><span>Cloud Service Provider</span></a></li>
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
          <h2><span>Verifier Login  </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="article">
            <form action="V_Authentication.jsp" method="post" id="leavereply">
              <label for="name"><br />
              <img src="images/Login.png" width="144" height="144" /><br />
              <br />
                <span class="style3">Name (required)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></label>
              <span class="style3">
              <input name="userid" type="text" class="box" id="name" value="" />
              <label for="email"><br />
              <br />
              Password (required)&nbsp;</label>
              </span><span class="style1"><label for="email"></label>
              </span>
              <label for="email">&nbsp; </label>
              <input type="password" id="pass" name="pass" class="box" />
              <p>&nbsp;</p>
              <p>
                <input name="imageField" type="submit"  class="LOGIN" id="imageField" value="Login" />
                <input type="reset" name="imageField" id="imageField"  class="RESET" />
              </p>
              <p>&nbsp; </p>
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
               
                <li><a href="index.html">Home</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
