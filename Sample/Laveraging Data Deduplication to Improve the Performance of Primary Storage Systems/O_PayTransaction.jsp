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
.style4 {font-size: 24px}
.style5 {font-size: 16px}
.style7 {font-size: 16px; font-weight: bold; }
.style8 {font-size: 22px}
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
            <p>
              <%
	try
	{
	
		String cloud=request.getParameter("cloud");
		String dname=request.getParameter("dname");
		String card=request.getParameter("card");
		String cost=request.getParameter("cost");
		String cdn1=request.getParameter("cdn1");
		String cdn2=request.getParameter("cdn2");
		String cdn3=request.getParameter("cdn3");
		String cdn4=request.getParameter("cdn4");
		String cardn=cdn1+cdn2+cdn3+cdn4;
		String cv1=request.getParameter("cv1");
		String cv2=request.getParameter("cv2");
		String cvalidity=cv1+" "+"to"+" "+cv2;
		
		String sql = "SELECT * FROM cloudpurchase where downer='" + dname+ "'  ";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next()==true)
		{ 
			String sql1 = "SELECT * FROM cloudpurchase where cloud='" + cloud + "' and downer='" + dname+ "'";
			ResultSet rs1 = stmt.executeQuery(sql1);
			
			if (rs1.next()==true)
			{ 
			
			
				String oldcloud=rs1.getString(2);
				
				%>
            </p>
            <h3 class="style5 style3 style21"><span class="style4">You Have Already Purchased Memory in </span><span class="style8"><%=oldcloud%> !!</span></h3>
            <p class="style21">
              <%
			}
			else
			{
				%>
            </p>
            <span class="style7 style21">Transaction Details :</span>
            </p>
            <p class="style21">&nbsp; </p>
            <table width="427" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
              <tr>
                <th width="141" height="25" class="style21" scope="row"><div align="left"> Cloud: </div></th>
                <td width="286" class="style21"><%=cloud%>&nbsp;</td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left">Data Owner: </div></th>
                <td class="style21"><label></label>
                    <%=dname%></td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left">Payment Mode: </div></th>
                <td class="style21"><label></label>
                    <label><%=card%></label></td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left"> Card Number: </div></th>
                <td class="style21"><label></label>
                    <%=cardn%></td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left">Amount Payed :</div></th>
                <td class="style21"><label><%=cost%></label></td>
              </tr>
            </table>
            <p class="style21">
              <%
				String Requested="Requested";
				String strQuery2 = "insert into cloudpurchase(cloud,downer,pmode,cost,cardn,cvalidity,status) values('"+cloud+"','"+dname+"','"+card+"','"+cost+"','"+cardn+"','"+cvalidity+"','"+Requested+"')";
				Statement st=connection.createStatement();
				
				st.executeUpdate(strQuery2);
				
				%>
            </p>
            <p class="style21">&nbsp;</p>
            <h3 class="style4 style21">Transaction Successfull !! Wait For Approval !!</h3>
            <span class="style21">
            <%
			}
		}
		else
		{
			%>
            </p>
            </span><span class="style7 style21">Transaction Details :</span>
            </p>
<p class="style21">&nbsp; </p>
            <table width="427" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
              <tr>
                <th width="141" height="25" class="style21" scope="row"><div align="left"> Cloud: </div></th>
                <td width="286" class="style21"><%=cloud%>&nbsp;</td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left">Data Owner: </div></th>
                <td class="style21"><label></label>
                    <%=dname%></td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left">Payment Mode: </div></th>
                <td class="style21"><label></label>
                    <label><%=card%></label></td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left"> Card Number: </div></th>
                <td class="style21"><label></label>
                    <%=cardn%></td>
              </tr>
              <tr>
                <th height="25" class="style21" scope="row"><div align="left">Amount Payed :</div></th>
                <td class="style21"><label><%=cost%></label></td>
              </tr>
            </table>
            <p class="style21">
              <%
			String Requested="Requested";
			String strQuery2 = "insert into cloudpurchase(cloud,downer,pmode,cost,cardn,cvalidity,status) values('"+cloud+"','"+dname+"','"+card+"','"+cost+"','"+cardn+"','"+cvalidity+"','"+Requested+"')";
			Statement st=connection.createStatement();
			
			st.executeUpdate(strQuery2);
			
			%>
            </p>
            <p class="style21">&nbsp;</p>
            <h3 class="style4 style21">Transaction Successfull !! Wait For Approval !!</h3>
            <span class="style21">
            <%
		}
	} 
	catch (Exception e) 
	{
	out.print(e);
	e.printStackTrace();
	}
%>
            </span>
            <p align="right"><a href="O_PurchaseCloud.jsp">Back</a></p>
            <p align="justify" class="style20">&nbsp;</p>
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
