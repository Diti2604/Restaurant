<?php

session_start();

if (!isset($_SESSION["login"]) || $_SESSION["type"] != "admin") {
    header("Location: login.php");
    exit();
}
// Include config file
require_once "config.php";

// Initialize variables
$id = $name = $price = $category = $ingredients = "";
$update = false;

// CRUD Operations

// Create
if (isset($_POST['create'])) {
    $name = $_POST['name'];
    $price = $_POST['price'];
    $category = $_POST['category'];
    $ingredients = $_POST['ingredients'];

    $sql = "INSERT INTO menu (name, price, category, ingredients) VALUES ('$name', '$price', '$category', '$ingredients')";
    mysqli_query($conn, $sql);

    header('location: admin.php');
}

// Read
$menuItems = mysqli_query($conn, "SELECT * FROM menu");

// Update
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $update = true;
    $result = mysqli_query($conn, "SELECT * FROM menu WHERE id=$id");
    $row = mysqli_fetch_assoc($result);
    $name = $row['name'];
    $price = $row['price'];
    $category = $row['category'];
    $ingredients = $row['ingredients'];
}

if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $category = $_POST['category'];
    $ingredients = $_POST['ingredients'];

    mysqli_query($conn, "UPDATE menu SET name='$name', price='$price', category='$category', ingredients='$ingredients' WHERE id=$id");

    header('location: admin.php');
}

// Delete
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    mysqli_query($conn, "DELETE FROM menu WHERE id=$id");
    header('location: admin.php');
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            padding: 12px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .form-container {
            margin-top: 20px;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .form-container button {
            padding: 8px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        /* Updated Style for Action Box */
        .action-links {
            display: flex;
            justify-content: center;
        }

        .action-links a {
            margin: 0 5px;
        }

        .action-links a.btn {
            padding: 6px 12px;
            font-size: 14px;
        }

        .action-links a.btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .action-links a.btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .action-links a.btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .action-links a.btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .styled-text {
            font-style: italic;
            font-weight: bold;
            color: rgb(52, 58, 64);
            /* Change color as desired */
        }

        .logout-icon {
            width: 32px;
            height: 32px;
            transition: transform 0.3s;
            margin-top: 32px;
        }

        .logout-icon:hover {
            transform: scale(1.1);
            cursor: pointer;
        }
        .home-icon {
            width: 32px;
            height: 32px;
            transition: transform 0.3s;
            margin-top: 32px;
            margin-right: 20px;
        }

        .home-icon:hover {
            transform: scale(1.1);
            cursor: pointer;
        }
    </style>
</head>

<body class="container">
    <div class="row">
        <div class="col-md-6">
            <h2 class="mt-4 mb-4">Admin Dashboard</h2>
        </div>
        <div class="col-md-6 text-right mb-4">
        <img src="assets/img/home.jpg" alt="Home" class="home-icon" onclick="window.location.href = 'index.php';">
            <!-- Logout Button -->
            <img src="assets/img/logout.jpg" alt="Logout" class="logout-icon" id="logout-icon">
        </div>
    </div>
    <!-- Form to Add or Update Dish -->
    <div class="form-container border p-4">
        <h3 class="mb-4">Add a New Dish</h3>
        <form method="post" action="admin.php">
            <input type="hidden" name="id" value="<?php echo $id; ?>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" id="name" class="form-control" value="<?php echo $name; ?>" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" name="price" id="price" class="form-control" value="<?php echo $price; ?>" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" name="category" id="category" class="form-control" value="<?php echo $category; ?>" required>
            </div>
            <div class="form-group">
                <label for="ingredients">Ingredients:</label>
                <input type="text" name="ingredients" id="ingredients" class="form-control" value="<?php echo $ingredients; ?>" required>
            </div>
            <?php if ($update == true) : ?>
                <button type="submit" name="update" class="btn btn-primary">Update</button>
            <?php else : ?>
                <button type="submit" id="create-button" name="create" class="btn btn-success">Add Dish</button>
            <?php endif; ?>
        </form>
    </div>



    <!-- Display Menu Items -->
    <h3 class="mt-4 mb-4">Menu Items</h3>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Ingredients</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($menuItems)) : ?>
                    <tr>
                        <td><span class="styled-text"><?php echo htmlspecialchars($row['name']); ?></span></td>
                        <td><span class="styled-text">$<?php echo number_format($row['price'], 2); ?></span></td>
                        <td><span class="styled-text"><?php echo htmlspecialchars($row['category']); ?></span></td>
                        <td><span class="styled-text"><?php echo htmlspecialchars($row['ingredients']); ?></span></td>
                        <td class="action-links">
                            <a href="admin.php?edit=<?php echo $row['id']; ?>" class="btn btn-primary btn-sm edit-btn">Edit</a>
                            <a href="admin.php?delete=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirmDelete()">Delete</a>
                        </td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>

   


    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this item?");
        }
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var editButtons = document.querySelectorAll('.edit-btn');
            editButtons.forEach(function(button) {
                button.addEventListener('click', function(event) {
                    event.preventDefault();
                    var confirmation = confirm('Are you sure you want to edit this dish?');
                    if (confirmation) {
                        window.location.href = this.getAttribute('href');
                    }
                });
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $("#logout-icon").click(function() {
                var confirmation = confirm("Are you sure you want to logout?");
                if (confirmation) {
                    window.location.href = "logout.php";
                }
            });
        });
    </script>
    <script>
        function disableButton() {
            document.getElementById("create-button").disabled = true;
        }
    </script>



</body>

</html>