<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: url('img/j.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            color: #2b5797;
            font-weight: bold;
        }
        .info-box {
            font-weight: bold;
            text-shadow: 3px 3px 6px rgba(0,0,0,0.5);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            font-size: 1.5rem;
            width: 80%;
            max-width: 600px;
        }
        @media (max-width: 768px) {
            .info-box {
                font-size: 1.2rem;
                padding: 15px;
                width: 90%;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="index.jsp">
            <i class="fas fa-hard-hat me-2"></i>ConstructionXpert
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active me-3" href="Dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="/Gestion_de_Projets/DisplayProjetServlet">
                        <i class="fas fa-project-diagram"></i> Projets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active me-3" href="DisplayTache">
                        <i class="fas fa-tasks"></i> Tâches
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="info-box">
    Bienvenue sur notre plateforme de gestion de projets de construction
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>