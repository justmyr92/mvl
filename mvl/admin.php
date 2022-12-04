<?php

include 'include/database.php';
session_start();
if ($_SESSION['PRIVILEGES'] != '1') {
    header("Location: index.php");
}

if (isset($_POST['editProductSubmit'])) {
    $product_id = $_POST['productID'];
    $product_name = $_POST['productName'];
    $product_price = $_POST['productPrice'];
    $product_quantity = $_POST['productStocks'];
    $product_category = $_POST['productType'];
    $sql = "UPDATE product SET NAME = '$product_name', PRICE = '$product_price', TYPE = '$product_category', STOCKS = '$product_quantity' WHERE PRODUCT_ID = '$product_id';";
    if ($conn->query($sql) === TRUE) {
        header("Location: admin.php");
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous">
    </script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,800;1,900&display=swap"
        rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">

</head>

<body>
    <header class="admin-header">
        <div class="container h-100 py-5">
            <div class="d-flex justify-content-between align-items-center h-100">
                <h3>Welcome Admin</h3>
                <a href="logout.php" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </header>
    <section class="admin-section">
        <div class="container h-100 py-5">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="products-tab" data-bs-toggle="tab"
                        data-bs-target="#products-tab-pane" type="button" role="tab" aria-controls="products-tab-pane"
                        aria-selected="true">Products</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="customer-tab" data-bs-toggle="tab" data-bs-target="#customer-tab-pane"
                        type="button" role="tab" aria-controls="customer-tab-pane"
                        aria-selected="false">Customer</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="transaction-tab" data-bs-toggle="tab"
                        data-bs-target="#transaction-tab-pane" type="button" role="tab"
                        aria-controls="transaction-tab-pane" aria-selected="false">Transaction</button>
                </li>
            </ul>
            <div class="tab-content py-3" id="myTabContent">
                <div class="tab-pane fade show active" id="products-tab-pane" role="tabpanel"
                    aria-labelledby="products-tab" tabindex="0">
                    <button type="button" class="btn btn-danger mb-3" data-bs-toggle="modal"
                        data-bs-target="#addProductModal">
                        <i class="bi bi-plus-square"></i> Add Product
                    </button>
                    <div class="table-responsive">
                        <table class="table" id="product-table">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Type</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Stocks</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $sql = "SELECT * FROM PRODUCT";
                                $result = $conn->query($sql);
                                if ($result->num_rows > 0) {
                                    while ($row = $result->fetch_assoc()) {
                                        echo "<th scope='row'>" . $row['PRODUCT_ID'] . "</th>";
                                        echo "<td><img src='https://images.pexels.com/photos/1005486/pexels-photo-1005486.jpeg?auto=compress&cs=tinysrgb&w=600' width='150'></td>";
                                        echo "<td>" . $row['NAME'] . "</td>";
                                        echo "<td>" . $row['TYPE'] . "</td>";
                                        echo "<td>" . $row['PRICE'] . "</td>";
                                        echo "<td>" . $row['STOCKS'] . "</td>";
                                        echo "<td><button type='button' id='" . $row['PRODUCT_ID'] . "'class='btn btn-success edit-product-btn' data-bs-toggle='modal' data-bs-target='#editProductModal'><i class='bi bi-pen-fill'></i> Edit</button></td>";
                                        echo "</tr>";
                                    }
                                }
                                ?>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade py-3" id="customer-tab-pane" role="tabpanel" aria-labelledby="customer-tab"
                    tabindex="0">
                    <div class="table-responsive">
                        <table class="table" id="customer-table">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Firstname</th>
                                    <th scope="col">Lastname</th>
                                    <th scope="col">Birthday</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Address</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $sql = "SELECT * FROM CUSTOMER";
                                $result = $conn->query($sql);
                                if ($result->num_rows > 0) {
                                    while ($row = $result->fetch_assoc()) {
                                        echo "<th scope='row'>" . $row['CUSTOMER_ID'] . "</th>";
                                        echo "<td>" . $row['FIRSTNAME'] . "</td>";
                                        echo "<td>" . $row['LASTNAME'] . "</td>";
                                        echo "<td>" . date('F d, Y', strtotime($row['BIRTHDAY'])) . "</td>";
                                        echo "<td>" . $row['AGE'] . "</td>";
                                        echo "<td>" . $row['ADDRESS'] . "</td>";
                                        echo "</tr>";
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade py-3" id="transaction-tab-pane" role="tabpanel"
                    aria-labelledby="transaction-tab" tabindex="0">
                    <div class="row">
                        <div class="col">
                            <div class="table-reponsive">
                                <table class="table" id="transaction-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Transaction ID</th>
                                            <th scope="col">Customer Name</th>
                                            <th scope="col">Transaction Date</th>
                                            <th scope="col">Total Amount</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        //first name and last name from customer table inner join transaction table
                                        $sql = "SELECT TRANSACTION.TRANSACTION_ID, CUSTOMER.FIRSTNAME, CUSTOMER.LASTNAME, TRANSACTION.TRANSACTION_DATE, TRANSACTION.TOTAL FROM TRANSACTION INNER JOIN CUSTOMER ON TRANSACTION.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID";
                                        $result = $conn->query($sql);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                echo "<th scope='row'>" . $row['TRANSACTION_ID'] . "</th>";
                                                echo "<td>" . $row['FIRSTNAME'] . " " . $row['LASTNAME'] . "</td>";
                                                echo "<td>" . date('F d, Y', strtotime($row['TRANSACTION_DATE'])) . "</td>";
                                                echo "<td>" . $row['TOTAL'] . "</td>";
                                                echo "<td><button type='button' id='" . $row['TRANSACTION_ID'] . "'class='btn btn-success view-transaction-btn'><i class='bi bi-eye-fill'></i> View</button></td>";
                                                echo "</tr>";
                                            }
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr class="bg-dark text-light">
                                            <th scope="col">Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody id="transaction-details-table">
                                        <tr>
                                            <td colspan="4" class="text-center">No transaction selected</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#product-table').DataTable();
        $('#customer-table').DataTable();
        $('#transaction-table').DataTable();
        $('.edit-product-btn').click(function() {
            var product_id = $(this).attr('id');
            $.ajax({
                url: "include/edit-product-form.php",
                method: "POST",
                data: {
                    product_id: product_id
                },
                success: function(data) {
                    $('.edit-product-form').html(data);
                }
            });
        });
        $('.view-transaction-btn').click(function() {
            var transaction_id = $(this).attr('id');
            $.ajax({
                url: "include/transaction-details.php",
                method: "POST",
                data: {
                    transaction_id: transaction_id
                },
                success: function(data) {
                    $('#transaction-details-table').html(data);
                }
            });
        });
    });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous">
    </script>
</body>

</html>

<form action="admin.php" method="post">
    <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="editProductModalLabel">Edit Product</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body edit-product-form">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Save changes" name="editProductSubmit">
                </div>
            </div>
        </div>
    </div>
</form>

<form action="include/add-product.php" method="post" enctype="multipart/form-data">
    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addProductModalLabel">Add Product</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productType" class="form-label">Product Type</label>
                        <input type="text" class="form-control" id="productType" name="productType" required>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Product Price</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice" required>
                    </div>
                    <div class="mb-3">
                        <label for="productStocks" class="form-label">Product Stocks</label>
                        <input type="number" class="form-control" id="productStocks" name="productStocks" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" class="form-control" id="productImage" name="productImage" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Submit" name="addProductSubmit">
                </div>
            </div>
        </div>
    </div>
</form>