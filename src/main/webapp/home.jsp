<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 100;
            padding: 48px 0 0;
            box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
            background-color: #2b5797;
        }
        .sidebar-sticky {
            height: calc(100vh - 48px);
            overflow-x: hidden;
            overflow-y: auto;
        }
        .sidebar .nav-link {
            font-weight: 500;
            color: #f8f9fa;
            padding: 10px 20px;
        }
        .sidebar .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        .sidebar .nav-link.active {
            background-color: rgba(255, 255, 255, 0.2);
        }
        .sidebar .nav-link i {
            margin-right: 8px;
        }
        .main-content {
            margin-left: 240px;
            padding: 20px;
        }
        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            color: #2b5797;
            font-weight: bold;
        }
        .main-content {
            margin-left: 240px;
            padding: 20px;
            background: url('img/j.jpg') no-repeat center center;
            background-size: cover;
            height: 95vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
          margin-top: 20px ;
        }
        @media (max-width: 767.98px) {
            .sidebar {
                width: 100%;
                position: relative;
                padding-top: 0;
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp"><i class="fas fa-hard-hat me-2"></i>ConstructionXpert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

    </div>
</nav>

<!-- Sidebar -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar">
    <div class="position-sticky sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="Dashboard.jsp">
                    <i class="fas fa-tachometer-alt"></i>
                    Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/Gestion_de_Projets/DisplayProjetServlet">
                    <i class="fas fa-project-diagram"></i>
                    Projets
                </a>
            </li>

        </ul>
    </div>
</nav>

<div class="main-content">
    Bienvenu à votre espace
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>