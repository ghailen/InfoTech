 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Add product</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    INFOTECH
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="dashboard.jsp">
                        <i class="ti-panel"></i>
                        <p>Stats</p>
                    </a>
                </li>
                <li>
                    <a href="productslist.jsp">
                        <i class="ti-list"></i>
                        <p>Products list</p>
                    </a>
                </li>
                
                <li class="active">
                    <a href="addproduct.jsp">
                        <i class="ti-plus"></i>
                        <p>Add Product</p>
                    </a>
                </li>
                <li>
                    <a href="modifyproduct.jsp">
                        <i class="ti-pencil"></i>
                        <p>Modify Product </p>
                    </a>
                </li>
             
                <li>
                    <a href="deleteproduct.jsp">
                        <i class="ti-trash"></i>
                        <p>Delete Product</p>
                    </a>
               </li>
                 <li>
                    <a href="message.jsp">
                        <i class="ti-comments-smiley"></i>
                        <p>Messages List</p>
                    </a>
               </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Stats</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           
                        </li>
                        <li class="dropdown">
                          
                        </li>
						<li>
                           <a href="alogin.jsp">
                        <i class="ti-export"></i>
                        <p>Log out</p>
                    </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

<br>
<br>

<center><h5 id="success" style="display: none;"> Product Added Successfully</h5></center>
       <div class="container">
  
  <section class="panel panel-default">
<div class="panel-heading"> 
<h3 class="panel-title">ADD PRODUCT</h3> 
</div> 
<div class="panel-body">
  
<form action="addproduct.jsp" method="get" class="form-horizontal" role="form">

<div class="form-group">
	


   <div class="form-group">
    <label for="name" class="col-sm-3 control-label">Name:</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="name" id="name" required>
    </div>
  </div> <!-- form-group // -->
  <div class="form-group">
    <label for="name" class="col-sm-3 control-label">Category:</label>
    <div class="col-sm-9">
      <select class="form-control" name="category" id="name" required>
      <option value="pc"> Pc</option>
      <option value="ac"> Ac </option>
      <option value="phone"> Phone </option>
      <option value="wearable"> Wearable </option>
      	<option value="tablet"> Tablet </option>
      </select>
    </div>
  </div> <!-- form-group // -->
  <div class="form-group">
    <label for="about" class="col-sm-3 control-label">Description:</label>
    <div class="col-sm-9">
      <textarea class="form-control" name="description" required></textarea>
    </div>
  </div> <!-- form-group // -->
  <div class="form-group">
    <label for="qty" class="col-sm-3 control-label">Price:</label>
    <div class="col-sm-3">
   <input type="text" class="form-control" name="price" id="qty" required>
    </div>
  </div> <!-- form-group // -->
  
	
  <div class="form-group">
    <label for="name" class="col-sm-3 control-label">Image path:</label>
    <div class="col-sm-3">
         <input type="file" class="form-control" name="image">
    </div>
    
	
  
  </div> <!-- form-group // -->
   <div class="form-group">
    <label for="qty" class="col-sm-3 control-label">Quantity:</label>
    <div class="col-sm-3">
   <input type="number" class="form-control" name="quantity" id="quantity" placeholder="..." required>
    </div>
  </div> <!-- form-group // -->
  <hr>
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <button type="submit" class="btn btn-primary">ADD</button>
    </div>
  </div> <!-- form-group // -->

  
</div><!-- panel-body // -->
</section><!-- panel// -->

  
</div> <!-- container// -->
</div>
</div>

<%
String name = request.getParameter("name");
String category= request.getParameter("category");
String description = request.getParameter("description");
String price= request.getParameter("price");
String image= request.getParameter("image");
String quantity	 = request.getParameter("quantity");





String connectionURL = "jdbc:mysql://localhost:3306/infotech";
// declare a connection by using Connection interface 
Connection connection = null;

PreparedStatement pstatement = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();
int updateQuery = 0;

// check if the text box is empty
if(name!=null && category!=null && description!=null && price!=null && image!=null && quantity!=null){
	 // check if the text box having only blank spaces
if(name!="" && category!="" && description!="" && price!="" && image!="" && quantity!="") {
           try {
    /* Create a connection by using getConnection()
    method that takes parameters of string type 
    connection url, user name and password to connect 
to database. */
    connection = DriverManager.getConnection
    (connectionURL, "root", "");
                  // sql query to insert values in the secified table.
    String queryString = "INSERT INTO produit(nom,categorie,description,prix,image,qte) VALUES (?,?,?,?,?,?)";
    	      /* createStatement() is used for create statement
    object that is used for 
sending sql statements to the specified database. */
    pstatement = connection.prepareStatement(queryString);
    pstatement.setString(1, name);
	  pstatement.setString(2, category);
	  pstatement.setString(3,description);
	  pstatement.setString(4,price);
	  pstatement.setString(5,image);	  
	  pstatement.setString(6,quantity);
    updateQuery = pstatement.executeUpdate();
                  if (updateQuery != 0) { %>
     <br>
     
     <script type="text/javascript">
     $('#success').fadeIn('fast').delay(1000).fadeOut(5000);
  
     </script>
   
    <%
    }
  } 
  catch (Exception ex) {
  out.println("Unable to connect to batabase.");

     }
  finally {
      // close all the connections.
      pstatement.close();
      connection.close();
  }
}
}
%>
  
</form>
</body>
</html>
