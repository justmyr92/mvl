<?php

include "database.php";

// select product name and all data from orderline from product inner join order line 

$sql = "SELECT * FROM PRODUCT INNER JOIN ORDERLINE ON PRODUCT.PRODUCT_ID = ORDERLINE.PRODUCT_ID WHERE ORDERLINE.TRANSACTION_ID = '" . $_POST['transaction_id'] . "';";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $product_name = $row['NAME'];
        $product_price = $row['PRICE'];
        $product_quantity = $row['QUANTITY'];
        $subtotal = $product_price * $product_quantity;
        echo "<tr>";
        echo "<td>" . $product_name . "</td>";
        echo "<td>" . $product_price . "</td>";
        echo "<td>" . $product_quantity . "</td>";
        echo "<td>" . $subtotal . "</td>";
    }
}