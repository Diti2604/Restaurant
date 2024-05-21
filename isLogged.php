<?php
session_start();

// Check if the "login" session variable is set
if(isset($_SESSION["login"]) && $_SESSION["login"] === true){
    // User is logged in
    echo "User is logged in.";
} else {
    // User is not logged in
    echo "User is not logged in.";
}
?>
