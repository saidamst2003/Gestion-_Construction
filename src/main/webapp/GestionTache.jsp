
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.GestionProject.model.Projet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.GestionProject.model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Gestion des Tâches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: url('img/j.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .sidebar .nav-link i {
            margin-right: 8px;
        }
        .main-content {
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
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        .status-en-attente {
            background-color: #ffc107;
            color: #000;
        }
        .status-en-cours {
            background-color: #0d6efd;
            color: #fff;
        }
        .status-terminee {
            background-color: #198754;
            color: #fff;
        }
        .status-retard {
            background-color: #dc3545;
            color: #fff;
        }
        .resource-badge {
            background-color: #6c757d;
            margin-right: 5px;
            font-size: 0.8rem;
        }
        .task-priority-high {
            border-left: 5px solid #dc3545;
        }
        .task-priority-medium {
            border-left: 5px solid #ffc107;
        }
        .task-priority-low {
            border-left: 5px solid #0d6efd;
        }
        .progress {
            height: 10px;
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
        <a class="navbar-brand fw-bold text-primary" href="home.jsp">
            <i class="fas fa-hard-hat me-2"></i>ConstructionXpert
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link me-3" href="Dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="/Gestion_de_Projets/DisplayProjetServlet">
                        <i class="fas fa-project-diagram"></i> Projets
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active me-3" href="GestionTache.jsp">
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
        <div class="row mb-4 mt-2">
            <div class="col-md-8">
                <h1 class="h2">Gestion des Tâches</h1>
                <p class="text-muted">Gérez efficacement les tâches de vos projets de construction</p>
            </div>
            <div class="col-md-4 text-end">
                <button class="btn btn-orange" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                    <i class="fas fa-plus me-2"></i>Nouvelle Tâche
                </button>
            </div>
        </div>

        <!-- Project Selection -->
        <div class="card mb-4">
            <div class="card-body">
                <form class="row g-3">
                    <div class="col-md-6">
                        <label for="projectSelect" class="form-label">Sélectionner un projet</label>
                        <select class="form-select" id="projectSelect">
                            <option selected>Tous les projets</option>

                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="statusFilter" class="form-label">Statut</label>
                        <select class="form-select" id="statusFilter">
                            <option selected>Tous</option>
                            <option>En attente</option>
                            <option>En cours</option>
                            <option>Terminée</option>
                            <option>En retard</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="priorityFilter" class="form-label">Priorité</label>
                        <select class="form-select" id="priorityFilter">
                            <option selected>Toutes</option>
                            <option>Haute</option>
                            <option>Moyenne</option>
                            <option>Basse</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>

        <!-- Tasks List -->
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th width="30%">Tâche</th>
                            <th>Projet</th>
                            <th>Dates</th>
                            <th>Ressources</th>
                            <th>Progression</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr class="task-priority-high">
                            <td>
                                <div class="fw-bold">j</div>
                                <div class="small text-muted">Responsable: John Doe</div>
                            </td>
                            <td>l</td>
                            <td>
                                <div><i class="far fa-calendar-alt me-1"></i> Début: l</div>
                                <div><i class="far fa-calendar-check me-1"></i> Fin: k</div>
                            </td>
                            <td>
                                <span class="badge resource-badge">Béton</span>
                                <span class="badge resource-badge">Acier</span>
                            </td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="small text-center mt-1">75%</div>
                            </td>
                            <td><span class="badge status-en-cours">En cours</span></td>
                            <td>
                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editTaskModal" onclick="editTask">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteTaskModal" onclick="setDeleteTaskId">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="7" class="text-center py-4">
                                <div class="text-muted">
                                    <i class="fas fa-tasks fa-2x mb-3"></i>
                                    <p>Aucune tâche trouvée. Commencez par ajouter une nouvelle tâche.</p>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Add Task Modal -->
<div class="modal fade" id="addTaskModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ajouter une nouvelle tâche</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addTaskForm" action="AddTach" method="post">

                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="taskDescription" class="form-label">Description de la tâche</label>
                            <input type="text" class="form-control" name="descriptionTache" id="taskDescription" required>
                        </div>
                        <div class="col-md-4">
                            <label for="taskProject" class="form-label">Projet associé</label>
                            <select class="form-select" name="idProjet" id="taskProject" required>
                                <option value="" selected disabled>Sélectionner un projet</option>

                                <option value=""></option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="taskStartDate" class="form-label">Date de début</label>
                            <input type="date" class="form-control" name="dateDebutTache" id="taskStartDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="taskEndDate" class="form-label">Date de fin</label>
                            <input type="date" class="form-control" name="dateFintTache" id="taskEndDate" required>
                        </div>
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

<!-- Edit Task Modal -->
<div class="modal fade" id="editTaskModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modifier la tâche</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editTaskForm" action="/Gestion_de_Projets/UpdateTacheServlet" method="post">
                    <input type="hidden" id="editTaskId" name="idTache">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="editTaskDescription" class="form-label">Description de la tâche</label>
                            <input type="text" class="form-control" name="descriptionTache" id="editTaskDescription" required>
                        </div>
                        <div class="col-md-4">
                            <label for="editTaskProject" class="form-label">Projet associé</label>
                            <select class="form-select" name="idProjet" id="editTaskProject" required>

                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="editTaskStartDate" class="form-label">Date de début</label>
                            <input type="date" class="form-control" name="dateDebutTache" id="editTaskStartDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="editTaskEndDate" class="form-label">Date de fin</label>
                            <input type="date" class="form-control" name="dateFintTache" id="editTaskEndDate" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="editTaskStatus" class="form-label">Statut</label>
                            <select class="form-select" name="statusTache" id="editTaskStatus" required>
                                <option value="En attente">En attente</option>
                                <option value="En cours">En cours</option>
                                <option value="Terminée">Terminée</option>
                                <option value="En retard">En retard</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="editTaskPriority" class="form-label">Priorité</label>
                            <select class="form-select" name="priorityTache" id="editTaskPriority" required>
                                <option value="Haute">Haute</option>
                                <option value="Moyenne">Moyenne</option>
                                <option value="Basse">Basse</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="editTaskResponsible" class="form-label">Responsable</label>
                            <input type="text" class="form-control" name="responsableTache" id="editTaskResponsible">
                        </div>
                        <div class="col-md-6">
                            <label for="editTaskProgress" class="form-label">Progression (%)</label>
                            <input type="number" class="form-control" name="progressionTache" id="editTaskProgress" min="0" max="100">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="editTaskResources" class="form-label">Ressources nécessaires</label>
                        <input type="text" class="form-control" name="ressourcesTache" id="editTaskResources" placeholder="Béton, Acier, Excavatrice...">
                        <div class="form-text">Séparez les ressources par des virgules</div>
                    </div>
                    <div class="mb-3">
                        <label for="editTaskNotes" class="form-label">Notes additionnelles</label>
                        <textarea class="form-control" name="notesTache" id="editTaskNotes" rows="3"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-blue">Mettre à jour</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Task Modal -->
<div class="modal fade" id="deleteTaskModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirmer la suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Êtes-vous sûr de vouloir supprimer cette tâche? Cette action est irréversible.</p>
                <form id="deleteTaskForm" action="/Gestion_de_Projets/DeleteTacheServlet" method="post">
                    <input type="hidden" id="deleteTaskId" name="idTache">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-danger" onclick="document.getElementById('deleteTaskForm').submit()">Supprimer</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Function to populate the edit task modal
    function editTask(taskId) {
        // In a real application, you would fetch the task data from the server
        // For now, I'll just set placeholder values
        document.getElementById('editTaskId').value = taskId;

        // Example of populating fields with data from backend
        // This would be replaced with actual data in production
        document.getElementById('editTaskDescription').value = "Fondation bâtiment principal";
        document.getElementById('editTaskStartDate').value = "2025-04-01";
        document.getElementById('editTaskEndDate').value = "2025-04-15";
        document.getElementById('editTaskStatus').value = "En cours";
        document.getElementById('editTaskPriority').value = "Haute";
        document.getElementById('editTaskResponsible').value = "John Doe";
        document.getElementById('editTaskProgress').value = "75";
        document.getElementById('editTaskResources').value = "Béton, Acier, Excavatrice";
        document.getElementById('editTaskNotes').value = "Attention aux spécifications techniques pour le béton armé.";
    }

    // Function to set the task ID for deletion
    function setDeleteTaskId(taskId) {
        document.getElementById('deleteTaskId').value = taskId;
    }
</script>

</body>
</html>