<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User </title>
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
.style23 {
	color: #353c3e;
	font-weight: bold;
}
.style24 {font-size: 18px}
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="U_Main.jsp">Hi <%=application.getAttribute("uname")%> !!</a></li>
          <li><a href="U_Login.jsp">Logout</a></li>
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
        <div class="mainbar">
          <div class="article">
            <h2>Download  Files  </h2>
            <p>&nbsp;            </p>
            <p>
              <%
try
	{
	
		String file = request.getParameter("t1");
		String owner = request.getParameter("oname");
		String mac1 = request.getParameter("t12");
		String mac2 = request.getParameter("t122");
		String mac3 = request.getParameter("t123");
		String mac4 = request.getParameter("t124");
		String sk = request.getParameter("t13");
		
		application.setAttribute("file2", file);
		application.setAttribute("sk2", sk);
		
		
		String keys = "ef50a0ef2c3e3a5f";
		
		String strQuer = "select * from cloudserver where fname='"+file+"' ";
		ResultSet r = connection.createStatement().executeQuery(strQuer);
		if(r.next()==true)
		{
			String maac1=r.getString(6);
			
			if(maac1.equalsIgnoreCase("Shared"))
			{
			
				String ct1=r.getString(5);
				
				byte[] keyValue = keys.getBytes();
				Key key = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.DECRYPT_MODE, key);
				String fn = new String(Base64.decode(ct1.getBytes()));
				
				
				
				String strQuery1 = "select * from cloudserver where fname='"+ fn+ "' and  mac1='"+ mac1+ "' and  mac2='"+ mac2+ "' and  mac3='"+ mac3+ "' and  mac4='"+ mac4+ "' and  sk='" + sk + "'";
				
				String strQuery12 = "select * from cloudserver where fname='"+ fn+ "' ";
				
				ResultSet rs12 = connection.createStatement().executeQuery(strQuery12);
				ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
				if(rs12.next())
				{
					if(rs1.next())
					{
						String ct11 = rs1.getString(5);
						String ct12 = rs1.getString(7);
						String ct13 = rs1.getString(9);
						String ct14 = rs1.getString(11);
						
						
						byte[] keyValue1 = keys.getBytes();
						Key key1 = new SecretKeySpec(keyValue1, "AES");
						Cipher c1 = Cipher.getInstance("AES");
						c1.init(Cipher.DECRYPT_MODE, key1);
						String decryptedValue11 = new String(Base64.decode(ct11.getBytes()));
						String decryptedValue22 = new String(Base64.decode(ct12.getBytes()));
						String decryptedValue33 = new String(Base64.decode(ct13.getBytes()));
						String decryptedValue44 = new String(Base64.decode(ct14.getBytes()));
						%>
						</p>
						</p>
						<p align="center" class="style1 style23">File Contents</p>
						<label>
						<div align="center">
						<textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue11%><%=decryptedValue22%><%=decryptedValue33%><%=decryptedValue44%></textarea>
						<br/>
						<br/>
						<td><button onclick="saveTextAsFile()">Download</button></td>
						</div>
						</label>
						<p align="center">&nbsp; </p>
						<p>
						<%
					} 
					else 
					{
						SimpleDateFormat sdfDate = new SimpleDateFormat(
						"dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat(
						"HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						String user = (String) application.getAttribute("uname");
						String strQuery2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+ user+ "','"+ file+ "','"+ sk+ "','"+ dt+ "','Trapdoor/Sk Mismatch')";
						connection.createStatement().executeUpdate(strQuery2);
						%>
						</p>
						<h3 class="style24">Trapdoor / Secret Key Mismatch !!!</h3>
						</p>
						<br />
						<%
					}
				}
				else 
				{
					%>
					<h3 class="style24">File Doesn't Exist !!!</h3>
					</p>
					<br />
					<%
				}
			}
			else
			{
		
				String strQuery = "select * from cloudserver where fname='"+ file+ "' and ownername='"+ owner+ "' and  mac1='"+ mac1+ "' and  mac2='"+ mac2+ "' and  mac3='"+ mac3+ "' and  mac4='"+ mac4+ "' and  sk='" + sk + "'";
				
				String strQuery1 = "select * from cloudserver where fname='"+ file+ "' ";
				
				ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				if(rs1.next())
				{
					if(rs.next())
					{
						String ct1 = rs.getString(5);
						String ct2 = rs.getString(7);
						String ct3 = rs.getString(9);
						String ct4 = rs.getString(11);
						
						
						byte[] keyValue1 = keys.getBytes();
						Key key1 = new SecretKeySpec(keyValue1, "AES");
						Cipher c1 = Cipher.getInstance("AES");
						c1.init(Cipher.DECRYPT_MODE, key1);
						String decryptedValue1 = new String(Base64.decode(ct1.getBytes()));
						String decryptedValue2 = new String(Base64.decode(ct2.getBytes()));
						String decryptedValue3 = new String(Base64.decode(ct3.getBytes()));
						String decryptedValue4 = new String(Base64.decode(ct4.getBytes()));
						%>
						</p>
						</p>
						<p align="center" class="style1 style23">File Contents</p>
						<label>
						<div align="center">
						<textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue1%><%=decryptedValue2%><%=decryptedValue3%><%=decryptedValue4%></textarea>
						<br/>
						<br/>
						<td><button onclick="saveTextAsFile()">Download</button></td>
						</div>
						</label>
						<p align="center">&nbsp; </p>
						<p>
						<%
					} 
					else 
					{
						SimpleDateFormat sdfDate = new SimpleDateFormat(
						"dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat(
						"HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						String user = (String) application.getAttribute("uname");
						String strQuery2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+ user+ "','"+ file+ "','"+ sk+ "','"+ dt+ "','Trapdoor/Sk Mismatch')";
						connection.createStatement().executeUpdate(strQuery2);
						%>
						</p>
						<h3 class="style24">Trapdoor / Secret Key Mismatch !!!</h3>
						</p>
						<br />
						<%
					}
				}
				else 
				{
					%>
					<h3 class="style24">File Doesn't Exist !!!</h3>
					</p>
					<br />
					<%
				}
			
			}
		}	
		connection.close();
	} 
	catch (Exception e)
	{
	out.println(e.getMessage());
	}
	
	%>
<p class="infopost">&nbsp;</p>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="right"><a href="U_Download.jsp">Back</a></p>
            </div>
            <div class="style2"></div>
          </div>
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
            <li><a href="U_Main.jsp">Home</a></li>
            <li><a href="U_ViewFiles.jsp">View Files</a></li>
            <li><a href="U_Login.jsp">Logout</a></li>
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
