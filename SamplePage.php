<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test_db";
$socket = "/var/www/html/SamplePage.php"
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL query to select all text from messages table
$sql = "SELECT text FROM messages";
$result = $conn->query($sql);

// Check if there are results and display them
if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "Message: " . $row["text"] . "<br>";
    }
} else {
    echo "No messages found";
}

// Close the connection
$conn->close();
?>

