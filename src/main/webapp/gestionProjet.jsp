<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.GestionProject.model.Projet" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert Services - Gestion des Projets</title>
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
        .btn-blue {
            background-color: #2b5797;
            border-color: #2b5797;
            color: white;
        }
        .btn-blue:hover {
            background-color: #1e3c6a;
            border-color: #1e3c6a;
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


<nav id="sidebar" class="col-md-3 col-lg-2 d-md-block sidebar">
    <div class="position-sticky sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="Dashboard.jsp">
                    <i class="fas fa-tachometer-alt"></i>
                    Tableau de bord
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="projects.html">
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
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h2">Gestion des Projets</h1>
            <button class="btn btn-orange" data-bs-toggle="modal" data-bs-target="#addProjectModal">
                <i class="fas fa-plus me-2"></i>Nouveau Projet
            </button>
        </div>
        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            if (projets != null && !projets.isEmpty()) {
        %>
        <% for (Projet p : projets) { %>
        <!-- Projects List -->
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Nom du Projet</th>
                            <th>Description</th>
                            <th>Date de début</th>
                            <th>Date de fin</th>
                            <th>Budget</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><%=p.getIdProjet()%></td>
                            <td><%= p.getNomProjet() %></td> <!-- Correction ici, on enlève le > en trop -->
                            <td><%= p.getDescriptionProjet() %></td> <!-- Correction ici -->
                            <td><%= p.getDateDebut() %></td> <!-- Correction ici -->
                            <td><%= p.getDateFin() %></td> <!-- Correction ici -->
                            <td><%= p.getBudget() %></td> <!-- Correction ici -->
                            <td><span class="badge bg-success">En cours</span></td>
                            <td>
                                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#viewTasksModal"><i class="fas fa-tasks me-1"></i></button>
                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editProjectModal"><i class="fas fa-edit me-1"></i></button>
                                <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteProjectModal"><i class="fas fa-trash me-1"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <% } %>
        <% } %>
    </div>
</main>


<!-- Add Project Modal -->
<div class="modal fade" id="addProjectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ajouter un nouveau projet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProjectForm" action="AddProjet" method="post">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="projectName" class="form-label">Nom du projet</label>
                            <input type="text" class="form-control" name="nomProjet" id="projectName" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="projectDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="projectDescription" rows="3" required></textarea>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="projectStartDate" class="form-label">Date de début</label>
                            <input type="date" class="form-control" name="dateDebut" id="projectStartDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="projectEndDate" class="form-label">Date de fin</label>
                            <input type="date" class="form-control" name="dateFin" id="projectEndDate" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="projectBudget" class="form-label">Budget (dh)</label>
                        <input type="number" name="budget" class="form-control" id="projectBudget" min="0" step="1000" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-blue">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Edit Project Modal -->
<div class="modal fade" id="editProjectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modifier le projet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProjectForm">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="editProjectName" class="form-label">Nom du projet</label>
                            <input type="text" class="form-control" id="editProjectName" value="Tour Résidentielle Horizon" required>
                        </div>
                        <div class="col-md-6">
                            <label for="editProjectStatus" class="form-label">Statut</label>
                            <select class="form-select" id="editProjectStatus" required>
                                <option value="">-- Sélectionner --</option>
                                <option value="En cours" selected>En cours</option>
                                <option value="Planifié">Planifié</option>
                                <option value="En retard">En retard</option>
                                <option value="En révision">En révision</option>
                                <option value="À venir">À venir</option>
                                <option value="Terminé">Terminé</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="editProjectDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="editProjectDescription" rows="3" required>Construction d'une tour résidentielle de 20 étages</textarea>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="editProjectStartDate" class="form-label">Date de début</label>
                            <input type="date" class="form-control" id="editProjectStartDate" value="2025-03-10" required>
                        </div>
                        <div class="col-md-6">
                            <label for="editProjectEndDate" class="form-label">Date de fin</label>
                            <input type="date" class="form-control" id="editProjectEndDate" value="2026-09-15" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="editProjectBudget" class="form-label">Budget (€)</label>
                        <input type="number" class="form-control" id="editProjectBudget" value="1200000" min="0" step="1000" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-blue" onclick="updateProject()">Mettre à jour</button>
            </div>
        </div>
    </div>
</div>

<!-- Delete Project Modal -->
<div class="modal fade" id="deleteProjectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirmer la suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Êtes-vous sûr de vouloir supprimer ce projet? Cette action est irréversible.</p>
                <p><strong>Note:</strong> Toutes les tâches associées à ce projet seront également supprimées.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-danger" onclick="deleteProject()">Supprimer</button>
            </div>
        </div>
    </div>
</div>

<!-- View Tasks Modal -->
<div class="modal fade" id="viewTasksModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tâches du projet: Tour Résidentielle Horizon</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-end mb-3">
                    <button class="btn btn-orange" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                        <i class="fas fa-plus me-2"></i>Nouvelle Tâche
                    </button>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Description</th>
                            <th>Date de début</th>
                            <th>Date de fin</th>
                            <th>Ressources</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Installation des fondations</td>
                            <td>12/03/2025</td>
                            <td>25/03/2025</td>
                            <td>
                                <span class="badge bg-secondary">Béton</span>
                                <span class="badge bg-secondary">Acier</span>
                                <span class="badge bg-secondary">Excavatrice</span>
                            </td>
                            <td><span class="badge bg-success">En cours</span></td>
                            <td>
                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editTaskModal"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Structure de base (jusqu'au 5ème étage)</td>
                            <td>26/03/2025</td>
                            <td>30/04/2025</td>
                            <td>
                                <span class="badge bg-secondary">Béton</span>
                                <span class="badge bg-secondary">Acier</span>
                                <span class="badge bg-secondary">Grue</span>
                            </td>
                            <td><span class="badge bg-primary">Planifié</span></td>
                            <td>
                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editTaskModal"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Structure (6ème au 10ème étage)</td>
                            <td>01/05/2025</td>
                            <td>15/06/2025</td>
                            <td>
                                <span class="badge bg-secondary">Béton</span>
                                <span class="badge bg-secondary">Acier</span>
                                <span class="badge bg-secondary">Grue</span>
                            </td>
                            <td><span class="badge bg-primary">Planifié</span></td>
                            <td>
                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editTaskModal"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>


    function updateProject() {
        // Get form values
        const name = document.getElementById('editProjectName').value;
        const description = document.getElementById('editProjectDescription').value;
        const startDate = document.getElementById('editProjectStartDate').value;
        const endDate = document.getElementById('editProjectEndDate').value;
        const budget = document.getElementById('editProjectBudget').value;
        const status = document.getElementById('editProjectStatus').value;

        // Here you would normally send this data to the server
        console.log("Updating project:", { name, description, startDate, endDate, budget, status });

        // For demo purposes, just close the modal and show an alert
        alert("Projet mis à jour avec succès!");
        bootstrap.Modal.getInstance(document.getElementById('editProjectModal')).hide();

        // In a real app, you would refresh the table with the new data from the server
    }

    function deleteProject() {
        // Here you would normally send a delete request to the server
        console.log("Deleting project");

        // For demo purposes, just close the modal and show an alert
        alert("Projet supprimé avec succès!");
        bootstrap.Modal.getInstance(document.getElementById('deleteProjectModal')).hide();

        // In a real app, you would remove the row from the table
    }
</script>
</body>
</html>
