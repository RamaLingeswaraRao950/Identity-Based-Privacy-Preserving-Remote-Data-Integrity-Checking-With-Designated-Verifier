<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style20 {
	font-size: 14px;
	font-weight: bold;
	color: #353c3e;
}
.style21 {color: #353c3e}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Leveraging Data Deduplication to Improve the Performance of Primary Storage Systems in the Cloud</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Purchase Cloud  </h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img style21">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p align="justify" class="style20">Memory Cost:</p>
            <table width="582" border="2" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
              <tr>
                <th width="283" scope="row"><span class="style21">1000 RS = 55500 Memory </span></th>
                <td width="291"><div align="center"><strong>6000 RS =555000 Memory </strong></div></td>
              </tr>
              <tr>
                <th scope="row"><span class="style21">2000 RS = 111000 Memory</span></th>
                <td><div align="center"><strong>7000 RS = 666000 Memory </strong></div></td>
              </tr>
              <tr>
                <th scope="row"><span class="style21">3000 RS = 222000 Memory</span></th>
                <td><div align="center"><strong>8000 RS = 777000 Memory </strong></div></td>
              </tr>
              <tr>
                <th height="20" scope="row"><span class="style21">4000 RS =333000 Memory</span></th>
                <td><div align="center"><strong>9000 RS = 888000 Memory </strong></div></td>
              </tr>
              <tr>
                <th height="20" scope="row"><span class="style21">5000 RS = 444000 Memory</span></th>
                <td><div align="center"><strong>10000 RS =999000 Memory </strong></div></td>
              </tr>
            </table>
            <p align="justify">&nbsp;</p>
            <%
		String dname=(String)application.getAttribute("doname");
		String cloud=request.getParameter("cloud");
		
		%>
            <form id="form2" name="form2" method="post" action="O_PayTransaction.jsp">
              <table width="427" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                <tr>
                  <th width="141" height="40" scope="row"><div align="left" class="style21"> Cloud: </div></th>
                  <td width="286"><span class="style21">
                    <%
		ArrayList al=new ArrayList();
		String str="select name from cloud";
		ResultSet rs= connection.createStatement().executeQuery(str);

		while(rs.next())
		{
			al.add(rs.getString("name"));
			
		}%>
                    <select name="cloud">
                      <option>-Select cloud-</option>
                      <%
		for(int i=0;i<al.size();i++)
		{
		%>
                      <option><%=al.get(i)%></option>
                      <%}%>
                    </select>
                  </span></td>
                </tr>
                <tr>
                  <th height="40" scope="row"><div align="left" class="style21">Data Owner: </div></th>
                  <td><span class="style21">
                    <label>
                    <input required="required" readonly="<%=dname%>" name="dname" type="text" value="<%=dname%>" size="11" />
                    </label>
                  </span> </td>
                </tr>
                <tr>
                  <th height="40" scope="row"><div align="left" class="style21">Payment Mode: </div></th>
                  <td><span class="style21">
                    <label>
                    <select name="card">
                      <option>--Select--</option>
                      <option>Debit_Card </option>
                      <option>Credit_Card </option>
                    </select>
                    </label>
                  </span></td>
                </tr>
                <tr>
                  <th height="40" scope="row"><div align="left" class="style21">Enter Cost: </div></th>
                  <td><span class="style21">
                    <label>
                    <input required="required" name="cost" type="text" size="11" />
                    </label>
                  </span> </td>
                </tr>
                <tr>
                  <th height="40" scope="row"><div align="left" class="style21">Card Number: </div></th>
                  <td><span class="style21">
                    <label>
                    <input required="required" name="cdn1" type="text" size="4" maxlength="4" />
                    </label>
                    <label>
                    <input required="required" name="cdn2" type="text" size="4" maxlength="4" />
                    </label>
                    <label>
                    <input required="required" name="cdn3" type="text" size="4" maxlength="4" />
                    </label>
                    <label>
                    <input required="required" name="cdn4" type="text" size="4" maxlength="4" />
                    </label>
                  </span></td>
                </tr>
                <tr>
                  <th height="40" scope="row"><div align="left" class="style21">Card Validity: </div></th>
                  <td><span class="style21"> from
                      <label>
                      <input required="required" name="cv1" type="text" value="00/00" size="5" maxlength="5" />
                      to </label>
                    <input required="required" name="cv2" type="text" value="00/00" size="5" maxlength="5" />                  
                  </span></td>
                </tr>
                <tr>
                  <th height="60" scope="row">&nbsp;</th>
                  <td><span class="style21">
                    <label>
                    <input type="submit" name="Submit" value="Purchase" />
                    </label>
                  </span> </td>
                </tr>
              </table>
            </form>
            <p align="right"><a href="O_Main.jsp">Back</a></p>
            <p align="justify">&nbsp;</p>
          </div>
          <div class="style2"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="O_Main.jsp">Home</a></li>
            <li><a href="O_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Storage Capacity</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>Data Redundancy</h2>
        <p align="justify">Experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on disks due to relatively high temporal access locality associated with small I/O requests to redundant data. Moreover, directly applying data deduplication to primary storage systems in the Cloud will likely cause space contention in memory and data fragmentation<br />
        on disks.</p>
      </div>
      <div class="col c3">
        <h2>Primary Storage</h2>
        <p align="justify">Recent studies have shown that moderate to high data redundancy clearly exists in primary storage systems in the Cloud. Our experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on<br />
        disks due to relatively high temporal access locality associated with small I/O requests to redundant data.</p>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
