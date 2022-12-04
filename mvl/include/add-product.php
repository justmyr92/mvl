<?php

include 'database.php';

if (isset($_POST['addProductSubmit'])) {

    $product_id = "PID" . rand(1000000, 9999999);

    $product_name = $_POST['productName'];
    $product_price = $_POST['productPrice'];
    $product_quantity = $_POST['productStocks'];
    $product_image = $_FILES['productImage']['name'];
    $product_image_tmp = $_FILES['productImage']['tmp_name'];
    $product_category = $_POST['productType'];

    $folder = "images/products/";

    $sql = "INSERT INTO product(PRODUCT_ID, NAME, PRICE, TYPE, STOCKS, IMAGE) VALUES ('$product_id','$product_name','$product_price','$product_category','$product_quantity','$product_image')";
    if ($conn->query($sql) === TRUE) {
        if (move_uploaded_file($product_image_tmp, $folder)) {
            header("Location: ../admin.php");
        } else {
            header("Location: ../admin.php");
        }
    }
}