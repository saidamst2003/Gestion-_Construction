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
            background: url('img/j.jpg') no-repeat center center fixed;
            background-size: cover;
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
        .card {
            margin-bottom: 20px;
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #ffffff;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            font-weight: bold;
        }
        .stats-icon {
            font-size: 2rem;
            color: #ffa500;
        }
        .btn-orange {
            background-color: #ffa500;
            border-color: #ffa500;
            color: white;
        }
        .btn-orange:hover {
            background-color: #e69500;
            border-color: #e69500;
            color: white;
        }
        @media (max-width: 767.98px) {

            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand fw-bold text-primary" href="index.jsp">
            <i class="fas fa-hard-hat me-2"></i>ConstructionXpert
        </a>

        <!-- Bouton toggle pour mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active me-3" href="Dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="/Gestion_de_Projets/DisplayProjetServlet">
                        <i class="fas fa-project-diagram"></i> Projets
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active me-3" href="/Gestion_de_Projets/DisplayTache">
                        <i class="fas fa-tasks"></i> Tâches
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>



<!-- Main Content -->
<main class="main-content">
    <div class="container-fluid pt-5 mt-3">
        <h1 class="h2 mb-4">Tableau de bord</h1>

        <!-- Stats Cards -->
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="stats-icon me-3">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-0">Projets</h5>
                            <h2 class="mt-2 mb-0">12</h2>
                        </div>
                    </div>
                </div>
            </div>

        <!-- Recent Projects -->
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span>Projets récents</span>
                        <a href="/Gestion_de_Projets/DisplayProjetServlet" class="btn btn-sm btn-orange">Voir tout</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Date de début</th>
                                    <th>Budget</th>
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>