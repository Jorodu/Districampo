<%-- 
    Document   : Master
    Created on : 20-oct-2019, 12:07:39
    Author     : Reds
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="es">

<head>
	<title>DistriCampo | Home</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
	<meta name="keywords" content="Agro Crop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
        
        <style type="text/css">
            .divInline{
                display: inline-block;
            }
        </style>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
                
                //alert('<%=request.getContextPath()%>');
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
        <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
		<!-- Bootstrap-Core-CSS -->
        <link href="<%=request.getContextPath()%>/resources/css/owl.carousel.css" rel="stylesheet" type="text/css"/>
	
        <link href="<%=request.getContextPath()%>/resources/css/owl.theme.css" rel="stylesheet" type="text/css"/>
	<!-- Carousel (for News section) -->
        <link href="<%=request.getContextPath()%>/resources/css/flexslider.css" rel="stylesheet" type="text/css"/>
	<!-- Flexslider css (for Testimonials) -->
        <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet" type="text/css"/>
	<!-- Style-CSS -->        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	<link href="//fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i&amp;subset=cyrillic,latin-ext,vietnamese"
	    rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext"
	    rel="stylesheet">
	<!-- //Web-Fonts -->

</head>

<body>
	<!-- header -->
	<header>
		<!-- navigation -->
		<nav class="navbar navbar-expand-lg navbar-light px-sm-5 px-3 py-0">
			<center>
				<a class="navbar-brand py-2" href="/home"><img src="<%=request.getContextPath()%>/resources/imagenes/LogoDistricampoVt-220x80.png" width="220" height="70" alt=""/></a>
                                
			</center>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			    aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto ml-xl-5 ml-lg-3 px-xl-5 px-lg-4 py-4 text-center">
					<li class="nav-item">
						<a class="nav-link active" href="home">Home
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item mx-lg-4 my-lg-0 my-3">
						<a class="nav-link" href="#divNosotros">Nosotros</a>
					</li>
                                        <!--Validacion del usuario si es  -->
                                        <c:if test="${currentUser != null}">
                                            <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
                                                            Panel Rol
                                                    </a>
                                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <a class="dropdown-item scroll" href="#news">Our News</a>
                                                            <a class="dropdown-item scroll" href="#testi">Testimonials</a>
                                                            <a class="dropdown-item scroll" href="#works">Our Works</a>
                                                            <a class="dropdown-item" href="single.jsp">Some More</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="/404">404 Error Page</a>
                                                    </div>
                                            </li>
                                        </c:if>
					<li class="nav-item mx-lg-4 my-lg-0 my-3">
						<a class="nav-link" href="/projects">Projects</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/contact">Contactanos</a>
					</li>
                                        
				</ul>
				<div class="header-contact-w3ls text-center mt-lg-0 mt-4">
                                    <c:if test="${currentUser == null}">
                                        <a href="/login" class="py-sm-4 py-3 px-4">
                                            <i class="fas fa-user-circle"></i> Iniciar Sesión
                                        </a>                                    
                                        <a href="/register" class="py-sm-4 py-3 px-4">
                                                <i class="far fa-file-alt"></i> Registrarse
                                        </a>                                               
                                    </c:if>
                                    <c:if test="${currentUser != null}">
                                        Bienvenido: ${currentUser}
                                        <br/>
                                        <a href="/doLogout" class="py-sm-2 py-2 px-3">
                                            <i class="fas fa-window-close"></i> Cerrar Sesión
                                        </a>                                               
                                    </c:if>
				</div>
			</div>
		</nav>
		<!-- //navigation -->
	</header>
	<!-- //header -->