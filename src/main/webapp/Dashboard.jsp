<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert Services - Tableau de bord</title>
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
        <a class="navbar-brand" href="#"><i class="fas fa-hard-hat me-2"></i>ConstructionXpert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-1"></i>Admin
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user-cog me-2"></i>Profil</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="index.html"><i class="fas fa-sign-out-alt me-2"></i>Déconnexion</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Sidebar -->
<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar">
    <div class="position-sticky sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="dashboard.html">
                    <i class="fas fa-tachometer-alt"></i>
                    Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="projects.html">
                    <i class="fas fa-project-diagram"></i>
                    Projets
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="tasks.html">
                    <i class="fas fa-tasks"></i>
                    Tâches
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="resources.html">
                    <i class="fas fa-cubes"></i>
                    Ressources
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="suppliers.html">
                    <i class="fas fa-truck"></i>
                    Fournisseurs
                </a>
            </li>
        </ul>
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
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="stats-icon me-3">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-0">Tâches</h5>
                            <h2 class="mt-2 mb-0">48</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="stats-icon me-3">
                            <i class="fas fa-cubes"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-0">Ressources</h5>
                            <h2 class="mt-2 mb-0">86</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body d-flex align-items-center">
                        <div class="stats-icon me-3">
                            <i class="fas fa-truck"></i>
                        </div>
                        <div>
                            <h5 class="card-title mb-0">Fournisseurs</h5>
                            <h2 class="mt-2 mb-0">24</h2>
                        </div>
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
                        <a href="projects.html" class="btn btn-sm btn-orange">Voir tout</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Date de début</th>
                                    <th>Budget</th>
                                    <th>Statut</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Tour Résidentielle Horizon</td>
                                    <td>10/03/2025</td>
                                    <td>1,200,000 €</td>
                                    <td><span class="badge bg-success">En cours</span></td>
                                </tr>
                                <tr>
                                    <td>Centre Commercial Etoile</td>
                                    <td>22/02/2025</td>
                                    <td>3,500,000 €</td>
                                    <td><span class="badge bg-primary">Planifié</span></td>
                                </tr>
                                <tr>
                                    <td>Bureaux Zone Tech</td>
                                    <td>05/01/2025</td>
                                    <td>850,000 €</td>
                                    <td><span class="badge bg-warning">En retard</span></td>
                                </tr>
                                <tr>
                                    <td>Extension Hôpital Central</td>
                                    <td>15/12/2024</td>
                                    <td>2,700,000 €</td>
                                    <td><span class="badge bg-info">En révision</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Tasks -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span>Tâches récentes</span>
                        <a href="tasks.html" class="btn btn-sm btn-orange">Voir tout</a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Projet</th>
                                    <th>Date limite</th>
                                    <th>Statut</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Installation des fondations</td>
                                    <td>Tour Résidentielle Horizon</td>
                                    <td>25/03/2025</td>
                                    <td><span class="badge bg-success">En cours</span></td>
                                </tr>
                                <tr>
                                    <td>Livraison des matériaux</td>
                                    <td>Centre Commercial Etoile</td>
                                    <td>30/03/2025</td>
                                    <td><span class="badge bg-primary">Planifié</span></td>
                                </tr>
                                <tr>
                                    <td>Installation électrique</td>
                                    <td>Bureaux Zone Tech</td>
                                    <td>10/03/2025</td>
                                    <td><span class="badge bg-danger">Non commencé</span></td>
                                </tr>
                                <tr>
                                    <td>Toiture et isolation</td>
                                    <td>Extension Hôpital Central</td>
                                    <td>18/03/2025</td>
                                    <td><span class="badge bg-warning">En retard</span></td>
                                </tr>
                                </tbody>
                            </table>
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