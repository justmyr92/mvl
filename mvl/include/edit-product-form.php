<?php
include "database.php";
$sql = "SELECT * FROM PRODUCT WHERE PRODUCT_ID = '" . $_POST['product_id'] . "';";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $name = $row['NAME'];
        $type = $row['TYPE'];
        $price = $row['PRICE'];
        $stocks = $row['STOCKS'];
    }
}
?>
<div class="mb-3">
    <input type="hidden" class="form-control" id="productID" name="productID"
        value="<?php echo $_POST['product_id']; ?>">
</div>
<div class="mb-3">
    <label for="productName" class="form-label">Name</label>
    <input type="text" class="form-control" id="productName" name="productName" placeholder="Name"
        value="<?php echo $name; ?>">
</div>
<div class="mb-3">
    <label for="productType" class="form-label">Type</label>
    <input type="text" class="form-control" id="productType" name="productType" placeholder="Type"
        value="<?php echo $type; ?>">
</div>
<div class="mb-3">
    <label for="productPrice" class="form-label">Price</label>
    <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="Price"
        value="<?php echo $price; ?>">
</div>
<div>
    <label for="productStocks" class="form-label">Stocks</label>
    <input type="number" class="form-control" id="productStocks" name="productStocks" placeholder="Stocks"
        value="<?php echo $stocks; ?>">
</div>